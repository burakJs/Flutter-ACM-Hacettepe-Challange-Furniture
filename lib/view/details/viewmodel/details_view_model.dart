import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/base/model/base_view_model.dart';

part 'details_view_model.g.dart';

class DetailsViewModel = _DetailsViewModelBase with _$DetailsViewModel;

abstract class _DetailsViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {}
}
