import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../view/details/view/details_view.dart';
import '../../../view/feed/model/feed_model.dart';
import '../../../view/feed/view/feed_view.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.HOME:
        return normalNavigate(FeedView());
      case NavigationConstants.DETAILS:
        final model = args.arguments as FeedModel;
        return normalNavigate(DetailsView(
          model: model,
        ));

      default:
        return MaterialPageRoute(
          builder: (context) => Center(child: Text(args.name.toString())),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
