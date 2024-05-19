import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/defaultTemplateModel.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonDetailsProvider.dart';
import 'package:major_project__widget_testing/state/galleryProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/scroll_Controller.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:provider/provider.dart';

class NavBar extends StatelessWidget {
    final DefaultTemplateApiResponse? defaultTemplateModel;
 final bool isEdit;

  const NavBar({super.key, required this.defaultTemplateModel, required this.isEdit});

  @override
  Widget build(BuildContext context) {
    final hackathonDetailsProvider =
        Provider.of<HackathonDetailsProvider>(context);
    final galleryProvider = Provider.of<GalleryProvider>(context);

    return Padding(
      padding:  EdgeInsets.only(right: scaleWidth(context, 81),left:scaleWidth(context, 81), top:  scaleHeight(context, 39)),
      child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //TODO: needs to be updated
                    isEdit
                    ?galleryProvider.logo==""
                  ?Container(
                      height: scaleHeight(context, 44),
                      width: scaleHeight(context, 44),
                      color: Colors.black.withOpacity(0.3),
                      child: const Icon(Icons.add))
                  : Image.memory(
                        base64Decode(galleryProvider.logo),
                        fit: BoxFit.cover,
                        height: scaleHeight(context, 44),
                      width: scaleHeight(context, 44),
                      ): defaultTemplateModel!.hackathons.logo.isEmpty?Container(): Image.network(defaultTemplateModel!.hackathons.logo, fit: BoxFit.cover,
                        height: scaleHeight(context, 44),
                      width: scaleHeight(context, 44),),
                    SizedBox(width: scaleWidth(context, 6),),
                    Text(
                     defaultTemplateModel!.hackathons.name,
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