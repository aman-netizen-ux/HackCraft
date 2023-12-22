import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/scroll_Controller.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/radius.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: scaleWidth(context, 81),left:scaleWidth(context, 81), top:  scaleHeight(context, 39)),
      child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //container to be updated with image logic
                    Container(
                      height: scaleHeight(context, 44),
                      width: scaleHeight(context, 44),
                      color:Colors.black.withOpacity(0.3)
                    ),
                    SizedBox(width: scaleWidth(context, 6),),
                    Text(
                      'Your Hackathon',
                      style: GoogleFonts.getFont(
                        fontFamily2,fontSize: scaleHeight(context, 20),
                        color: black1,
                        fontWeight: FontWeight.w400,
                        height: lineHeight(22.4, 20)
                      )
                    ),
                   
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        scrollToItem(home);
                      },
                      child: Text(
                        'Home',
                        style: GoogleFonts.getFont(
                          fontFamily2,fontSize: scaleHeight(context, 14),
                          color: black1,
                          fontWeight: FontWeight.w400,
                          height: lineHeight(22.4, 14)
                        )
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        scrollToItem(rulesAndRounds);
                      },
                      child: Text(
                        'Rounds',
                        style: GoogleFonts.getFont(
                          fontFamily2,fontSize: scaleHeight(context, 14),
                          color: black1,
                          fontWeight: FontWeight.w400,
                          height: lineHeight(22.4, 14)
                        )
                      ),
                    ),
                    
                    
                    TextButton(
                      onPressed: () {
                        scrollToItem(aboutUs);
                      },
                      child: Text(
                        'About Us',
                        style: GoogleFonts.getFont(
                          fontFamily2,fontSize: scaleHeight(context, 14),
                          color: black1,
                          fontWeight: FontWeight.w400,
                          height: lineHeight(22.4, 14)
                        )
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        scrollToItem(gallery);
                      },
                      child: Text(
                        'Gallery',
                        style: GoogleFonts.getFont(
                          fontFamily2,fontSize: scaleHeight(context, 14),
                          color: black1,
                          fontWeight: FontWeight.w400,
                          height: lineHeight(22.4, 14)
                        )
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                       scrollToItem(contactUs);
                      },
                      child: Text(
                        'Contact Us',
                        style: GoogleFonts.getFont(
                          fontFamily2,fontSize: scaleHeight(context, 14),
                          color: black1,
                          fontWeight: FontWeight.w400,
                          height: lineHeight(22.4, 14)
                        )
                      ),
                    ),
                  ],
                )
              ],
            ),
    );
  }
}