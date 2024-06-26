import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/hackathon_model.dart';
import 'package:major_project__widget_testing/state/defaulttemplateProvider.dart';
import 'package:major_project__widget_testing/state/rulesAndRoundsProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Components/defaultTemplate_text.dart';
import 'package:provider/provider.dart';

// This file was created in order to create the card for the rounds section.
class RoundCard extends StatelessWidget {
  final String title;
  final TextFieldProperties titleTextProperties;
  final ContainerProperties containerProperties;
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
      required this.startDateTextProperties,
      required this.containerProperties});

  @override
  Widget build(BuildContext context) {
    final rulesProvider = Provider.of<RulesProvider>(context);
    final defaultTemplateProvider =
        Provider.of<DefaultTemplateProvider>(context);

    return InkWell(
      hoverColor: Colors.white,
      onTap: onTap,
      child: Container(
          height: scaleHeight(context, containerProperties.height.toDouble()),
          width: double.infinity,
          margin: EdgeInsets.only(
              bottom: scaleHeight(context, 23),
              left: scaleWidth(context, 47),
              right: scaleWidth(context, 26),
              top: scaleHeight(context, 23)),
          decoration: BoxDecoration(
              color: defaultTemplateProvider.stringToColor(containerProperties.color),
              borderRadius: BorderRadius.circular(containerProperties.borderRadius.toDouble()),
              border: Border.all(
                width: containerProperties.borderWidth.toDouble()/100 *10,
                  color: rulesProvider.selectedIndex == index
                      ? defaultTemplateProvider.stringToColor(containerProperties.focusedBorderColor)
                      : defaultTemplateProvider.stringToColor(containerProperties.borderColor),
                      strokeAlign: BorderSide.strokeAlignCenter),
              boxShadow: [
                BoxShadow(
                  color: defaultTemplateProvider.stringToColor(containerProperties.boxShadowColor),
                  blurRadius: containerProperties.blurRadius.toDouble(),
                  offset: const Offset(0, 4),
                  spreadRadius: 0,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: scaleWidth(context, 25),
                    right: scaleWidth(context, 25),
                    top: scaleHeight(context, 15)),
                //Title of the round
                child: DefaultTemplateText(
                  name: title,
                  textProperties: titleTextProperties,
                  
                ),
              ),
              //Timeline i.e Start date and End date of the round
              Padding(
                padding: EdgeInsets.only(
                    left: scaleWidth(context, 25),
                    right: scaleWidth(context, 25),
                    bottom: scaleHeight(context, 6)),
                child: Row(
                  mainAxisAlignment: defaultTemplateProvider
                      .getMainAxisAlignment(startDateTextProperties.align),
                  children: [
                    DefaultTemplateText(
                      name: '$startDate - ',
                      textProperties: startDateTextProperties,
                     
                    ),
                    DefaultTemplateText(
                      name: enddate,
                      textProperties: endDateTextProperties,
                     
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
