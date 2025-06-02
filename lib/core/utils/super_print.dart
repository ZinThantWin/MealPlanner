import 'dart:convert';
import 'dart:ui';

import 'package:flutter/foundation.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

void superPrint(var content, {var title = 'Super Print'}) {
  String callerFrame = '';

  if (kDebugMode) {
    try {
      final stackTrace = StackTrace.current;
      final frames = stackTrace.toString().split("\n");
      callerFrame = frames[1];
    } catch (e) {
      debugPrint(e.toString(), wrapWidth: 1024);
    }

    DateTime dateTime = DateTime.now();
    String dateTimeString =
        '${dateTime.hour} : ${dateTime.minute} : ${dateTime.second}.${dateTime.millisecond}';
    debugPrint('', wrapWidth: 1024);
    debugPrint(
      '- ${title.toString()} - ${callerFrame.split('(').last.replaceAll(')', '')}',
      wrapWidth: 1024,
    );
    debugPrint('____________________________');
    try {
      debugPrint(
        const JsonEncoder.withIndent(
          '  ',
        ).convert(const JsonDecoder().convert(content)),
        wrapWidth: 1024,
      );
    } catch (e1) {
      try {
        debugPrint(
          const JsonEncoder.withIndent(
            '  ',
          ).convert(const JsonDecoder().convert(jsonEncode(content))),
          wrapWidth: 1024,
        );
      } catch (e2) {
        debugPrint(content.toString());
      }
    }
    debugPrint('____________________________ $dateTimeString');
  }
}

int opacityToAlpha(double opacity) {
  assert(
    opacity >= 0.0 && opacity <= 1.0,
    'Opacity must be between 0.0 and 1.0',
  );
  return (opacity * 255).round();
}
