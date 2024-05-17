import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgPicture extends StatefulWidget {
  final dynamic node;
  final void Function()? onTap;
  const CustomSvgPicture({super.key, required this.node, required this.onTap});

  @override
  State<CustomSvgPicture> createState() => _CustomSvgPictureState();
}

class _CustomSvgPictureState extends State<CustomSvgPicture> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.onTap,
        child: SvgPicture.asset("assets/images/defaultTemplate/clickme.svg"));
  }
}
