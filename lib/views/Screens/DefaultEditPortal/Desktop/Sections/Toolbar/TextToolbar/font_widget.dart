import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';

class FontWidget extends StatelessWidget {
  const FontWidget({
    super.key,
    required this.hackathonTextProvider,
  });

  final HackathonTextPropertiesProvider hackathonTextProvider;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: scaleWidth(context, 10)),
      decoration: BoxDecoration(
          color: grey3,
          border: Border.all(color: greyish3, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          icon: SvgPicture.asset(
              'assets/icons/defaultEditPortal/keyboardArrowDown.svg',
              color: Colors.white),
          value: hackathonTextProvider.selectedFont,
          items: hackathonTextProvider.myGoogleFonts
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
                value: value,
                child: Text(value,
                    style: GoogleFonts.getFont(
                      value,
                      color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: scaleHeight(context, 20),
                        height: lineHeight(22.4, 20))));
          }).toList(),
          onChanged: (newValue) {
            hackathonTextProvider.setSelectedFont(newValue!);
            hackathonTextProvider.updateFontForSelectedTextField();
          },
          dropdownColor: grey3,
        ),
      ),
    );
  }
}
