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
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
         Expanded(
            flex: 73,
            child: SidePanel()
          ),
        Expanded(
            flex: 927,
            child: RightPanel() 
            )
      ],
    );
  }
}
