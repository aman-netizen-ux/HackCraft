import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/state/custom_template_providers/custom_edit_template_provider.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
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
    return InkWell(
      onTap: widget.onTap,
      child: TextField(
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
        decoration: const InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))), // Remove the underline of the TextField
        ),
      ),
    );
  }
}
