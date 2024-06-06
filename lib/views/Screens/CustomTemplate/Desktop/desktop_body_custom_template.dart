import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/models/customTemplateModel/customTemplateModel.dart';
import 'package:major_project__widget_testing/state/custom_template_providers/custom_edit_template_provider.dart';
import 'package:major_project__widget_testing/state/getHackathon/getSingleHackathonProvider.dart';
import 'package:major_project__widget_testing/state/loginProvider.dart';
import 'package:provider/provider.dart';

class CustomTemplateDesktopBody extends StatefulWidget {
  const CustomTemplateDesktopBody({super.key,  required this.isEdit});
  
  final bool isEdit;

  @override
  State<CustomTemplateDesktopBody> createState() => _CustomTemplateDesktopBodyState();
}

class _CustomTemplateDesktopBodyState extends State<CustomTemplateDesktopBody> {

  List<Widget> dynamicWidgets = [ Container(height:100, width:100, color: Colors.blue)];

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (!widget.isEdit) {
      loadData();
    }else{
       loadEditData();
    }
  }
  void loadEditData(){
try{
   final customEditPortalProvider = Provider.of<CustomEditPortal>(context,listen:false);
dynamicWidgets=customEditPortalProvider.dynamicWidgets;
}catch (error) {
      debugPrint("Error message in screen: $error");
    }
  }

  void loadData() async {
    final singleHackathonProvider =
        Provider.of<SingleHackathonProvider>(context, listen: false);
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
 final customEditPortalProvider = Provider.of<CustomEditPortal>(context,listen:false);
   

    try {

      dynamicWidgets=customEditPortalProvider.buildWidgetsFromJson(singleHackathonProvider.customSingleHackathon.customData.widget);
      //api call to  get the usertype of this user for this hackathon
      //  await singleHackathonProvider.getUserType(
      //   singleHackathonProvider.customSingleHackathon.hackathons.id, loginProvider.emailId);

      //   print("in screen ${singleHackathonProvider.userType}");
    } catch (error) {
      debugPrint("Error message in screen in cumtom body: $error");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(100.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...dynamicWidgets,
                  ],
                ))),
      );
  }
}