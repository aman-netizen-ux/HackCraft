import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/state/custom_template_providers/custom_edit_template_provider.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/utils/customTemplate_widget_keys.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/views/Components/circleCornerInputBorder.dart';
import 'package:provider/provider.dart';

class CustomText extends StatefulWidget {
  final dynamic node;
  final void Function()? onTap;
  const CustomText({super.key, required this.node, required this.onTap});

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize the text controller with the initial text value
    textController.text = widget.node['properties']['text'];
  }

  @override
  Widget build(BuildContext context) {
    final hackathonTextPropertiesProvider =
        Provider.of<HackathonTextPropertiesProvider>(context);
    final customEditDefaultProvider = Provider.of<CustomEditPortal>(context);
    return Container(
      decoration: customEditDefaultProvider.selectedWidgetKey != null &&  customEditDefaultProvider.selectedWidgetKey == customWidgetsGlobalKeysMap[widget.node["id"]]
          ? const CircleCornerBoxDecoration(
              circleBorder: blue,
              circleFill: Colors.white,
              borderSide: BorderSide(color: blue))
          : null,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: double.infinity,
        ),
        child: IntrinsicWidth(
          stepWidth: 10,
          child: TextField(
            onTap: widget.onTap,
            controller: textController,
            cursorColor: customEditDefaultProvider
                .stringToColor(widget.node['properties']['color']),
            cursorHeight: widget.node['properties']['fontSize'],
            style: GoogleFonts.getFont(
              widget.node['properties']['font'],
              fontSize: widget.node['properties']['fontSize'],
              letterSpacing: widget.node['properties']['letterSpacing'],
              color: customEditDefaultProvider
                  .stringToColor(widget.node['properties']['color']),
              height: lineHeight(widget.node['properties']['lineHeight'],
                  widget.node['properties']['fontSize']),
              fontStyle: widget.node['properties']['italics']
                  ? FontStyle.italic
                  : FontStyle.normal,
              decoration: TextDecoration.combine([
                widget.node['properties']['strikethrough']
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                widget.node['properties']['underline']
                    ? TextDecoration.underline
                    : TextDecoration.none,
              ]),
              fontWeight: hackathonTextPropertiesProvider
                  .fontWeightFromInt(widget.node['properties']['fontWeight']),
            ),
            textAlign: hackathonTextPropertiesProvider
                .getTextAlign(widget.node['properties']['align']),
            decoration:  InputDecoration(
              border: InputBorder.none, 
              hintText: widget.node['properties']['hint']
            ),
             onChanged: (value){
              if(widget.node['type']=="Text" && value.isEmpty){
                setState(() {
                  textController.text="Dynamic Text";
                value="Dynamic Text";
                });
              }
               final customEditPortalProvider = Provider.of<CustomEditPortal>(context, listen: false);
              customEditPortalProvider.addPropertyByKey(
              customEditPortalProvider.selectedWidgetKey == null
                  ? customColumnKey.toString()
                  : customEditPortalProvider.selectedWidgetKey.toString(),
              "text",
              value);
          customEditPortalProvider.dynamicWidgets = customEditPortalProvider
              .buildWidgetsFromJson(customEditPortalProvider.jsonObject);
          customEditPortalProvider.triggerUIUpdate();

          if(widget.node['type']=="Hackathon Name"){
            customEditPortalProvider.setRequiredHackathonDetails("Hackathon Name", value);
          }
           if(widget.node['type']=="Organization Name"){
            customEditPortalProvider.setRequiredHackathonDetails("Organization Name", value);
          }
           if(widget.node['type']=="Start Date"){
            customEditPortalProvider.setRequiredHackathonDetails("Start Date", value);
          }
          if(widget.node['type']=="Deadline"){
            customEditPortalProvider.setRequiredHackathonDetails("Deadline", value);
          }
          if(widget.node['type']=="Brief"){
            customEditPortalProvider.setRequiredHackathonDetails("Brief", value);
          }
          if(widget.node['type']=="Team Size"){
            customEditPortalProvider.setRequiredHackathonDetails("Team Size", value);
          }
          if(widget.node['type']=="Fee"){
            customEditPortalProvider.setRequiredHackathonDetails("Fee", value);
          }
          if(widget.node['type']=="Total Rounds"){
            customEditPortalProvider.setRequiredHackathonDetails("Total Rounds", value);
          }
          if(widget.node['type']=="Venue"){
            customEditPortalProvider.setRequiredHackathonDetails("Venue", value);
          }
          if(widget.node['type']=="Mode of Conduct"){
            customEditPortalProvider.setRequiredHackathonDetails("Mode of Conduct", value);
          }
          
            },
           
          ),
        ),
      ),
    );
  }
}
