import 'package:flutter/material.dart';

class CustomVideoPlayer extends StatefulWidget {
  final dynamic node;
  final void Function()? onTap;
  const CustomVideoPlayer({super.key, required this.node, required this.onTap});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return Text('VideoPlayer');
  }
}