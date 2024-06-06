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
late EdgeInsets padding;
late EdgeInsets margin;
@override
  void initState() {
    super.initState();
 List<dynamic> paddingValues = widget.node['properties']['padding'];
     padding = EdgeInsets.fromLTRB(
      paddingValues[0].toDouble(),
      paddingValues[1].toDouble(),
      paddingValues[2].toDouble(),
      paddingValues[3].toDouble(),
    );

    List<dynamic> marginValues = widget.node['properties']['margin'];
     margin = EdgeInsets.fromLTRB(
      marginValues[0].toDouble(),
      marginValues[1].toDouble(),
      marginValues[2].toDouble(),
      marginValues[3].toDouble(),
    );
    
  }

  @override
  void didUpdateWidget(covariant CustomContainer oldWidget) {
    super.didUpdateWidget(oldWidget);
       List<dynamic> paddingValues = widget.node['properties']['padding'];
     padding = EdgeInsets.fromLTRB(
      paddingValues[0].toDouble(),
      paddingValues[1].toDouble(),
      paddingValues[2].toDouble(),
      paddingValues[3].toDouble(),
    );
      
  List<dynamic> marginValues = widget.node['properties']['margin'];
     margin = EdgeInsets.fromLTRB(
      marginValues[0].toDouble(),
      marginValues[1].toDouble(),
      marginValues[2].toDouble(),
      marginValues[3].toDouble(),
    );
    
  }



  @override
  Widget build(BuildContext context) {
    final customEditPortalProvider = Provider.of<CustomEditPortal>(context);
    
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: widget.node['properties']['height'],
        width: widget.node['properties']['width'],
        margin: margin,
        padding: padding,
       alignment: Alignment(widget.node['properties']['alignment'][0],widget.node['properties']['alignment'][1] ),// TODO: GIVE ALIGNMENT TO THE CONTAINER
       decoration: BoxDecoration(
         color: customEditPortalProvider.stringToColor(widget.node['properties']
            ['color']), 
            shape: widget.node['properties']['shape']=="circle"? BoxShape.circle: BoxShape.rectangle,
            border: Border.all(
              color: Colors.pink.shade100,
              width:  widget.node['properties']['borderWidth']
            )
       ),
        child: widget.childWidgets.isEmpty
            ? null
            : (widget.childWidgets.length == 1
                ? widget.childWidgets.first
                : Column(children: widget.childWidgets)),
      ),
    );
  }
}
