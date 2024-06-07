import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonContainerPropertiesProvider.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/snackBar.dart';
import 'package:major_project__widget_testing/views/Components/separator.dart';
import 'package:major_project__widget_testing/views/Components/toolTip_custom_decoration.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/Canvas/canvas.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/StackedToolBar/stackedToolBar.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/Toolbar/toolbar.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class RightPanel extends StatefulWidget {
  RightPanel({super.key, required this.formKey, this.textinput});

  final GlobalKey<FormState> formKey;
  String? textinput;

  @override
  State<RightPanel> createState() => _RightPanelState();
}

class _RightPanelState extends State<RightPanel> {
  @override
  Widget build(BuildContext context) {
    final hackathonTextProvider =
        Provider.of<HackathonTextPropertiesProvider>(context);

    final hackathonContainerPropertiesProvider =
        Provider.of<HackathonContainerPropertiesProvider>(context);
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.only(
          left: scaleWidth(context, 110),
          right: scaleWidth(context, 94),
          top: scaleHeight(context, 44)),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), bottomLeft: Radius.circular(40)),
        color: grey4,
      ),
      child: Stack(
        children: [
          Column(
            children: [
              const ToolBar(),
              Expanded(flex: 0528, child: Container()),
              DefaultCanvas(
                formKey: widget.formKey,
                textinput: widget.textinput,
              )
            ],
          ),
          Visibility(
            visible: ((hackathonTextProvider.isBoldSelected ||
                        hackathonTextProvider.isTextColorSelected) &&
                    hackathonTextProvider.selectedTextFieldKey != null) ||
                (hackathonContainerPropertiesProvider.activeIndex > -1 &&
                    hackathonContainerPropertiesProvider.selectedContainerKey !=
                        null),
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                  padding: EdgeInsets.only(top: scaleHeight(context, 60)),
                  child: const StackedToolBar()),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(
                bottom: scaleHeight(context, 60),
              ),
              width: double.infinity, // Set the width to double.infinity
              child: const Separator(),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  bottom: scaleHeight(context, 30),
                  right: scaleWidth(context, 20)),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Tooltip(
                    message: "Problem Statement Recommender",
                    verticalOffset: 5,
                    decoration: const ShapeDecoration(
                      shape: ToolTipCustomDecoration(
                          side: TooltipSide.bottom,
                          borderColor: greyish3,
                          borderWidth: 0),
                      color: greyish7,
                    ),
                    child: FloatingActionButton(
                      onPressed: () async {
                        final Uri url = Uri.parse("http://127.0.0.1:5173/");
                        if (await canLaunchUrl(url)) {
                          launchUrl(url);
                        } else {
                          // ignore: use_build_context_synchronously
                          showSnackBar(
                              "Error occured!",
                              red2,
                              const Icon(
                                Icons.report_gmailerrorred_outlined,
                                color: white,
                              ),
                              context);
                        }
                      },
                      backgroundColor: Colors.black,
                      shape: const CircleBorder(),
                      child: const Icon(Icons.open_in_new, color: Colors.white),
                    ),
                  )))
        ],
      ),
    );
  }
}
