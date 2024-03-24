import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/custom_right_panel.dart';
import 'package:major_project__widget_testing/views/Screens/CustomEditPortal/Desktop/Sections/custom_side_panel.dart';

class CustomEditPortalDesktopBody extends StatefulWidget {
  const CustomEditPortalDesktopBody({super.key});

  @override
  State<CustomEditPortalDesktopBody> createState() =>
      _CustomEditPortalDesktopBodyState();
}

class _CustomEditPortalDesktopBodyState
    extends State<CustomEditPortalDesktopBody> {
  //final _formKey = GlobalKey<FormState>();
  String? textinput = '';

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        //    Align(
        //     alignment: Alignment.topLeft,
        //      child: InkWell(
        //       onTap: () => Navigator.pop(context),
        //       child: const Icon(Icons.arrow_back)
        //            ),
        //    ),
        //  const Text(
        //       'Coming Soon',
        //       style: TextStyle(
        //         fontSize: 48
        //       ),
        //     ),
        //   const  SizedBox(height: 25,),
        //    const Text(
        //      'Custom Edit Portal',
        //      style: TextStyle(
        //        fontSize: 24
        //      ),
        //    ),

        Expanded(
            flex: 200,
            child: CustomSidePanel(
                // formKey: _formKey,
                // textinput: textinput,
                )),
        Expanded(
            flex: 800,
            child: CustomRightPanel(
                // formKey: _formKey,
                // textinput: textinput,
                ))
      ],
    );
  }
}
