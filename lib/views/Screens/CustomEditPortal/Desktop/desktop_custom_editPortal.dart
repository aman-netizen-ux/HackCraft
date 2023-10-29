import 'package:flutter/material.dart';


class CustomEditPortalDesktopBody extends StatefulWidget {
  const CustomEditPortalDesktopBody({super.key});

  @override
  State<CustomEditPortalDesktopBody> createState() => _CustomEditPortalDesktopBodyState();
}

class _CustomEditPortalDesktopBodyState extends State<CustomEditPortalDesktopBody> {
  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
         Align(
          alignment: Alignment.topLeft,
           child: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back)
                 ),
         ),
       const Text(
            'Coming Soon',
            style: TextStyle(
              fontSize: 48
            ),
          ),
        const  SizedBox(height: 25,),
         const Text(
           'Custom Edit Portal',
           style: TextStyle(
             fontSize: 24
           ),
         ),
      ],
    );
  }
}