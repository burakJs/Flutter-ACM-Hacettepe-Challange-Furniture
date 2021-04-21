import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class LikeContainer extends StatelessWidget {
  final bool isLiked;

  const LikeContainer({Key? key, required this.isLiked}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 15,
      backgroundColor: Colors.white,
      child: Icon(isLiked ? Icons.favorite : Icons.favorite_border_outlined,
          size: 20, color: isLiked ? context.colorScheme.secondaryVariant : context.colorScheme.primary),
    );
  }
}
