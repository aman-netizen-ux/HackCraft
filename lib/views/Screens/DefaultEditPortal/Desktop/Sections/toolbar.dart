import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:provider/provider.dart';

class ToolBar extends StatefulWidget {
  const ToolBar({super.key});

  @override
  State<ToolBar> createState() => _ToolBarState();
}

class _ToolBarState extends State<ToolBar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 0774,
      child: Container(
          height: scaleHeight(context, 60),
          width: double.infinity,
          decoration: BoxDecoration(
              color: grey3,
              borderRadius: BorderRadius.circular(rad5_2),
              border: Border.all(color: greyish3)),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  final hackathonTextPropertiesProvider =
                      Provider.of<HackathonTextPropertiesProvider>(context,
                          listen: false);
                  hackathonTextPropertiesProvider.increaseFontSize();
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white),
                ),
              ),
            ],
          )),
    );
  }
}
