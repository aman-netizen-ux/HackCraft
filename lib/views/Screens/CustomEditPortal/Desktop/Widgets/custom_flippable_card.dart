import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class CustomFlippableCard extends StatefulWidget {
  final dynamic node;
  final void Function()? onTap;
  final dynamic front;
  final dynamic back;
  const CustomFlippableCard(
      {super.key,
      required this.node,
      required this.onTap,
      required this.front,
      required this.back});

  @override
  State<CustomFlippableCard> createState() => _CustomFlippableCardState();
}

class _CustomFlippableCardState extends State<CustomFlippableCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: FlipCard(
          fill: Fill.fillBack,
          direction: FlipDirection.HORIZONTAL,
          speed: 400,
          front: widget.front,
          back: widget.back),
    );
  }
}
