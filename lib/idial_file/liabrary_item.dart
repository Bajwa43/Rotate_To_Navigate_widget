import 'package:flutter/material.dart';

import 'featured_library_items.dart';

class LiabraryItem extends StatefulWidget {
  const LiabraryItem({super.key});

  @override
  State<LiabraryItem> createState() => _LiabraryItemState();
}

class _LiabraryItemState extends State<LiabraryItem>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late Animation<Offset> offsetAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    offsetAnimation = Tween(
      begin: const Offset(0, 0),
      end: const Offset(0, 1),
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 5,
        child: FeaturedLibraryItems(
          animationController: animationController,
        ));
  }
}
