import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/hackathon_model.dart';
import 'package:major_project__widget_testing/state/rulesAndRoundsProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Components/defaultTemplate_text.dart';
import 'package:provider/provider.dart';

// This file was created in order to create the card for the rounds section.
class RoundCard extends StatelessWidget {
  final String title;
  final TextFieldProperties titleTextProperties;
  final int index;
  final void Function()? onTap;
  final String enddate;
  final String startDate;
  final TextFieldProperties endDateTextProperties;
  final TextFieldProperties startDateTextProperties;
  const RoundCard(
      {super.key,
      required this.title,
      required this.enddate,
      required this.startDate,
      this.onTap,
      required this.index,
      required this.titleTextProperties,
      required this.endDateTextProperties,
      required this.startDateTextProperties});

  @override
  Widget build(BuildContext context) {
    final rulesProvider = Provider.of<RulesProvider>(context);
    

    return InkWell(
      hoverColor: Colors.white,
      onTap: onTap,
      child: Container(
          // height: scaleHeight(context, 67),
          width: double.infinity,
          margin: EdgeInsets.only(
              bottom: scaleHeight(context, 23),
              left: scaleWidth(context, 47),
              right: scaleWidth(context, 26),
              top: scaleHeight(context, 23)),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(rad5_3),
              border: Border.all(
                  color: rulesProvider.selectedIndex == index
                      ? black1
                      : Colors.transparent),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: scaleWidth(context, 25),
                    top: scaleHeight(context, 15)),
                //Title of the round
                child: DefaultTemplateText(
                  name: title,
                  textProperties: titleTextProperties,
                  height: 22.4,
                ),
              ),
              //Timeline i.e Start date and End date of the round
              Padding(
                padding: EdgeInsets.only(
                    left: scaleWidth(context, 25),
                    bottom: scaleHeight(context, 6)),
                child: Row(
                  children: [
                    DefaultTemplateText(
                      name: '$startDate - ',
                      textProperties: startDateTextProperties,
                      height: 22.4,
                    ),
                    DefaultTemplateText(
                      name: enddate,
                      textProperties: endDateTextProperties,
                      height: 22.4,
                    ),
                    
                  ],
                ),
              )
            ],
          )),
    );
  }
}
