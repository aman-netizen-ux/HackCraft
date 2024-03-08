import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonContainerPropertiesProvider.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/right_panel.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/side_panel.dart';
import 'package:provider/provider.dart';

class DefaultEditPortalDesktopBody extends StatefulWidget {
  const DefaultEditPortalDesktopBody({super.key});

  @override
  State<DefaultEditPortalDesktopBody> createState() =>
      _DefaultEditPortalDesktopBodyState();
}

class _DefaultEditPortalDesktopBodyState
    extends State<DefaultEditPortalDesktopBody> {
  final _formKey = GlobalKey<FormState>();
  String? textinput = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final hackathonTextProvider =
        Provider.of<HackathonTextPropertiesProvider>(context, listen: false);
        final hackathonContainerPropertiesProvider =
        Provider.of<HackathonContainerPropertiesProvider>(context, listen : false);

        hackathonTextProvider.selectedTextFieldKey=null;
        hackathonContainerPropertiesProvider.selectedContainerKey= null;

        //FOR TEXTFIELD
        if (hackathonTextProvider.isTextColorSelected) {
          hackathonTextProvider.setIsTextColorSelected();
        }
        if (hackathonTextProvider.isColorPickerSelected) {
          hackathonTextProvider.setIsColorPickerSelected();
        }
        if (hackathonTextProvider.isBoldSelected) {
          hackathonTextProvider.setBoldSelection();
        }

        //FOR CONTAINER
        if (hackathonContainerPropertiesProvider.activeIndex > -1) {
          hackathonContainerPropertiesProvider.setActiveIndex(-1);
          hackathonContainerPropertiesProvider.colorIndex = -1;
        }
        if (hackathonContainerPropertiesProvider.isContainerColorPickerSelected) {
          hackathonContainerPropertiesProvider.setIsContainerColorPickerSelected();
        }
      },
      child: Row(
        children: [
          Expanded(
              flex: 73,
              child: SidePanel(
                formKey: _formKey,
                textinput: textinput,
              )),
          Expanded(
              flex: 927,
              child: RightPanel(
                formKey: _formKey,
                textinput: textinput,
              ))
        ],
      ),
    );
  }
}
