import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class NotificationIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: Icon(
            Icons.notifications_none,
            size: context.dynamicWidth(0.08),
            color: context.colorScheme.primary,
          ),
          onPressed: () {},
        ),
        Positioned(
          right: context.dynamicWidth(0.03),
          top: context.dynamicHeight(0.011),
          child: CircleAvatar(
            radius: context.dynamicWidth(0.013),
            backgroundColor: context.colorScheme.secondaryVariant,
          ),
        ),
      ],
    );
  }
}
