import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/state/templateSelectionprovider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:provider/provider.dart';

class HostDesktopBody extends StatelessWidget {
  const HostDesktopBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit.',
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont(fontFamily2,
                  fontSize: scaleHeight(context, 54),
                  color: black1,
                  fontWeight: FontWeight.w500,
                  height: lineHeight(70, 54))),
          SizedBox(
            height: scaleHeight(context, 39),
          ),
          Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont(fontFamily2,
                  fontSize: scaleHeight(context, 18),
                  color: black1,
                  fontWeight: FontWeight.w400,
                  height: lineHeight(22, 18))),
          SizedBox(
            height: scaleHeight(context, 44),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  final templateSelectionProvider =
                      Provider.of<TemplateSelectionProvider>(context,
                          listen: false);
                  templateSelectionProvider.selectTemplate(0);
                  templateSelectionProvider.setTnC(false);
                  Navigator.pushNamed(context, '/templateSelection');
                },
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        vertical: scaleHeight(context, 5),
                        horizontal: scaleWidth(context, 39)),
                    backgroundColor: red,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(rad5_10),
                    )),
                child: Text('Continue Hosting',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(fontFamily2,
                        fontSize: scaleHeight(context, 14),
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        height: lineHeight(22, 14))),
              ),
              SizedBox(
                width: scaleWidth(context, 28),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/contactSponsors');
                },
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        vertical: scaleHeight(context, 5),
                        horizontal: scaleWidth(context, 39)),
                    backgroundColor: Colors.white,
                    elevation: 0,
                    side: const BorderSide(color: red, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(rad5_10),
                    )),
                child: Text('Contact Sponsors',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(fontFamily2,
                        fontSize: scaleHeight(context, 14),
                        color: red,
                        fontWeight: FontWeight.w600,
                        height: lineHeight(22, 14))),
              )
            ],
          )
        ],
      ),
    );
  }
}
