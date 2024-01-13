import 'package:flutter/material.dart';
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
    return  GestureDetector(
      onTap: (){
        final hackathonTextProvider =
        Provider.of<HackathonTextPropertiesProvider>(context, listen: false);
        print(hackathonTextProvider.selectedTextFieldKey);

        hackathonTextProvider.selectedTextFieldKey=null;
        print(hackathonTextProvider.selectedTextFieldKey);
      },
      child: Row(
        children: [
           Expanded(
              flex: 73,
              child: SidePanel(
                formKey: _formKey,
                textinput: textinput,
              )
            ),
          Expanded(
              flex: 927,
              child: RightPanel(
                 formKey: _formKey,
                 textinput: textinput,
              ) 
              )
        ],
      ),
    );
  }
}
