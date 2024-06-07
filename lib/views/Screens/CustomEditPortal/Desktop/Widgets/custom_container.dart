import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/state/Registration.dart/getRegistrationProvider.dart';
import 'package:major_project__widget_testing/state/custom_template_providers/custom_edit_template_provider.dart';
import 'package:major_project__widget_testing/state/getHackathon/getSingleHackathonProvider.dart';
import 'package:provider/provider.dart';

class CustomContainer extends StatefulWidget {
  final dynamic node;
  final void Function()? onTap;
  final List<Widget> childWidgets;
  final bool isEdit;
  const CustomContainer(
      {super.key, required this.node, required this.onTap, required this.childWidgets, required this.isEdit});

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
      onTap: (){
        print("iseditttt ${widget.isEdit}");
        if(widget.isEdit){
          widget.onTap!();
        }else{
          if(widget.node['type']=="Get Registered"){



            final singleHackathonProvider =
                          Provider.of<SingleHackathonProvider>(context,
                              listen: false);
                      String userType = singleHackathonProvider.userType;

                      //based on the usetype user is navigated to that screen
                      if (userType == "leader" || userType == "member") {
                        logger.i("participant details screen");
                      } else {
                        //go to form screen

                        Navigator.pushNamed(
                          context,
                          '/getRegistration',
                          arguments: {
                            'hackathonId': singleHackathonProvider.customSingleHackathon.hackathons.id,
                            'userType': userType,
                            'hackathonName':
                                singleHackathonProvider.customSingleHackathon.hackathons.name,
                            'teamSize': singleHackathonProvider.customSingleHackathon.hackathons.teamSize,
                            'teamId':singleHackathonProvider.teamId
                          },
                        );
                      }
                    }
          }
        
        
      },
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
             color: customEditPortalProvider.stringToColor(widget.node['properties']
            ['borderColor']), 
              width:  widget.node['properties']['borderWidth']
            ),
            borderRadius:  widget.node['properties']['shape']=="circle"?null:BorderRadius.circular(widget.node['properties']['borderRadius']),

            boxShadow: [
              BoxShadow(
                color: customEditPortalProvider.stringToColor(widget.node['properties']
            ['shadowColor']),
            blurRadius: 0,
            offset: Offset(0, 0)
              )
            ]
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
