import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

class RegistrationExpansionTile extends StatefulWidget {
  const RegistrationExpansionTile({super.key});

  @override
  State<RegistrationExpansionTile> createState() =>
      _RegistrationExpansionTileState();
}

class _RegistrationExpansionTileState extends State<RegistrationExpansionTile> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Icon(Icons.abc ,
      color: Colors.black,),
      collapsedIconColor: Colors.transparent,   
      
      trailing: null,
        title: Row(
      children: [
        Expanded(
          flex: 299,
          child: Center(
            child: Text(
              "Gradle Builers",
              style: GoogleFonts.getFont(fontFamily2,
                  fontSize: scaleHeight(context, 18),
                  fontWeight: FontWeight.w500,
                  color: darkCharcoal),
            ),
          ),
        ),
        Expanded(
          flex: 93,
          child: Container(
            height: scaleHeight(context, 40),
            width: scaleHeight(context, 40),
            color: const Color(0xffF444DD),
            alignment: Alignment.center,
            child: Text(
              "4",
              style: GoogleFonts.getFont(fontFamily2,
                  fontSize: scaleHeight(context, 18),
                  fontWeight: FontWeight.w500,
                  color: const Color(0xffFFD4FF)),
            ),
          ),
        ),
        Expanded(
          flex: 140,
          child: Center(
            child: Text(
              "10 April 2023",
              style: GoogleFonts.getFont(fontFamily2,
                  fontSize: scaleHeight(context, 16),
                  fontWeight: FontWeight.w500,
                  color: darkCharcoal),
            ),
          ),
        ),
        Expanded(
          flex: 158,
          child: Container(
            height: scaleHeight(context, 40),
            width: scaleHeight(context, 40),
            color: const Color(0xffBAEED1),
            alignment: Alignment.center,
            child: Text(
              "Completed",
              style: GoogleFonts.getFont(fontFamily2,
                  fontSize: scaleHeight(context, 16),
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff22653C)),
            ),
          ),
        ),
        Expanded(
          flex: 260,
          child: Center(
            child: Text(
              "Disha Bera",
              style: GoogleFonts.getFont(fontFamily2,
                  fontSize: scaleHeight(context, 16),
                  fontWeight: FontWeight.w500,
                  color: darkCharcoal),
            ),
          ),
        )
      ],
    ));
  }
}
