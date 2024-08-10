import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/state/custom_template_providers/custom_edit_template_provider.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/utils/customTemplate_widget_keys.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Components/color_tools_button.dart';
import 'package:major_project__widget_testing/views/Components/custom_colorPicker.dart';
import 'package:major_project__widget_testing/views/Components/custom_swatchPicker.dart';
import 'package:provider/provider.dart';

class CustomColorPickerWidget extends StatefulWidget {
  const CustomColorPickerWidget({super.key});

  @override
  State<CustomColorPickerWidget> createState() =>
      _CustomColorPickerWidgetState();
}

class _CustomColorPickerWidgetState extends State<CustomColorPickerWidget> {
  //Need to reset _isColorPickerSelected, _selectedColorTool, isColorDropperSelected
  @override
  Widget build(BuildContext context) {
    final hackathonTextProvider =
        Provider.of<HackathonTextPropertiesProvider>(context);
    final customEditPortalProvider = Provider.of<CustomEditPortal>(context);
    return Container(
      width: scaleWidth(context, 480 + 75),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
                height: scaleHeight(context, 60),
                width: scaleWidth(context, 480),
                decoration: BoxDecoration(
                    color: grey3,
                    borderRadius: BorderRadius.circular(rad5_2),
                    border: Border.all(color: greyish3)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //TODO:  hover and clickable
                    SizedBox(
                      width: scaleWidth(context, 25),
                      // color: Colors.pink[100],
                      child: Column(
                        children: [
                          Expanded(
                            child: ColorToolsButton(
                              message: "Recents",
                              side: ColorToolsButtonSide.topleft,
                              tabIndex: 1,
                              child: SvgPicture.asset(
                                  "assets/icons/defaultEditPortal/color_palette.svg"),
                              onTap: () {
                                customEditPortalProvider
                                    .setSelectedColorTool(1);
                              },
                            ),
                          ),
                          Expanded(
                            child: ColorToolsButton(
                              message: "Swatches",
                              side: ColorToolsButtonSide.bottomleft,
                              tabIndex: 2,
                              child: SvgPicture.asset(
                                  "assets/icons/defaultEditPortal/swatches.svg"),
                              onTap: () {
                                customEditPortalProvider
                                    .setSelectedColorTool(2);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    const VerticalDivider(
                      color: greyish3,
                      width: 1,
                      thickness: 1,
                    ),

                    Container(
                        height: scaleHeight(context, 40),
                        width: scaleWidth(context, 425),
                        alignment: Alignment.center,
                        child: customEditPortalProvider.selectedColorTool == 2
                            ? CustomSwatchesPicker(
                                height: scaleHeight(context, 40),
                                width: scaleWidth(context, 425),
                                selectedColor: customEditPortalProvider
                                            .selectedWidgetKey ==
                                        null
                                    ? Colors.transparent
                                    : customEditPortalProvider.stringToColor(
                                        customEditPortalProvider
                                            .getPropertyValue(
                                                customEditPortalProvider
                                                    .jsonObject,
                                                customEditPortalProvider
                                                    .selectedWidgetKey
                                                    .toString(),
                                                customEditPortalProvider.propertyType)),
                                onChanged: (value) {
                                  Color primaryColor = hackathonTextProvider
                                      .getPrimaryColor(value);
                                  // hackathonTextProvider
                                  //     .textColorChange(primaryColor.toString());
                                  customEditPortalProvider.addPropertyByKey(
                                      customEditPortalProvider
                                                  .selectedWidgetKey ==
                                              null
                                          ? customColumnKey.toString()
                                          : customEditPortalProvider
                                              .selectedWidgetKey
                                              .toString(),
                                       customEditPortalProvider.propertyType,
                                      primaryColor.toString());
                                })
                            : CustomSwatchesPicker(
                                height: scaleHeight(context, 40),
                                width: scaleWidth(context, 425),
                                recentColors: customEditPortalProvider.colors,
                                selectedColor: customEditPortalProvider
                                            .selectedWidgetKey ==
                                        null
                                    ? Colors.transparent
                                    : customEditPortalProvider.stringToColor(
                                        customEditPortalProvider
                                            .getPropertyValue(
                                                customEditPortalProvider
                                                    .jsonObject,
                                                customEditPortalProvider
                                                    .selectedWidgetKey
                                                    .toString(),
                                                 customEditPortalProvider.propertyType)),
                                onChanged: (value) {
                                  Color primaryColor = hackathonTextProvider
                                      .getPrimaryColor(value);
                                  // hackathonTextProvider
                                  //     .textColorChange(primaryColor.toString());
                                  customEditPortalProvider.addPropertyByKey(
                                      customEditPortalProvider
                                                  .selectedWidgetKey ==
                                              null
                                          ? customColumnKey.toString()
                                          : customEditPortalProvider
                                              .selectedWidgetKey
                                              .toString(),
                                       customEditPortalProvider.propertyType,
                                      primaryColor.toString());
                                })),

                    const VerticalDivider(
                      color: greyish3,
                      width: 1,
                      thickness: 1,
                    ),

                    SizedBox(
                      width: scaleWidth(context, 25),
                      // color: Colors.pink[100],
                      child: Column(
                        children: [
                          // Expanded(
                          //   child: ColorToolsButton(
                          //     hackathonTextPropertiesProvider:
                          //         hackathonTextProvider,
                          //     message: "Color Dropper",
                          //     side: ColorToolsButtonSide.topright,
                          //     tabIndex: 3,
                          //     child: SvgPicture.asset(
                          //         "assets/icons/defaultEditPortal/color_dropper.svg"),
                          //   ),
                          // ),
                          Expanded(
                            child: ColorToolsButton(
                                message: "Color Picker",
                                tabIndex: 4,
                                side: ColorToolsButtonSide.bottomright,
                                onTap: () {
                                  customEditPortalProvider
                                      .setIsColorPickerSelected();
                                },
                                child: customEditPortalProvider
                                            .selectedWidgetKey ==
                                        null
                                    ? SvgPicture.asset(
                                        "assets/icons/defaultEditPortal/color_picker.svg")
                                    : hackathonTextProvider.isColorsInSwatchList(
                                            customEditPortalProvider.stringToColor(
                                        customEditPortalProvider
                                            .getPropertyValue(
                                                customEditPortalProvider
                                                    .jsonObject,
                                                customEditPortalProvider
                                                    .selectedWidgetKey
                                                    .toString(),
                                                 customEditPortalProvider.propertyType)),)
                                        ? SvgPicture.asset(
                                            "assets/icons/defaultEditPortal/color_picker.svg")
                                        : Container(
                                            width: scaleWidth(context, 22),
                                            height: scaleWidth(context, 22),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: customEditPortalProvider.stringToColor(
                                        customEditPortalProvider
                                            .getPropertyValue(
                                                customEditPortalProvider
                                                    .jsonObject,
                                                customEditPortalProvider
                                                    .selectedWidgetKey
                                                    .toString(),
                                                 customEditPortalProvider.propertyType)),),
                                          )),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          Visibility(
              visible: customEditPortalProvider.isColorPickerSelected,
              child: const CustomColoPickerCard()),
        ],
      ),
    );
  }
}

class CustomColoPickerCard extends StatefulWidget {
  const CustomColoPickerCard({super.key});

  @override
  State<CustomColoPickerCard> createState() => _CustomColoPickerCardState();
}

class _CustomColoPickerCardState extends State<CustomColoPickerCard> {
  @override
  Widget build(BuildContext context) {
    final hackathonTextProvider =
        Provider.of<HackathonTextPropertiesProvider>(context);
    final customEditPortalProvider = Provider.of<CustomEditPortal>(context);
    final _colorNotifier = ValueNotifier(
        customEditPortalProvider.selectedWidgetKey == null
            ? Colors.transparent
            : customEditPortalProvider.stringToColor(
                                        customEditPortalProvider
                                            .getPropertyValue(
                                                customEditPortalProvider
                                                    .jsonObject,
                                                customEditPortalProvider
                                                    .selectedWidgetKey
                                                    .toString(),
                                                 customEditPortalProvider.propertyType)));
    return Container(
        height: scaleHeight(context, 290),
        width: scaleWidth(context, 150),
        decoration: BoxDecoration(
            color: grey3,
            // borderRadius: BorderRadius.circular(rad5_2),
            border: Border.all(color: greyish3)),
        child: ValueListenableBuilder<Color>(
            valueListenable: _colorNotifier,
            builder: (_, color, __) {
              return CustomColorPicker(
                  color: color,
                  initialPicker: Picker.paletteHue,
                  pickerOrientation: PickerOrientation.portrait,
                  paletteHeight: scaleHeight(context, 170),
                  // pickerColor: color,
                  // colorPickerWidth: scaleWidth(context, 150),
                  // pickerAreaBorderRadius:
                  //     const BorderRadius.vertical(bottom: Radius.circular(4)),
                  // labelTypes: const [
                  //   ColorLabelType.hex,
                  //   ColorLabelType.rgb,
                  //   ColorLabelType.hsl,
                  //   ColorLabelType.hsv
                  // ],
                  // hexInputBar: true,
                  // paletteType: PaletteType.hslWithHue, // have to think
                  // pickerAreaHeightPercent: 0.8,
                  onChanged: (value) {
                    customEditPortalProvider.addColor(value);

                     Color primaryColor = hackathonTextProvider
                                      .getPrimaryColor(value);
                                  customEditPortalProvider.addPropertyByKey(
                                      customEditPortalProvider
                                                  .selectedWidgetKey ==
                                              null
                                          ? customColumnKey.toString()
                                          : customEditPortalProvider
                                              .selectedWidgetKey
                                              .toString(),
                                       customEditPortalProvider.propertyType,
                                      primaryColor.toString());
                  });
            }));
  }
}
