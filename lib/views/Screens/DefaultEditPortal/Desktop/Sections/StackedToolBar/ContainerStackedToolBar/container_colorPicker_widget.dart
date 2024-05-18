import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonContainerPropertiesProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Components/color_tools_button.dart';
import 'package:major_project__widget_testing/views/Components/custom_colorPicker.dart';
import 'package:major_project__widget_testing/views/Components/custom_swatchPicker.dart';
import 'package:provider/provider.dart';

class ContainerColorPickerWidget extends StatefulWidget {
  const ContainerColorPickerWidget({super.key});


  @override
  State<ContainerColorPickerWidget> createState() => _ContainerColorPickerWidgetState();
}

class _ContainerColorPickerWidgetState extends State<ContainerColorPickerWidget> {
  //Need to reset _isColorPickerSelected, _selectedColorTool, isColorDropperSelected
  @override
  Widget build(BuildContext context) {
    final hackathonContainerPropertiesProvider =
        Provider.of<HackathonContainerPropertiesProvider>(context);

    // final hackathonTextProvider =
    //     Provider.of<HackathonTextPropertiesProvider>(context);

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
                                hackathonContainerPropertiesProvider.setSelectedContainerColorTool(1);
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
                                 hackathonContainerPropertiesProvider.setSelectedContainerColorTool(2);
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
                        child: hackathonContainerPropertiesProvider.selectedContainerColorTool == 2
                            ? CustomSwatchesPicker(
                                height: scaleHeight(context, 40),
                                width: scaleWidth(context, 425),
                                selectedColor: hackathonContainerPropertiesProvider
                                            .selectedContainerKey ==
                                        null
                                    ? Colors.transparent
                                    : hackathonContainerPropertiesProvider.stringToColor(
                                        hackathonContainerPropertiesProvider
                                            .selectedContainerKey!, hackathonContainerPropertiesProvider.colorIndex, hackathonContainerPropertiesProvider.type),
                                onChanged: (value) {
                                  Color primaryColor = hackathonContainerPropertiesProvider
                                      .getContainerPrimaryColor(value);
                                  hackathonContainerPropertiesProvider
                                      .containerColorChange(primaryColor.toString(), hackathonContainerPropertiesProvider.colorIndex, hackathonContainerPropertiesProvider.type);
                                })
                            : CustomSwatchesPicker(
                                height: scaleHeight(context, 40),
                                width: scaleWidth(context, 425),
                                recentColors: hackathonContainerPropertiesProvider.colors,
                                selectedColor: hackathonContainerPropertiesProvider
                                            .selectedContainerKey ==
                                        null
                                    ? Colors.transparent
                                    : hackathonContainerPropertiesProvider.stringToColor(
                                        hackathonContainerPropertiesProvider
                                            .selectedContainerKey!,  hackathonContainerPropertiesProvider.colorIndex, hackathonContainerPropertiesProvider.type),
                                onChanged: (value) {
                                  Color primaryColor = hackathonContainerPropertiesProvider
                                      .getContainerPrimaryColor(value);
                                  hackathonContainerPropertiesProvider
                                      .containerColorChange(primaryColor.toString(), hackathonContainerPropertiesProvider.colorIndex, hackathonContainerPropertiesProvider.type);
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
                                  hackathonContainerPropertiesProvider
                                      .setIsContainerColorPickerSelected();
                                },
                                child: hackathonContainerPropertiesProvider
                                            .selectedContainerKey ==
                                        null
                                    ? SvgPicture.asset(
                                            "assets/icons/defaultEditPortal/color_picker.svg")
                                    : hackathonContainerPropertiesProvider.isContainersColorsInSwatchList(
                                            hackathonContainerPropertiesProvider.stringToColor(
                                                hackathonContainerPropertiesProvider
                                                    .selectedContainerKey!, hackathonContainerPropertiesProvider.colorIndex, hackathonContainerPropertiesProvider.type), context)
                                        ? SvgPicture.asset(
                                            "assets/icons/defaultEditPortal/color_picker.svg")
                                        : Container(
                                            width: scaleWidth(context, 22),
                                            height: scaleWidth(context, 22),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: hackathonContainerPropertiesProvider
                                                    .stringToColor(
                                                        hackathonContainerPropertiesProvider
                                                            .selectedContainerKey!, hackathonContainerPropertiesProvider.colorIndex, hackathonContainerPropertiesProvider.type)),
                                          )),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          ),
          Visibility(
              visible: hackathonContainerPropertiesProvider.isContainerColorPickerSelected,
              child: ColoPickerCard(index: hackathonContainerPropertiesProvider.colorIndex)),
        ],
      ),
    );
  }
}

class ColoPickerCard extends StatefulWidget {
  const ColoPickerCard({super.key, required this.index});

  final int index;

  @override
  State<ColoPickerCard> createState() => _ColoPickerCardState();
}

class _ColoPickerCardState extends State<ColoPickerCard> {
  @override
  Widget build(BuildContext context) {
    // final hackathonTextProvider =
    //     Provider.of<HackathonTextPropertiesProvider>(context);
    final hackathonContainerPropertiesProvider =
        Provider.of<HackathonContainerPropertiesProvider>(context);

    final _colorNotifier = ValueNotifier(
      hackathonContainerPropertiesProvider.selectedContainerKey ==null
      ? Colors.transparent
      :hackathonContainerPropertiesProvider
        .stringToColor(hackathonContainerPropertiesProvider.selectedContainerKey!, widget.index, hackathonContainerPropertiesProvider.type));
    return Container(
        height: scaleHeight(context, 275),
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
                    hackathonContainerPropertiesProvider.addColor(value);
                    hackathonContainerPropertiesProvider.containerColorChange(value.toString(), hackathonContainerPropertiesProvider.colorIndex, hackathonContainerPropertiesProvider.type);
                  });

             
            }));
  }
}
