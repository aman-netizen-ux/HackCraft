import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/defaultTemplateModel.dart';
import 'package:major_project__widget_testing/state/getHackathon/getSingleHackathonProvider.dart';
import 'package:major_project__widget_testing/state/loginProvider.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/Sections/about_section.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/Sections/contactUsAndFooter_section.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/Sections/gallerySection.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/Sections/landing_section.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/Sections/RoundsSection/rounds_section.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/Desktop/Sections/navbar.dart';
import 'package:provider/provider.dart';

class DefaultTemplateDesktopBody extends StatefulWidget {
  const DefaultTemplateDesktopBody(
      {super.key, required this.defaultTemplateModel, required this.isEdit});
  final DefaultTemplateApiResponse? defaultTemplateModel;
  final bool isEdit;

  @override
  State<DefaultTemplateDesktopBody> createState() =>
      _DefaultTemplateDesktopBodyState();
}

class _DefaultTemplateDesktopBodyState
    extends State<DefaultTemplateDesktopBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (!widget.isEdit) {
      loadData();
    }
  }

  void loadData() async {
    final singleHackathonProvider =
        Provider.of<SingleHackathonProvider>(context, listen: false);
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);

   

    try {

       await singleHackathonProvider.getUserType(
        widget.defaultTemplateModel!.hackathons.id, loginProvider.emailId);

        print("in screen ${singleHackathonProvider.userType}");
    } catch (error) {
      debugPrint("Error message in screen: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NavBar(
          defaultTemplateModel: widget.defaultTemplateModel,
          isEdit: widget.isEdit,
        ),
        LandingSection(defaultTemplateModel: widget.defaultTemplateModel),
        RoundsAndRules(defaultTemplateModel: widget.defaultTemplateModel),
        About(
          defaultTemplateModel: widget.defaultTemplateModel,
          isEdit: widget.isEdit,
        ),
        GallerySection(
          isEdit: widget.isEdit,
          defaultTemplateModel: widget.defaultTemplateModel,
        ),
        ContactUsAndFooterSection(
            defaultTemplateModel: widget.defaultTemplateModel)
      ],
    );
  }
}
