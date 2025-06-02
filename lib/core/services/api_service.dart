import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:receipe_finder_and_meal_planner/core/constants/api_endpoints.dart';
import 'package:receipe_finder_and_meal_planner/core/constants/hive_constants.dart';
import 'package:receipe_finder_and_meal_planner/core/utils/super_print.dart';

final class ApiService {
  static const _cacheValidDuration = Duration(minutes: 30);

  Future<void> get({
    required String endpoint,
    required Map<String, dynamic> params,
    required void Function(Map<String, dynamic> data) onSuccess,
    required void Function(String error) onFailure,
  }) async {
    final box = await Hive.openBox(HiveConstants.cachedResponseBox);

    final fullParams = {
      ...params,
      'apiKey': 'd058cdb4df4b44ee91000c0043d52138',
    };

    final uri = Uri.https(ApiEndpoints.baseUrl, endpoint, fullParams);
    final cacheKey = uri.toString();

    // read from cache
    final cached = box.get(cacheKey);
    if (cached is Map &&
        cached['data'] != null &&
        cached['timestamp'] is String) {
      final timestamp = DateTime.tryParse(cached['timestamp']);
      if (timestamp != null &&
          DateTime.now().difference(timestamp) < _cacheValidDuration) {
        superPrint(
          "cache found and duration is valid ${DateTime.now().difference(timestamp)}",
        );
        final cachedData = jsonDecode(cached['data']);
        onSuccess({'res': cachedData});
        return;
      } else {
        superPrint("cache found but duration is not valid");
        box.delete(cacheKey);
      }
    }

    // Fetch from API
    try {
      superPrint("No Valid Cache Found, fetching from API");
      final response = await http.get(uri);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final decoded = jsonDecode(response.body);

        await box.put(cacheKey, {
          'data': jsonEncode(decoded),
          'timestamp': DateTime.now().toIso8601String(),
        });

        onSuccess({'res': decoded});
      } else {
        onFailure(
          'Request failed: ${response.statusCode} ${response.reasonPhrase}',
        );
      }
    } catch (e) {
      onFailure('Error fetching data: $e');
    }
  }
}
