import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/state/rulesAndRoundsProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/Canvas/DefaultRoundsSection/default_rounds_description_section.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/Canvas/DefaultRoundsSection/default_timeline_tile.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/Sections/RoundsSection/roundsDescriptionSection.dart';
import 'package:provider/provider.dart';
import 'package:dotted_border/dotted_border.dart';

class DefaultRoundsAndRules extends StatelessWidget {
  final double containerHeight;
  final double containerWidth;
  const DefaultRoundsAndRules(
      {super.key, required this.containerHeight, required this.containerWidth});

  @override
  Widget build(BuildContext context) {
    // Retrieve the RulesProvider instance from the nearest ancestor
    // in the widget tree, using the Provider package.
    final rulesProvider = Provider.of<RulesProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: defaultEditScaleWidth(containerWidth, 81),
          vertical: defaultEditScaleHeight(containerHeight, 70)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Rules And Rounds',
              style: GoogleFonts.getFont(fontFamily2,
                  fontSize: defaultEditScaleWidth(containerWidth, 48),
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  height: lineHeight(22.4, 48))),
          SizedBox(
            height: defaultEditScaleHeight(containerHeight, 27),
          ),
          Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut ante eu nisi imperdiet ullamcorper. Sed nec ante ac lorem eleifend viverra',
              style: GoogleFonts.getFont(fontFamily2,
                  fontSize: defaultEditScaleWidth(containerWidth, 18),
                  color: greyish1,
                  fontWeight: FontWeight.w400,
                  height: lineHeight(22.4, 18))),
          SizedBox(
            height: defaultEditScaleHeight(containerHeight, 58),
          ),
          SizedBox(
            height: defaultEditScaleHeight(containerHeight, 500),
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
                          return DefaultCustomTimelineTile(
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
                              rulesProvider.setEditSelectedIndex(index);
                              rulesProvider.setEditDescriptionWidget(
                                  defaultRoundDetails(
                                      rulesProvider.roundsList[index]
                                          ['roundDescription']!,
                                      context,
                                      containerHeight,
                                      containerWidth,
                                      index));
                            },
                            containerHeight: containerHeight,
                            containerWidth: containerWidth,
                          );
                        }))),
                Expanded(flex: 03, child: 
                 InkWell(
                onTap: (){
                  rulesProvider.increaseRoundsCount();
                },
                child: DottedBorder(
                    borderType: BorderType.Circle,
                    dashPattern: const [3, 7],
                    color: yellow2,
                    child: Container(
                      alignment: Alignment.center,
                      height: 20,
                      width: 20,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: const Center(child:  Icon(Icons.add, size: 12,color: yellow2,)),
                    )),
              )),
                Expanded(flex: 50, child: rulesProvider.editDescriptionWidget),
              ],
            ),
          ),
        ],
      ),
    );
  }

//This widget was created in order to show the description of the round after clicking on any round card.
  Widget defaultRoundDetails(String roundDetails, BuildContext context,
      double containerHeight, double containerWidth, int index) {
    return DefaultRoundsDescription(
        description: roundDetails,
        containerHeight: containerHeight,
        containerWidth: containerWidth,
        index: index);
  }
}
