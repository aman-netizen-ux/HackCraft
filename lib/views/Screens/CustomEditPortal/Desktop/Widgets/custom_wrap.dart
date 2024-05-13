import 'package:flutter/material.dart';

class CustomWrap extends StatefulWidget {
  final dynamic node;
  final void Function()? onTap;
  final List<Widget> childWidgets;
  const CustomWrap(
      {super.key,
      required this.node,
      required this.onTap,
      required this.childWidgets});

  @override
  State<CustomWrap> createState() => _CustomWrapState();
}

class _CustomWrapState extends State<CustomWrap> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: widget.node['properties']['height'],
        width: double.infinity,
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: widget.childWidgets,
        ),
      ),
    );
  }
}
