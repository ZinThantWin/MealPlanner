import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipe_finder_and_meal_planner/core/constants/app_colors.dart';
import 'package:receipe_finder_and_meal_planner/core/utils/extensions.dart';
import 'package:receipe_finder_and_meal_planner/core/utils/super_print.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/recipe_search/presentation/_widgets/search_result_widget.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/recipe_search/presentation/bloc/recipe_event.dart';

import '../bloc/recipe_bloc.dart';
import '../bloc/recipe_state.dart';

class RecipeSearchWidget extends StatefulWidget {
  const RecipeSearchWidget({super.key});

  @override
  State<RecipeSearchWidget> createState() => _RecipeSearchWidgetState();
}

class _RecipeSearchWidgetState extends State<RecipeSearchWidget> {
  final TextEditingController _searchTEC = TextEditingController();

  Timer searchTimer = Timer.periodic(Duration.zero, (_) {});

  final ValueNotifier<bool> emptyText = ValueNotifier<bool>(true);

  @override
  void dispose() {
    _searchTEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeBloc, RecipeState>(
      builder: (context, state) {
        return Column(
          children: [
            _searchField(),
            _searchButton(state, context),
            _searchResult(state),
          ],
        );
      },
    );
  }

  Widget _searchResult(RecipeState state) =>
      Expanded(child: SearchResultWidget(result: state.searchResults));

  Widget _searchButton(RecipeState state, BuildContext ctx) => GestureDetector(
    onTap:
        state.isSearching
            ? null
            : () {
              if (_searchTEC.text.isEmpty) return;
              ctx.read<RecipeBloc>().add(RecipeSearchEvent(_searchTEC.text));
            },
    child: AnimatedContainer(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      duration: const Duration(milliseconds: 200),
      width: state.isSearching ? 50 : 110,
      height: 50,
      decoration: BoxDecoration(
        border:
            state.isSearching ? Border.all(color: AppColors.primary) : Border(),
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(state.isSearching ? 50 : 5),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withAlpha(opacityToAlpha(0.2)),
            blurRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Center(
        child:
            state.isSearching
                ? 25.loadingWidget(color: AppColors.primary)
                : FittedBox(
                  child: Text(
                    "Search",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: AppColors.black,
                    ),
                  ),
                ),
      ),
    ),
  );

  Widget _searchField() => Stack(
    alignment: Alignment.centerRight,
    children: [
      Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.gray),
        ),
        child: TextField(
          controller: _searchTEC,
          onChanged: (input) => emptyText.value = input.isEmpty,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Lets make a recipe!",
          ),
        ),
      ),
      _clearTextWidget(),
    ],
  );

  Widget _clearTextWidget() => ValueListenableBuilder(
    valueListenable: emptyText,
    builder:
        (context, empty, _) => Builder(
          builder: (context) {
            return Visibility(
              visible: !empty,
              child: Positioned(
                right: 35,
                child: GestureDetector(
                  onTap: () {
                    _searchTEC.clear();
                    emptyText.value = true;
                  },
                  child: Icon(Icons.clear),
                ),
              ),
            );
          },
        ),
  );
}
