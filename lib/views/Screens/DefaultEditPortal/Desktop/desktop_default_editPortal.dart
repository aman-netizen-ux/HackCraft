import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/right_panel.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/side_panel.dart';

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
    return  Row(
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
    );
  }
}
