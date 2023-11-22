import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/state/rulesAndRoundsProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/scroll_Controller.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/Sections/RoundsSection/roundsDescriptionSection.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/Sections/RoundsSection/timelineTile.dart';
import 'package:provider/provider.dart';

class RoundsAndRules extends StatelessWidget {
  const RoundsAndRules({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the RulesProvider instance from the nearest ancestor
    // in the widget tree, using the Provider package.
    final rulesProvider = Provider.of<RulesProvider>(context);
    return Padding(
      key: rulesAndRounds,
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
                    flex: 47,
                    //This list generates all the rounds coming from the list made in the provider file. 
                    //Later on, integration with APIs will remain the same; 
                    //just the list that will be used will come from the API.
                    child: ListView(
                        shrinkWrap: true,
                        children: List.generate(rulesProvider.roundsList.length,
                            (index) {
                              //Generates the round card along with the timeline
                          return CustomTimelineTile(
                            cardIndex: index,
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
                              rulesProvider.setSelectedIndex(index);
                              rulesProvider.setDescriptionWidget(roundDetails(
                                  rulesProvider.roundsList[index]
                                      ['roundDescription']!,
                                  context));
                            },
                          );
                        }))),
                        Expanded(flex: 03, child: Container()),
                Expanded(flex: 50, child: rulesProvider.descriptionWidget),
              ],
            ),
          ),
        ],
      ),
    );
  }


//This widget was created in order to show the description of the round after clicking on any round card.
  Widget roundDetails(String roundDetails, BuildContext context) {
    return RoundsDescription(description : roundDetails);
  }
}
