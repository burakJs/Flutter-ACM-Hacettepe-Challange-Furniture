import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CategoryContainer extends StatelessWidget {
  final String word;
  final bool isClicked;

  CategoryContainer({Key? key, required this.word, required this.isClicked}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isClicked ? context.colorScheme.background : context.colorScheme.onSurface,
      ),
      height: 1,
      child: Center(
          child: Text(
        word.tr(),
        style: context.textTheme.headline6!.copyWith(color: isClicked ? context.colorScheme.primaryVariant : context.colorScheme.primary),
      )),
    );
  }
}
