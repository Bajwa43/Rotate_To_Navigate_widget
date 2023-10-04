import 'package:flutter/material.dart';
// import 'package:stack_slider_animation_music/song_list_item.dart';
import 'animation_manager.dart';
import 'image_wrapper.dart';
// import 'library_data.dart';
// import 'song_action_buttons.dart';
// import 'package:flutter_playlist_animation/utils/animation_manager.dart';
// import 'package:flutter_playlist_animation/utils/library_data.dart';
// import 'package:flutter_playlist_animation/widgets/image_wrapper.dart';
// import 'package:flutter_playlist_animation/widgets/song_action_buttons.dart';
// import 'package:flutter_playlist_animation/widgets/song_list_item.dart';

class PlaylistPage extends StatefulWidget {
  const PlaylistPage({
    super.key,
    required this.routeAnimation,
    required this.image,
    required this.heroTag,
  });

  final Animation<double> routeAnimation;
  final String image;
  final String heroTag;

  @override
  State<PlaylistPage> createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  late final Animation<double> appBarOffsetAnimation;
  late final Animation<Offset> contentOffsetAnimation;

  @override
  void initState() {
    appBarOffsetAnimation = Tween(begin: -100.0, end: 0.0).animate(
      CurvedAnimation(
        parent: widget.routeAnimation,
        curve: const Interval(0.5, 1, curve: Curves.easeOut),
      ),
    );
    contentOffsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: widget.routeAnimation,
        curve: const Interval(0.5, 1, curve: Curves.easeOut),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AnimatedBuilder(
            animation: appBarOffsetAnimation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, appBarOffsetAnimation.value),
                child: AppBar(),
              );
            },
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 300,
                child: Hero(
                  tag: widget.heroTag,
                  child: Transform(
                    transform: AnimationManager.endTransformMatrix,
                    alignment: Alignment.center,
                    child: ImageWrapper(image: widget.image),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
