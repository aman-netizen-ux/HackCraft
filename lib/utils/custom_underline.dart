import 'package:flutter/material.dart';

class CustomUnderlineInputBorder extends UnderlineInputBorder {
  CustomUnderlineInputBorder({
    BorderSide borderSide = const BorderSide(),
    BorderRadius borderRadius = const BorderRadius.vertical(),
  }) : super(borderSide: borderSide, borderRadius: borderRadius);

  @override
  CustomUnderlineInputBorder copyWith({BorderSide? borderSide, BorderRadius? borderRadius}) {
    return CustomUnderlineInputBorder(
      borderSide: borderSide ?? this.borderSide,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  InputBorder customBorder({
    BorderSide borderSide = BorderSide.none,
    BorderRadius borderRadius = const BorderRadius.vertical(),
  }) {
    return CustomUnderlineInputBorder(borderRadius: borderRadius);
  }
}
