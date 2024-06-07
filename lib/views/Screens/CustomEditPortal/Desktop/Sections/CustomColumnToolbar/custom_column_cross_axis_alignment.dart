import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/state/custom_template_providers/custom_edit_template_provider.dart';
import 'package:major_project__widget_testing/utils/customTemplate_widget_keys.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:provider/provider.dart';

class CustomColumnCrossAxisAlignmentWidget extends StatefulWidget {
  const CustomColumnCrossAxisAlignmentWidget({
    super.key,
  });

  @override
  State<CustomColumnCrossAxisAlignmentWidget> createState() => _CustomColumnCrossAxisAlignmentWidgetState();
}

class _CustomColumnCrossAxisAlignmentWidgetState extends State<CustomColumnCrossAxisAlignmentWidget> {
  @override
  Widget build(BuildContext context) {
    final customEditPortalProvider = Provider.of<CustomEditPortal>(context);
    return Container(
      height: scaleHeight(context, 40),
      padding: EdgeInsets.symmetric(horizontal: scaleWidth(context, 10)),
      decoration: BoxDecoration(
          color: grey3,
          border: Border.all(color: greyish3, width: 1),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          icon: SvgPicture.asset(
              'assets/icons/defaultEditPortal/keyboardArrowDown.svg',
              color: Colors.white),
          value: customEditPortalProvider.selectedColumnCrossAlignment,
          items: customEditPortalProvider.crossAxisAlignments
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
                value: value,
                child: Text(value,
                    style: GoogleFonts.getFont(fontFamily2,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: scaleHeight(context, 20),
                        height: lineHeight(22.4, 20))));
          }).toList(),
          onChanged: (newValue) {
            customEditPortalProvider.setSelectedColumnCrossAlignment(newValue!);
            customEditPortalProvider.addPropertyByKey(
                customEditPortalProvider.selectedWidgetKey == null
                    ? customColumnKey.toString()
                    : customEditPortalProvider.selectedWidgetKey.toString(),
                'crossAxisAlignment',
                newValue);
          },
          dropdownColor: grey3,
        ),
      ),
    );
  }
}
