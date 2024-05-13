import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/responsive/responsive_layout.dart';
import 'package:major_project__widget_testing/views/Screens/ContactSponsors/Desktop/desktop_contact_sponsors.dart';

class ContactSponsors extends StatefulWidget {
  const ContactSponsors({super.key});

  @override
  State<ContactSponsors> createState() => _ContactSponsorsState();
}

class _ContactSponsorsState extends State<ContactSponsors> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        backgroundColor: Colors.purple.shade300,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 100,
                height: 50,
                color: Colors.white,
              ),
              CustomPaint(
                size: Size(double.infinity, 200), // Adjusted for additional blocks
                painter: RedLinePainter(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(9, (index) => 
                  Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        color: Colors.white,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(9, (innerIndex) => 
                          Container(
                            width: 15, // Smaller size for the 9 blocks
                            height: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      
    
    );
  }
}

class RedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2;
    final topRect = Rect.fromLTWH(size.width / 2 - 50, 0, 100, 50);
    final bottomBlockWidth = size.width / 9;
    final middleOfTopRect = Offset(topRect.center.dx, topRect.bottom);

    for (var i = 0; i < 9; i++) {
      final blockX = bottomBlockWidth * i + bottomBlockWidth / 2;
      final double blockY = 50 + 20; // Adjusted for the space between the top rect and the 9 blocks
      final double bottomBlockTopY = 150 + 20; // Adjusted for the vertical distance to the 9 bottom blocks

      // Draw the line to the center of each of the top 9 blocks
      canvas.drawLine(
        middleOfTopRect,
        Offset(blockX, blockY),
        paint,
      );

      // Draw the lines connecting each top block to its 9 bottom blocks
      for (var j = 0; j < 9; j++) {
        final innerBlockX = blockX - bottomBlockWidth / 2 + bottomBlockWidth / 9 * (j + 0.5);
        canvas.drawLine(
          Offset(blockX, blockY),
          Offset(innerBlockX, bottomBlockTopY),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
    // SafeArea(
      // child: 
      // Scaffold(
        
        
        // backgroundColor: Colors.white,
        // body: SingleChildScrollView(
        //   child: ResponsiveLayout(
        //     mobileBody: const ContactSponsorsDesktopBody(), //TODO: Add mobile body
        //     desktopBody: const ContactSponsorsDesktopBody(),
        //     tabletBody: const ContactSponsorsDesktopBody(),  //TODO: Add tablet body
        //   ),
        // ),


        
//       ),
//     );
//   }
// }