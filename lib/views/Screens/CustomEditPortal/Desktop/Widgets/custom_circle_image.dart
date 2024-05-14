import 'package:flutter/material.dart';

class CustomCircleImage extends StatefulWidget {
  final dynamic node;
  final void Function()? onTap;
  const CustomCircleImage({super.key, required this.node, required this.onTap});

  @override
  State<CustomCircleImage> createState() => _CustomCircleImageState();
}

class _CustomCircleImageState extends State<CustomCircleImage> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.onTap,
        child: const CircleAvatar(
          radius: 60.0,
          backgroundImage: AssetImage(
              "assets/images/defaultTemplate/GalleryImage.png"), // Assuming the path is a constant
        ));
  }
}
