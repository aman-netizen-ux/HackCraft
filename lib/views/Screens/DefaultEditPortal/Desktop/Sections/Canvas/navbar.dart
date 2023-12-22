import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/state/hackathonDetailsProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:provider/provider.dart';

class DefaultEditNavBar extends StatelessWidget {
  final double containerHeight;
  final double containerWidth;
  const DefaultEditNavBar(
      {super.key, required this.containerHeight, required this.containerWidth});

  @override
  Widget build(BuildContext context) {
    final hackathonNameController = TextEditingController();
    final hackathonDetailsProvider =
        Provider.of<HackathonDetailsProvider>(context);
    if(hackathonDetailsProvider.hackathonName.isNotEmpty){
      hackathonNameController.text = hackathonDetailsProvider.hackathonName;
    }
    return Padding(
      padding: EdgeInsets.only(
          right: defaultEditScaleWidth(containerWidth, 81),
          left: defaultEditScaleWidth(containerWidth, 81),
          top: defaultEditScaleHeight(containerHeight, 39)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              //container to be updated with image logic
              Container(
                  height: defaultEditScaleHeight(containerHeight, 44),
                  width: defaultEditScaleHeight(containerHeight, 44),
                  color: Colors.black.withOpacity(0.3)),
              SizedBox(
                width: defaultEditScaleWidth(containerWidth, 6),
              ),
              SizedBox(
                width: defaultEditScaleWidth(containerWidth, 266),
                child: TextFormField(
                  controller: hackathonNameController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: 'Your Hackathon',
                    hintStyle: GoogleFonts.getFont(fontFamily2,
                        fontSize: defaultEditScaleHeight(containerHeight, 20),
                        color: black1,
                        fontWeight: FontWeight.w400,
                        height: lineHeight(22.4, 20)),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    counterText: "",
                  ),
                  maxLength: 30,
                  keyboardType: TextInputType.text,
                  style: GoogleFonts.getFont(fontFamily2,
                      fontSize: defaultEditScaleHeight(containerHeight, 20),
                      color: black1,
                      fontWeight: FontWeight.w400,
                      height: lineHeight(22.4, 20)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    hackathonDetailsProvider.hackathonName = value.toString();
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: Text('Home',
                    style: GoogleFonts.getFont(fontFamily2,
                        fontSize: defaultEditScaleHeight(containerHeight, 14),
                        color: black1,
                        fontWeight: FontWeight.w400,
                        height: lineHeight(22.4, 14))),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Rounds',
                    style: GoogleFonts.getFont(fontFamily2,
                        fontSize: defaultEditScaleHeight(containerHeight, 14),
                        color: black1,
                        fontWeight: FontWeight.w400,
                        height: lineHeight(22.4, 14))),
              ),
              TextButton(
                onPressed: () {},
                child: Text('About Us',
                    style: GoogleFonts.getFont(fontFamily2,
                        fontSize: defaultEditScaleHeight(containerHeight, 14),
                        color: black1,
                        fontWeight: FontWeight.w400,
                        height: lineHeight(22.4, 14))),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Gallery',
                    style: GoogleFonts.getFont(fontFamily2,
                        fontSize: defaultEditScaleHeight(containerHeight, 14),
                        color: black1,
                        fontWeight: FontWeight.w400,
                        height: lineHeight(22.4, 14))),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Contact Us',
                    style: GoogleFonts.getFont(fontFamily2,
                        fontSize: defaultEditScaleHeight(containerHeight, 14),
                        color: black1,
                        fontWeight: FontWeight.w400,
                        height: lineHeight(22.4, 14))),
              ),
            ],
          )
        ],
      ),
    );
  }
}
