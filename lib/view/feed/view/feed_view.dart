import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/view/base_widget.dart';
import '../../../core/components/button/buy_button.dart';
import '../../../core/components/container/category_container.dart';
import '../../../core/components/container/like_container.dart';
import '../../../core/components/notification/notification_icon.dart';
import '../../../core/constants/image/image_constants.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../model/feed_model.dart';
import '../model/feed_view_state.dart';
import '../viewmodel/feed_view_model.dart';

class FeedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<FeedViewModel>(
        viewModel: FeedViewModel(),
        onModelReady: (model) {
          model.setContext(context);
        },
        onPageBuilder: (BuildContext context, FeedViewModel viewModel) => Scaffold(
              appBar: buildAppBar(context),
              body: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: FeedViewItems.values.length,
                itemBuilder: (context, index) {
                  switch (FeedViewItems.values[index]) {
                    case FeedViewItems.SEARCH:
                      return buildPaddingSearch(context);
                    case FeedViewItems.CATEGORIES:
                      return buildSizedBoxCategories(context, viewModel);
                    case FeedViewItems.PRODUCTS:
                      return buildPaddingProductsGrid(context, viewModel);
                    default:
                      return throw Exception();
                  }
                },
              ),
              bottomNavigationBar: buildContainerBottomNavigationBar(context),
            ));
  }

  Padding buildPaddingProductsGrid(BuildContext context, FeedViewModel viewModel) {
    return Padding(
      padding: EdgeInsets.only(top: context.lowValue),
      child: SizedBox(
        height: context.dynamicHeight(0.6),
        child: GridView.builder(
          padding: context.paddingLow,
          itemCount: viewModel.cardImages.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            mainAxisSpacing: context.lowValue,
            crossAxisSpacing: context.lowValue,
          ),
          itemBuilder: (context, index) {
            var _model = viewModel.cardImages[index];
            return buildCardProduct(context, _model, viewModel, index);
          },
        ),
      ),
    );
  }

  Widget buildCardProduct(BuildContext context, FeedModel _model, FeedViewModel viewModel, int index) {
    return GestureDetector(
      onTap: () {
        NavigationService.instance.navigateToPage(path: '/details', object: _model);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: context.paddingLow,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildExpandedCardTop(context, _model),
              buildTextName(_model, context),
              Text('\$${_model.money}'),
              buildRowStar(context, _model),
              BuyButton(
                width: context.dynamicWidth(0.6),
                height: context.dynamicHeight(0.04),
                child: Text(
                  LocaleKeys.buy.tr(),
                  style: context.textTheme.subtitle1!.copyWith(color: context.colorScheme.primaryVariant),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Text buildTextName(FeedModel _model, BuildContext context) {
    return Text(
      _model.name,
      style: context.textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),
    );
  }

  Expanded buildExpandedCardTop(BuildContext context, FeedModel _model) {
    return Expanded(
      flex: 4,
      child: Stack(
        children: [buildContainerImage(context, _model), buildPositionedLike(_model)],
      ),
    );
  }

  Row buildRowStar(BuildContext context, FeedModel _model) {
    return Row(
      children: [
        Icon(Icons.star, color: context.colorScheme.surface),
        Text('  ${_model.star}'),
      ],
    );
  }

  Container buildContainerImage(BuildContext context, FeedModel _model) {
    return Container(
      width: context.dynamicWidth(0.6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: context.colorScheme.onSurface,
      ),
      child: Image.asset(_model.image),
    );
  }

  Positioned buildPositionedLike(FeedModel _model) {
    return Positioned(
      top: 7,
      right: 7,
      child: LikeContainer(
        isLiked: _model.isLiked,
      ),
    );
  }

  Container buildContainerBottomNavigationBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: context.colorScheme.background,
      ),
      width: context.width,
      height: context.dynamicHeight(0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildIconButtonBottomNavigationBar(context, Icons.home),
          buildIconButtonBottomNavigationBar(context, Icons.shopping_bag_outlined),
          buildIconButtonBottomNavigationBar(context, Icons.star_border),
          buildIconButtonBottomNavigationBar(context, Icons.person_outline_outlined),
        ],
      ),
    );
  }

  IconButton buildIconButtonBottomNavigationBar(BuildContext context, IconData icon) =>
      IconButton(icon: Icon(icon, color: context.colorScheme.primaryVariant, size: context.dynamicWidth(0.08)), onPressed: () {});

  SizedBox buildSizedBoxCategories(BuildContext context, FeedViewModel viewModel) {
    return SizedBox(
      height: context.dynamicHeight(0.05),
      child: ListView.builder(
          itemExtent: 100,
          padding: context.paddingLow,
          itemCount: viewModel.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: context.horizontalPaddingLow,
              child: CategoryContainer(word: viewModel.categories[index], isClicked: index == 0),
            );
          }),
    );
  }

  Padding buildPaddingSearch(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.mediumValue,
        horizontal: context.lowValue,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 6,
            child: buildTextFieldSearch(context),
          ),
          Spacer(),
          buildSizedBoxSearchButton(context),
        ],
      ),
    );
  }

  TextField buildTextFieldSearch(BuildContext context) {
    return TextField(
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          prefixIcon: Icon(
            Icons.search,
            size: 35,
            color: context.colorScheme.primary.withOpacity(0.7),
          ),
          hintText: 'search',
          hintStyle: context.textTheme.headline6!.copyWith(color: context.colorScheme.primary.withOpacity(0.7))),
    );
  }

  SizedBox buildSizedBoxSearchButton(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.13),
      height: context.dynamicWidth(0.13),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: context.colorScheme.primaryVariant,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Icon(
          Icons.settings,
          color: context.colorScheme.primary,
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      leading: buildPaddingCircleAvatar(context),
      title: buildColumnAppBarTitle(context),
      actions: [NotificationIcon()],
    );
  }

  Padding buildPaddingCircleAvatar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.lowValue),
      child: CircleAvatar(
        backgroundImage: AssetImage(ImageConstants.instance.circleAvatar),
      ),
    );
  }

  Column buildColumnAppBarTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.welcome.tr(),
          style: context.textTheme.subtitle1!.copyWith(color: context.colorScheme.primary, fontWeight: FontWeight.w600),
        ),
        Text(
          LocaleKeys.welcomSubTitle.tr(),
          style: context.textTheme.headline6!.copyWith(color: context.colorScheme.primary, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
