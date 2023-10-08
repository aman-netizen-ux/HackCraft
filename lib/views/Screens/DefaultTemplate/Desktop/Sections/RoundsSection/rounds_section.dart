import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/state/rulesAndRoundsProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/Sections/RoundsSection/timelineTile.dart';
import 'package:provider/provider.dart';

class RoundsAndRules extends StatelessWidget {
  const RoundsAndRules({super.key});

  @override
  Widget build(BuildContext context) {
    final rulesProvider = Provider.of<RulesProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: scaleWidth(context, 81),
          vertical: scaleHeight(context, 70)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Rules And Rounds',
              style: GoogleFonts.getFont(fontFamily2,
                  fontSize: scaleWidth(context, 48),
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  height: lineHeight(22.4, 48))),
          SizedBox(
            height: scaleHeight(context, 27),
          ),
          Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut ante eu nisi imperdiet ullamcorper. Sed nec ante ac lorem eleifend viverra',
              style: GoogleFonts.getFont(fontFamily2,
                  fontSize: scaleWidth(context, 18),
                  color: greyish1,
                  fontWeight: FontWeight.w400,
                  height: lineHeight(22.4, 18))),
          SizedBox(
            height: scaleHeight(context, 58),
          ),
          SizedBox(
            height: scaleHeight(context, 500),
            child: Row(
              children: [
                Expanded(
                    flex: 5,
                    child: ListView(
                        shrinkWrap: true,
                        children: List.generate(rulesProvider.roundsList.length,
                            (index) {
                          return CustomTimelineTile(
                            isFirst: index == 0,
                            isLast:
                                rulesProvider.roundsList.length - 1 == index,
                            roundTitle: rulesProvider.roundsList[index]
                                ['roundTitle']!,
                            roundDescription: rulesProvider.roundsList[index]
                                ['roundDescription']!,
                            endDate: rulesProvider.roundsList[index]
                                ['endDate']!,
                            startDate: rulesProvider.roundsList[index]
                                ['startDate']!,
                            onTap: () {
                              rulesProvider.setDescriptionWidget(roundDetails(
                                  rulesProvider.roundsList[index]
                                      ['roundDescription']!,
                                  context));
                            },
                          );
                        }))),
                Expanded(flex: 5, child: rulesProvider.descriptionWidget),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget roundDetails(String roundDetails, BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: scaleWidth(context, 100)),
      child: Text(roundDetails,
          textAlign: TextAlign.center,
          style: GoogleFonts.getFont(fontFamily2,
              fontSize: scaleHeight(context, 20),
              color: greyish1,
              fontWeight: FontWeight.w400,
              height: lineHeight(22.4, 18))),
    );
  }
}
