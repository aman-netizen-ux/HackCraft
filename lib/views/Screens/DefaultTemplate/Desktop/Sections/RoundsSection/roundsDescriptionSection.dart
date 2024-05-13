import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/hackathon_model.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonContainerPropertiesProvider.dart';
import 'package:major_project__widget_testing/state/defaulttemplateProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Components/defaultTemplate_text.dart';
import 'package:provider/provider.dart';

class RoundsDescription extends StatelessWidget {
  final String description;
  final TextFieldProperties decriptionProperties;
  final ContainerProperties descriptionContainerProperties;
  const RoundsDescription(
      {super.key,
      required this.description,
      required this.decriptionProperties,
      required this.descriptionContainerProperties});

  @override
  Widget build(BuildContext context) {
    final defaultTemplateProvider =
        Provider.of<DefaultTemplateProvider>(context);
    final hackathonContainerPropertiesProvider =
        Provider.of<HackathonContainerPropertiesProvider>(context);
    return Container(
        width: scaleWidth(context, 550),
        height: scaleHeight(
            context, descriptionContainerProperties.height.toDouble()),
        child: Stack(children: [
          Positioned(
            left: scaleWidth(context, 31),
            top: scaleHeight(context, 0),
            child: Container(
              width: scaleWidth(context, 486),
              height: scaleHeight(context,
                  0.64 * descriptionContainerProperties.height.toDouble()),
              decoration: ShapeDecoration(
                  color: defaultTemplateProvider.stringToColor(
                      hackathonContainerPropertiesProvider.returnColor(
                          1, descriptionContainerProperties.color)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          descriptionContainerProperties.borderRadius
                              .toDouble()),
                      side: BorderSide(
                          color: defaultTemplateProvider.stringToColor(
                              hackathonContainerPropertiesProvider.returnColor(
                                  1, descriptionContainerProperties.borderColor)),
                          width: descriptionContainerProperties.borderWidth.toDouble() / 100 * 10,
                          strokeAlign: BorderSide.strokeAlignInside)),
                  shadows: [
                    BoxShadow(
                        blurRadius: descriptionContainerProperties.blurRadius
                            .toDouble(),
                        offset: const Offset(0, -4),
                        spreadRadius: 0,
                        color: defaultTemplateProvider.stringToColor(
                            hackathonContainerPropertiesProvider.returnColor(1,
                                descriptionContainerProperties.boxShadowColor)))
                  ]),
            ),
          ),
          Positioned(
              left: 0,
              top: 33,
              child: Container(
                width: scaleWidth(context, 550),
                height: scaleHeight(context,
                    0.72 * descriptionContainerProperties.height.toDouble()),
                padding: EdgeInsets.only(
                    top: scaleHeight(context, 21),
                    left: scaleWidth(context, 31),
                    right: scaleWidth(context, 19),
                    bottom: scaleHeight(context, 66)),
                decoration: ShapeDecoration(
                  color: defaultTemplateProvider.stringToColor(
                      hackathonContainerPropertiesProvider.returnColor(
                          0, descriptionContainerProperties.color)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          descriptionContainerProperties.borderRadius
                              .toDouble()),
                      side: BorderSide(
                          color: defaultTemplateProvider.stringToColor(
                              hackathonContainerPropertiesProvider.returnColor(
                                  0,
                                  descriptionContainerProperties.borderColor)),
                          width: descriptionContainerProperties.borderWidth
                                  .toDouble() /
                              100 *
                              10,
                          strokeAlign: BorderSide.strokeAlignInside)),
                ),
                child: DefaultTemplateText(
                  name: description,
                  textProperties: decriptionProperties,
                  height: 22.4,
                ),
              )),
          Positioned(
              left: scaleWidth(context, 229),
              top: scaleHeight(context,
                  0.68 * descriptionContainerProperties.height.toDouble()),
              child: Container(
                width: scaleWidth(context, 114),
                height: scaleHeight(context,
                    0.23 * descriptionContainerProperties.height.toDouble()),
                decoration: ShapeDecoration(
                    color: defaultTemplateProvider.stringToColor(
                        hackathonContainerPropertiesProvider.returnColor(
                            2, descriptionContainerProperties.color)),
                    shape: CircleBorder(
                        side: BorderSide(
                            color: defaultTemplateProvider.stringToColor(
                                hackathonContainerPropertiesProvider.returnColor(
                                    2,
                                    descriptionContainerProperties
                                        .borderColor)),
                            width: descriptionContainerProperties.borderWidth
                                    .toDouble() /
                                100 *
                                10,
                            strokeAlign: BorderSide.strokeAlignInside))),
              ))
        ]));
  }
}
