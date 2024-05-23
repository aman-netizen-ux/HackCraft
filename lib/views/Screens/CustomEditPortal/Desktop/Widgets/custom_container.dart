import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/state/custom_template_providers/custom_edit_template_provider.dart';
import 'package:provider/provider.dart';

class CustomContainer extends StatefulWidget {
  final dynamic node;
  final void Function()? onTap;
  final List<Widget> childWidgets;
  const CustomContainer(
      {super.key, required this.node, required this.onTap, required this.childWidgets});

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    final customEditPortalProvider = Provider.of<CustomEditPortal>(context);
    debugPrint('height in custom container : ${widget.node['properties']['height']}');
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: widget.node['properties']['height'],
        width: widget.node['properties']['width'],
        margin: EdgeInsets.all(widget.node['properties']['margin']),
        alignment: Alignment.center,
        color: customEditPortalProvider.stringToColor(widget.node['properties']
            ['color']), 
        child: widget.childWidgets.isEmpty
            ? null
            : (widget.childWidgets.length == 1
                ? widget.childWidgets.first
                : Column(children: widget.childWidgets)),
      ),
    );
  }
}
