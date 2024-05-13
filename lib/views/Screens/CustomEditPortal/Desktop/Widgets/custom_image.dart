import 'package:flutter/material.dart';

class CustomImage extends StatefulWidget {
  final dynamic node;
  final void Function()? onTap;
  const CustomImage({super.key, required this.node, required this.onTap});

  @override
  State<CustomImage> createState() => _CustomImageState();
}

class _CustomImageState extends State<CustomImage> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.onTap,
        child: Image.asset("assets/images/defaultTemplate/GalleryImage.png"));
  }
}
