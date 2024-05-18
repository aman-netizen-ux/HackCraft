import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonDetailsProvider.dart';
import 'package:major_project__widget_testing/state/galleryProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/views/Components/circleCornerInputBorder.dart';
import 'package:major_project__widget_testing/views/Components/toolTip_custom_decoration.dart';
import 'package:provider/provider.dart';

class DefaultEditNavBar extends StatefulWidget {
  final double containerHeight;
  final double containerWidth;
  const DefaultEditNavBar(
      {super.key, required this.containerHeight, required this.containerWidth});

  @override
  State<DefaultEditNavBar> createState() => _DefaultEditNavBarState();
}

class _DefaultEditNavBarState extends State<DefaultEditNavBar> {
  late TextEditingController hackathonNameController;
  bool _isDisposed = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   hackathonNameController = TextEditingController();
   final hackathonDetailsProvider = Provider.of<HackathonDetailsProvider>(context, listen: false);

  // Set the initial text for the controller
  hackathonNameController.text = hackathonDetailsProvider.hackathonName;

  // Listen for changes in the provider and update the controller accordingly
  hackathonDetailsProvider.addListener(() {
    if (!_isDisposed && hackathonNameController.text != hackathonDetailsProvider.hackathonName) {
      hackathonNameController.text = hackathonDetailsProvider.hackathonName;
    }
  });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _isDisposed=true;
    hackathonNameController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    //final hackathonNameController = TextEditingController();
    final hackathonDetailsProvider =
        Provider.of<HackathonDetailsProvider>(context);
  final galleryProvider = Provider.of<GalleryProvider>(context);

    if(hackathonDetailsProvider.hackathonName.isNotEmpty){
      hackathonNameController.text = hackathonDetailsProvider.hackathonName;
    }
    return Padding(
      padding: EdgeInsets.only(
          right: defaultEditScaleWidth(widget.containerWidth, 81),
          left: defaultEditScaleWidth(widget.containerWidth, 81),
          top: defaultEditScaleHeight(widget.containerHeight, 39)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              //container to be updated with image logic
                Tooltip(
            message: galleryProvider.logo==""? "Click to add":"Change your logo",
            verticalOffset: 5,
            decoration: const ShapeDecoration(
              shape: ToolTipCustomDecoration(
                  side: TooltipSide.top, borderColor: greyish3, borderWidth: 0),
              color: greyish7,
            ),
                child: InkWell(
                  onTap: (){
                    galleryProvider.pickLogo();
                  },
                  child: Container(
                    padding:EdgeInsets.all(defaultEditScaleWidth(widget.containerWidth, 8)),
                    decoration:galleryProvider.logoError?  CircleCornerBoxDecoration(
                    circleBorder:  red,
                    circleFill:  Colors.white,
                    borderSide: const BorderSide(color: red)):null,
                    child: galleryProvider.logo==""
                    ?Container(
                        height: defaultEditScaleHeight(widget.containerHeight, 44),
                        width: defaultEditScaleHeight(widget.containerHeight, 44),
                        color: Colors.black.withOpacity(0.3),
                        child: const Icon(Icons.add))
                    : Image.memory(
                          base64Decode(galleryProvider.logo),
                          fit: BoxFit.cover,
                          height:defaultEditScaleHeight(widget.containerHeight, 44),
                          width: defaultEditScaleHeight(widget.containerHeight, 44),
                        ),
                  ),
                ),
              ),
              SizedBox(
                width: defaultEditScaleWidth(widget.containerWidth, 6),
              ),
              SizedBox(
                width: defaultEditScaleWidth(widget.containerWidth, 266),
                child: TextFormField(
                  controller: hackathonNameController,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: 'Your Hackathon',
                    hintStyle: GoogleFonts.getFont(fontFamily2,
                        fontSize: defaultEditScaleHeight(widget.containerHeight, 20),
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
                      fontSize: defaultEditScaleHeight(widget.containerHeight, 20),
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
                    hackathonDetailsProvider.hackathonName= value.toString();
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
                        fontSize: defaultEditScaleHeight(widget.containerHeight, 14),
                        color: black1,
                        fontWeight: FontWeight.w400,
                        height: lineHeight(22.4, 14))),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Rounds',
                    style: GoogleFonts.getFont(fontFamily2,
                        fontSize: defaultEditScaleHeight(widget.containerHeight, 14),
                        color: black1,
                        fontWeight: FontWeight.w400,
                        height: lineHeight(22.4, 14))),
              ),
              TextButton(
                onPressed: () {},
                child: Text('About Us',
                    style: GoogleFonts.getFont(fontFamily2,
                        fontSize: defaultEditScaleHeight(widget.containerHeight, 14),
                        color: black1,
                        fontWeight: FontWeight.w400,
                        height: lineHeight(22.4, 14))),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Gallery',
                    style: GoogleFonts.getFont(fontFamily2,
                        fontSize: defaultEditScaleHeight(widget.containerHeight, 14),
                        color: black1,
                        fontWeight: FontWeight.w400,
                        height: lineHeight(22.4, 14))),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Contact Us',
                    style: GoogleFonts.getFont(fontFamily2,
                        fontSize: defaultEditScaleHeight(widget.containerHeight, 14),
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
