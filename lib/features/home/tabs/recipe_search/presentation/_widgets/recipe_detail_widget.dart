import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:receipe_finder_and_meal_planner/core/_widgets/cached_network_image.dart';
import 'package:receipe_finder_and_meal_planner/core/constants/app_colors.dart';
import 'package:receipe_finder_and_meal_planner/core/utils/extensions.dart';
import 'package:receipe_finder_and_meal_planner/core/utils/flutter_super_scaffold.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/favorites/presentation/widget/favourite_widget.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/recipe_search/domain/recipe_detail_entity.dart';
import 'package:receipe_finder_and_meal_planner/features/home/tabs/recipe_search/presentation/bloc/recipe_state.dart';

import '../bloc/recipe_bloc.dart';
import '../bloc/recipe_event.dart';

class RecipeDetailWidget extends StatefulWidget {
  const RecipeDetailWidget({
    super.key,
    required this.id,
    required this.imageUrl,
    this.recipeDetail,
  });
  final int id;
  final String imageUrl;
  final RecipeDetailEntity? recipeDetail;

  /// this is for offline

  @override
  State<RecipeDetailWidget> createState() => _RecipeDetailWidgetState();
}

class _RecipeDetailWidgetState extends State<RecipeDetailWidget> {
  @override
  void initState() {
    _getDetailRecipe();
    super.initState();
  }

  void _getDetailRecipe() {
    widget.recipeDetail == null
        ? context.read<RecipeBloc>().add(FetchRecipeDetailEvent(widget.id))
        : context.read<RecipeBloc>().add(
          SetRecipeDetailEvent(widget.recipeDetail!),
        );
  }

  @override
  Widget build(BuildContext context) {
    return FlutterSuperScaffold(
      isTopSafe: false,
      isBotSafe: false,
      appBar: AppBar(backgroundColor: AppColors.white),
      body: Column(
        children: [
          Hero(
            tag: widget.imageUrl,
            child: SizedBox(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: CachedImage(imageUrl: widget.imageUrl, fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: BlocBuilder<RecipeBloc, RecipeState>(
              builder:
                  (context, state) =>
                      state.gettingDetail
                          ? _loadingWidget()
                          : state.detailRecipe == null
                          ? Center(child: Text("Unexpected error occurred"))
                          : _detail(state.detailRecipe!),
            ),
          ),
        ],
      ),
    );
  }

  Widget _detail(RecipeDetailEntity detail) => SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [Spacer(), FavouriteIconButton(recipe: detail)]),
              20.heightBox(),
              Text(detail.title, style: _titleTextStyle()),
              10.heightBox(),
              Text(
                "- Ready In ${detail.readyInMinutes} mins",
                style: _normalTextStyle(),
              ),
              10.heightBox(),
              Text("Instructions", style: _titleTextStyle()),
              ...detail.instructions.map(
                (e) => Text("- $e", style: _normalTextStyle()),
              ),
              10.heightBox(),
              Text("Ingredients", style: _titleTextStyle()),
              ...detail.ingredients.map(
                (e) => Text("- $e", style: _normalTextStyle()),
              ),
              50.heightBox(),
            ],
          ),
        ),
      ],
    ),
  );

  TextStyle _titleTextStyle() =>
      TextStyle(fontWeight: FontWeight.w500, fontSize: 18);

  TextStyle _normalTextStyle() =>
      TextStyle(fontWeight: FontWeight.w400, fontSize: 16);

  Widget _loadingWidget() =>
      Center(child: 30.loadingWidget(color: AppColors.primary));
}
