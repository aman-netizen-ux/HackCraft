 import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

class Referral extends StatefulWidget {
  const Referral({super.key});

  @override
  State<Referral> createState() => _ReferralState();
}

class _ReferralState extends State<Referral> {
  @override
  Widget build(BuildContext context) {
    return Container(width: double.infinity, height: scaleHeight(context, 820), color :  Color(0xffdfe1e2),child: Text("I'm in referral"));
  }
}