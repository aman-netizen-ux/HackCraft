import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

showSnackBar(String message, Color backgroundColor,Icon icon,context){
  return Toastification().show(
    context: context,
    autoCloseDuration: const Duration(seconds: 5),
    title: Text(message),
    animationDuration: const Duration(milliseconds: 300),
    icon: icon,
    backgroundColor: backgroundColor,
    progressBarTheme: ProgressIndicatorThemeData(color: Colors.white,linearTrackColor: backgroundColor),
    foregroundColor: Colors.white,
    padding: const EdgeInsets.all(16),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    borderRadius: BorderRadius.circular(8),
    showProgressBar: true,
    closeButtonShowType: CloseButtonShowType.always,
    closeOnClick: false,
    pauseOnHover: true,
  );
}