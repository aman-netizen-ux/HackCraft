import 'package:flutter/material.dart';


class DefaultEditPortalDesktopBody extends StatefulWidget {
  const DefaultEditPortalDesktopBody({super.key});

  @override
  State<DefaultEditPortalDesktopBody> createState() => _DefaultEditPortalDesktopBodyState();
}

class _DefaultEditPortalDesktopBodyState extends State<DefaultEditPortalDesktopBody> {
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
           'Default Edit Portal',
           style: TextStyle(
             fontSize: 24
           ),
         ),
          const SizedBox(height: 25,),

          ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, '/defaultTemplate');
            }, 
            child: const Text(
           'Preview',
           style: TextStyle(
             fontSize: 21
           ),
         ))
        
      ],
    );
  }
}