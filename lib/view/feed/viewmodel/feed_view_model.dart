import '../../../core/base/model/base_view_model.dart';
import '../../../core/constants/image/image_constants.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../model/feed_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'feed_view_model.g.dart';

class FeedViewModel = _FeedViewModelBase with _$FeedViewModel;

abstract class _FeedViewModelBase with Store, BaseViewModel {
  final List<String> categories = [
    LocaleKeys.category_chair,
    LocaleKeys.category_all,
    LocaleKeys.category_sofa,
    LocaleKeys.category_table,
    LocaleKeys.category_lamp
  ];

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {}

  @observable
  List<FeedModel> cardImages = [
    FeedModel('Black Chair', ImageConstants.instance.blackChair, 201.00, 4.5, false),
    FeedModel('Blue Yutte', ImageConstants.instance.blueChair, 201.00, 4.5, false),
    FeedModel('Orange Cent', ImageConstants.instance.orangeChair, 201.00, 4.5, false),
    FeedModel('Clovidennt', ImageConstants.instance.grayChair, 201.00, 4.5, false),
  ];

  @action
  void setLike(int index) {
    cardImages[index].isLiked = !cardImages[index].isLiked;
    print(cardImages[index].isLiked);
    cardImages = cardImages;
  }
}
