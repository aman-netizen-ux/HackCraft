import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/state/defaulttemplateProvider.dart';
import 'package:major_project__widget_testing/state/hackathonDetailsProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/scroll_Controller.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/Canvas/DefaultRoundsSection/default_rounds_section.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/Canvas/default_aboutus.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/Canvas/default_contactUs.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/Canvas/default_edit_landing_section.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/Canvas/default_gallerySection.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultEditPortal/Desktop/Sections/Canvas/navbar.dart';
import 'package:provider/provider.dart';

class DefaultCanvas extends StatefulWidget {
  DefaultCanvas({super.key, required this.formKey, this.textinput});

  final GlobalKey<FormState> formKey;
  String? textinput;

  @override
  State<DefaultCanvas> createState() => _DefaultCanvasState();
}

class _DefaultCanvasState extends State<DefaultCanvas> {
        ScrollController _scrollController = ScrollController();
        List<GlobalKey> keyValues = [homeEdit, rulesAndRoundsEdit, aboutUsEdit, galleryEdit, contactUsEdit];



  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }


void _scrollListener() {
  final defaultTemplateProvider = Provider.of<DefaultTemplateProvider>(context, listen: false);
  double currentScroll = _scrollController.offset;

  for (int i = 0; i < keyValues.length; i++) {
    GlobalKey key = keyValues[i];
    BuildContext? currentContext = key.currentContext;

    if (currentContext != null) {
      RenderBox box = currentContext.findRenderObject() as RenderBox;
      Offset position = box.localToGlobal(Offset.zero);
      double yStart = position.dy;
      double yEnd = yStart + box.size.height;

      // Check if the section's top or bottom is within the viewport
      if ((yStart <= currentScroll && yEnd >= currentScroll) ||
          (yStart >= currentScroll && yStart <= (currentScroll + MediaQuery.of(context).size.height))) {
        defaultTemplateProvider.setSelectedSection(i);
        break; // Exit the loop once the current section is found
      }
    }
  }
}




  @override
  Widget build(BuildContext context) {
    double whiteContainerWidth =
        (scaleWidth(context, 1280) * 927 / (73 + 927)) -
            scaleWidth(context, 204);
    double whiteContainerHeight =
        (scaleHeight(context, 820) * 8698 / (528 + 774 + 8698)) -
            scaleHeight(context, 60);
    final hackathonDetailsProvider =
        Provider.of<HackathonDetailsProvider>(context);

    


    return Expanded(
      flex: 8698,
      child: Container(
        //TODO: will change this color afterwards
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: Form(
            key: widget.formKey,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(children: [
                Container(
                   key: homeEdit,
                    color: Colors.white,
                    child: Column(
                      children: [
                        DefaultEditNavBar(
                            containerHeight: whiteContainerHeight,
                            containerWidth: whiteContainerWidth),
                        DefaultEditLandingSection(
                         
                            containerHeight: whiteContainerHeight,
                            containerWidth: whiteContainerWidth),
                      ],
                    )),
                Container(
                   key: rulesAndRoundsEdit,
                  color: Colors.blue[100],
                  child: DefaultRoundsAndRules(
                      containerHeight: whiteContainerHeight,
                      containerWidth: whiteContainerWidth),
                ),
                Container(
                  key: aboutUsEdit,
                  color: Colors.white,
                  child: DefaultEditAboutus(
                      containerHeight: whiteContainerHeight,
                      containerWidth: whiteContainerWidth),
                ),
                Container(
                key: galleryEdit,
                  color: Colors.blue[100],
                  child: DefaultEditGallerySection(
                      containerHeight: whiteContainerHeight,
                      containerWidth: whiteContainerWidth),
                ),
                Container(
                  key: contactUsEdit,
                  color: Colors.white,
                  child: DefaultEditContactUsAndFooterSection(
                      containerHeight: whiteContainerHeight,
                      containerWidth: whiteContainerWidth),
                ),
                Container(
                  color: grey4,
                  height: scaleHeight(context, 60),
                )
              ]),
            )),
      ),
    );
  }
}






//  ListView(
//             children: [
//               Container(
//                 height: scaleHeight(context, 615),
//                 width: double.infinity,
//                 color: Colors.blue[100],
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       controller: text2controller,
//                       onSaved: (value) {
//                         hackathonDetailsProvider.hackathonName =
//                             value.toString();
//                       },
//                       decoration: InputDecoration(hintText: "TextField"),
//                     ),
//                     TextFormField(
//                       controller: textcontroller,
//                       onSaved: (value) {
//                         _text2 = value;
//                       },
//                       decoration: InputDecoration(hintText: "Hackathon Name"),
//                     ),
//                   ],
//                 ),
//               ),
//               InkWell(
//                 onTap: () {
//                   if (widget.formKey.currentState!.validate()) {
//                     widget.formKey.currentState!.save();

//                     hackathonDetailsProvider.hackathonName = _text2.toString();
//                     Navigator.pushNamed(context, '/defaultTemplate');
//                   }
//                 },
//                 child: Container(
//                   height: scaleHeight(context, 615),
//                   width: double.infinity,
//                   color: Colors.pink[100],
//                 ),
//               ),
//               Container(
//                 height: scaleHeight(context, 615),
//                 width: double.infinity,
//                 color: Colors.brown[300],
//               ),
//               Container(
//                 height: scaleHeight(context, 400),
//                 width: double.infinity,
//                 color: Colors.purple[200],
//               ),
//               Container(
//                 height: scaleHeight(context, 60),
//                 width: double.infinity,
//                 color: grey4,
//               ),
//             ],
//           ),
