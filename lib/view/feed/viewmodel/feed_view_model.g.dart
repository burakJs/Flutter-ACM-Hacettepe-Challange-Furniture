// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FeedViewModel on _FeedViewModelBase, Store {
  final _$cardImagesAtom = Atom(name: '_FeedViewModelBase.cardImages');

  @override
  List<FeedModel> get cardImages {
    _$cardImagesAtom.reportRead();
    return super.cardImages;
  }

  @override
  set cardImages(List<FeedModel> value) {
    _$cardImagesAtom.reportWrite(value, super.cardImages, () {
      super.cardImages = value;
    });
  }

  final _$_FeedViewModelBaseActionController =
      ActionController(name: '_FeedViewModelBase');

  @override
  void setLike(int index) {
    final _$actionInfo = _$_FeedViewModelBaseActionController.startAction(
        name: '_FeedViewModelBase.setLike');
    try {
      return super.setLike(index);
    } finally {
      _$_FeedViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cardImages: ${cardImages}
    ''';
  }
}
