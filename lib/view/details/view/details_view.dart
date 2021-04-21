import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../core/base/view/base_widget.dart';
import '../../../core/components/button/buy_button.dart';
import '../../../core/extension/string_extension.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../feed/model/feed_model.dart';
import '../viewmodel/details_view_model.dart';

class DetailsView extends StatelessWidget {
  final FeedModel model;

  const DetailsView({Key? key, required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BaseView<DetailsViewModel>(
      viewModel: DetailsViewModel(),
      onModelReady: (model) {
        model.setContext(context);
      },
      onPageBuilder: (BuildContext context, DetailsViewModel value) => Scaffold(
        appBar: buildAppBar(context),
        body: Column(
          children: [
            Expanded(flex: 2, child: Image.asset(model.image)),
            Expanded(flex: 3, child: buildContainerBottom(context)),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: buildTextAppBar(context),
      actions: [buildPaddingActions(context)],
    );
  }

  Text buildTextAppBar(BuildContext context) {
    return Text(
      LocaleKeys.detailProduct.tr(),
      style: context.textTheme.headline5!.copyWith(fontWeight: FontWeight.bold, color: context.colorScheme.primary),
    );
  }

  Padding buildPaddingActions(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.favorite,
          color: context.colorScheme.secondaryVariant,
        ),
      ),
    );
  }

  Container buildContainerBottom(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        color: context.colorScheme.primaryVariant,
      ),
      child: Padding(
        padding: context.paddingMedium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(model.name, style: context.textTheme.headline4!.copyWith(fontWeight: FontWeight.bold, color: context.colorScheme.primary)),
            buildRowCount(context),
            buildRowColorPicker(context),
            Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
                "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,"
                ' when an unknown printer took a galley of type and scrambled it to make a type'
                ' specimen book. It has survived not only five centuries'),
            buildRowCost(context),
            buildRowBuy(context)
          ],
        ),
      ),
    );
  }

  Row buildRowCount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildContainerStar(context),
        Row(
          children: [
            buildContainerCount(context, context.colorScheme.onSurface, buildIconRemove(context)),
            buildContainerCount(context, context.colorScheme.onSurface.withOpacity(0.4), buildCenterCountText(context)),
            buildContainerCount(context, context.colorScheme.background, buildIconAdd(context)),
          ],
        )
      ],
    );
  }

  Row buildRowColorPicker(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(LocaleKeys.color.tr(), style: context.textTheme.headline5!.copyWith(fontWeight: FontWeight.bold)),
        buildCircleAvatarColorPicker(context, context.colorScheme.error),
        buildCircleAvatarColorPicker(context, context.colorScheme.background),
        buildCircleAvatarColorPicker(context, context.colorScheme.onPrimary),
        buildCircleAvatarColorPicker(context, context.colorScheme.onSecondary),
        context.emptySizedWidthBoxHigh
      ],
    );
  }

  Row buildRowCost(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('\$${model.money.toString().toCostFirst}', style: context.textTheme.headline5!.copyWith(fontWeight: FontWeight.bold)),
        Text('.${model.money.toString().toCostLast}', style: context.textTheme.subtitle1!.copyWith(fontWeight: FontWeight.w600)),
      ],
    );
  }

  Row buildRowBuy(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildCircleAvatarShopBag(context),
        BuyButton(
          width: context.dynamicWidth(0.6),
          height: context.dynamicHeight(0.065),
          child: Text(
            LocaleKeys.buy.tr(),
            style: context.textTheme.headline5!.copyWith(
              color: context.colorScheme.primaryVariant,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  CircleAvatar buildCircleAvatarShopBag(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: context.colorScheme.onSurface,
      child: Icon(
        Icons.shopping_bag_outlined,
        color: context.colorScheme.primary,
        size: 30,
      ),
    );
  }

  CircleAvatar buildCircleAvatarColorPicker(BuildContext context, Color color) {
    return CircleAvatar(
      backgroundColor: color,
      radius: 15,
    );
  }

  Icon buildIconAdd(BuildContext context) => Icon(Icons.add, color: context.colorScheme.primaryVariant);

  Icon buildIconRemove(BuildContext context) => Icon(Icons.remove, color: context.colorScheme.primaryVariant);

  Center buildCenterCountText(BuildContext context) =>
      Center(child: Text('1', style: context.textTheme.headline6!.copyWith(fontWeight: FontWeight.bold)));

  Container buildContainerCount(BuildContext context, Color color, Widget widget) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: color,
        ),
        width: color == context.colorScheme.onSurface.withOpacity(0.4) ? context.dynamicWidth(0.13) : context.dynamicWidth(0.08),
        height: context.dynamicWidth(0.075),
        child: widget);
  }

  Container buildContainerStar(BuildContext context) {
    return Container(
      width: context.dynamicWidth(0.15),
      height: context.dynamicWidth(0.075),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: context.colorScheme.background,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.star,
            color: context.colorScheme.surface,
            size: 15,
          ),
          Text(
            '${model.star}',
            style: context.textTheme.subtitle2!.copyWith(color: context.colorScheme.primaryVariant),
          )
        ],
      ),
    );
  }
}
