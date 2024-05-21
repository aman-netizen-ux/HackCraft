import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:major_project__widget_testing/api/post_default_hackathon.dart';
import 'package:major_project__widget_testing/api/upload_cloudinary.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/models/defaulTemplateModels/hackathon_model.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonContainerPropertiesProvider.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathontextProperties_provider.dart';
import 'package:major_project__widget_testing/state/defaulttemplateProvider.dart';
import 'package:major_project__widget_testing/state/default_template_providers.dart/hackathonDetailsProvider.dart';
import 'package:major_project__widget_testing/state/galleryProvider.dart';
import 'package:major_project__widget_testing/state/loginProvider.dart';
import 'package:major_project__widget_testing/state/rulesAndRoundsProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/scroll_Controller.dart';
import 'package:major_project__widget_testing/utils/snackBar.dart';
import 'package:major_project__widget_testing/views/Screens/DefaultTemplate/default_template.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/createRegistrationform.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class SidePanel extends StatefulWidget {
  SidePanel({super.key, required this.formKey, this.textinput});

  final GlobalKey<FormState> formKey;
  String? textinput;

  @override
  State<SidePanel> createState() => _SidePanelState();
}

class _SidePanelState extends State<SidePanel> {
  @override
  Widget build(BuildContext context) {
    final hackathonDetailsProvider =
        Provider.of<HackathonDetailsProvider>(context);
    final defaultTemplateProvider =
        Provider.of<DefaultTemplateProvider>(context);

    final rulesProvider = Provider.of<RulesProvider>(context);
    final hackathonTextPropertiesProvider =
        Provider.of<HackathonTextPropertiesProvider>(context);
    final hackathonContainerPropertiesProvider =
        Provider.of<HackathonContainerPropertiesProvider>(context);
    final galleryProvider = Provider.of<GalleryProvider>(
      context,
    );

    List<GlobalKey<State<StatefulWidget>>> keyValues = [
      homeEdit,
      rulesAndRoundsEdit,
      aboutUsEdit,
      galleryEdit,
      contactUsEdit
    ];

    // if (hackathonDetailsProvider.loadingPostHackathon) {
    //   // Show loading indicator

    //   return const Center(child: CircularProgressIndicator());
    // }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: scaleHeight(context, 45)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PopupMenuButton<String>(
              offset: Offset(scaleWidth(context, 50), 0),
              onSelected: (String result) async {
                var logger = Logger();
                logger.i(result);
                if (result == 'SavePreview') {
                  // if (widget.formKey.currentState!.validate()) {
                  widget.formKey.currentState!.save();

                  previewFunction(
                      rulesProvider,
                      hackathonDetailsProvider,
                      hackathonTextPropertiesProvider,
                      hackathonContainerPropertiesProvider);
                  // }
                } else if (result == 'Save') {
                  //TODO
                } else if (result == 'Host') {
                  if (widget.formKey.currentState!.validate() &&
                      galleryProvider.logoFile.isNotEmpty) {
                    widget.formKey.currentState!.save();

                    hostHackathon(
                        rulesProvider,
                        hackathonDetailsProvider,
                        hackathonTextPropertiesProvider,
                        hackathonContainerPropertiesProvider);
                  } else if (galleryProvider.logoFile.isEmpty) {
                    print("logo fill kro");
                    galleryProvider.logoError = true;
                  }
                } else if (result == 'Upload Image') {
                  final galleryProvider =
                      Provider.of<GalleryProvider>(context, listen: false);
                  if (galleryProvider.galleryImagesFile.isNotEmpty) {
                    final imageResponse = await UploadImageToCloudinary()
                        .uploadImage(galleryProvider.galleryImagesFile);
                    print("imageResponse $imageResponse");
                  }

                  if (galleryProvider.logoFile.isNotEmpty) {
                    final logoResponse = await UploadImageToCloudinary()
                        .uploadLogo(galleryProvider.logoFile[0]);
                    print("logoResponse $logoResponse");
                  }
                }
                // else if(result=='Upload Preset'){
                //           final galleryProvider = Provider.of<GalleryProvider>(context, listen: false);
                //           galleryProvider.createCloudinaryPreset();

                // }

                else {
                  Navigator.pop(context);
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'Back',
                      child: Text('Back'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Save',
                      child: Text('Save and Back'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'SavePreview',
                      child: Text('Preview'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Host',
                      child: Text('Host Hackathon'),
                    ),
                    const PopupMenuItem<String>(
                      value: 'Upload Image',
                      child: Text('Upload Image'),
                    ),
                    // const PopupMenuItem<String>(
                    //   value: 'Upload Preset',
                    //   child: Text('Upload Preset'),
                    // ),
                  ],
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              )),
          Column(
            children: List.generate(5, (index) {
              return SectionButton(
                selectedSection: defaultTemplateProvider.selectedSection,
                index: index,
                onTap: () {
                  defaultTemplateProvider.setSelectedSection(index);
                  scrollToItem(keyValues[index]);
                },
              );
            }),
          ),
          InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {},
              child: SvgPicture.asset(
                  'assets/icons/defaultEditPortal/settings.svg'))
        ],
      ),
    );
  }

  void previewFunction(
      RulesProvider rulesProvider,
      HackathonDetailsProvider hackathonDetailsProvider,
      HackathonTextPropertiesProvider hackathonTextPropertiesProvider,
      HackathonContainerPropertiesProvider
          hackathonContainerPropertiesProvider) {
    rulesProvider.setSelectedIndex(-1);
    rulesProvider.setDescriptionWidget(
        SvgPicture.asset('assets/images/defaultTemplate/clickme.svg'));

    List<TextFieldPropertiesArray> fields =
        hackathonTextPropertiesProvider.getTextProperties();
    //  following is to add roundsTextProperties according to their key in the above defined fields list
    fields = hackathonTextPropertiesProvider.addRoundsTextProperties(fields);

    hackathonDetailsProvider.textFields = fields;

    List<ContainerPropertiesArray> containers =
        hackathonContainerPropertiesProvider.getContainerProperties();
    containers = hackathonContainerPropertiesProvider
        .addRoundsContainerProperties(containers);

    hackathonDetailsProvider.containersProperties = containers;

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DefaultTemplate(
                defaultTemplateModel: hackathonDetailsProvider.hackathonDetails,
                isEdit: true,
              )),
    );
  }

  void hostHackathon(
      RulesProvider rulesProvider,
      HackathonDetailsProvider hackathonDetailsProvider,
      HackathonTextPropertiesProvider hackathonTextPropertiesProvider,
      HackathonContainerPropertiesProvider
          hackathonContainerPropertiesProvider) async {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    hackathonDetailsProvider.setLoadingPostHackathon(true);
    Timer? timer;
    timer = Timer(const Duration(seconds: 5), () {
      if (hackathonDetailsProvider.loadingPostHackathon) {
        showSnackBar(
            "Error !! Hackthon not created",
            red2,
            const Icon(
              Icons.report_gmailerrorred_outlined,
              color: white,
            ),
            context);
      }
    });
    if (hackathonDetailsProvider.loadingPostHackathon) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(child: CircularProgressIndicator());
        },
      );
    }
    final galleryProvider =
        Provider.of<GalleryProvider>(context, listen: false);
    List<String> imageResponse = [];
    String logoResponse = "";

    if (galleryProvider.galleryImagesFile.isNotEmpty) {
      imageResponse = await UploadImageToCloudinary()
          .uploadImage(galleryProvider.galleryImagesFile);
      print("imageResponse $imageResponse");
    }

    if (galleryProvider.logoFile.isNotEmpty) {
      logoResponse = await UploadImageToCloudinary()
          .uploadLogo(galleryProvider.logoFile[0]);
      print("logoResponse $logoResponse");
    }

    List<Map<String, dynamic>> rounds =
        hackathonDetailsProvider.roundsList.map((round) {
      return {
        "serial_number": hackathonDetailsProvider.roundsList.indexOf(round) + 1,
        "name": round.name,
        "description": round.description,
        "start_timeline": "${round.startTimeline}T00:00:00Z",
        "end_timeline": "${round.endTimeline}T18:00:00Z"
      };
    }).toList();

    List<TextFieldPropertiesArray> fields =
        hackathonTextPropertiesProvider.getTextProperties();
    List<ContainerPropertiesArray> containers =
        hackathonContainerPropertiesProvider.getContainerProperties();
    //  following is to add roundsTextProperties according to their key in the above defined fields list
    fields = hackathonTextPropertiesProvider.addRoundsTextProperties(fields);
    containers = hackathonContainerPropertiesProvider
        .addRoundsContainerProperties(containers);

    final hackathonId = await CreateHackathon().postSingleHackathon({
      "hackathon": {
        "created_by": loginProvider.emailId,
        "logo": logoResponse,
        "name": hackathonDetailsProvider.hackathonName,
        "organisation_name": hackathonDetailsProvider.organisationName,
        "deadline": hackathonDetailsProvider.deadline,
        "team_size": int.parse(hackathonDetailsProvider.teamSize),
        "start_date_time":
            "${hackathonDetailsProvider.startDateTime}T00:00:00Z",
        "brief": hackathonDetailsProvider.brief,
        "fee": hackathonDetailsProvider.fee,
        "total_number_rounds": rounds.length
      },
      "default": {
        "mode_of_conduct": hackathonDetailsProvider.modeOfConduct,
        "visible": "Public",
        "about": hackathonDetailsProvider.about,
        "images": imageResponse,
        "venue": hackathonDetailsProvider.venue,
        "website": "https://req",
        "contact1_name": hackathonDetailsProvider.contact1Name,
        "contact1_number": int.parse(hackathonDetailsProvider.contact1Number),
        "contact2_name": hackathonDetailsProvider.contact2Name,
        "contact2_number": int.parse(hackathonDetailsProvider.contact2Number),
        "discord": "",
        "facebook": "",
        "email": "",
        "twitter": "",
        "linkedin": "",
        "github": ""
      },
      "round": rounds,
      "fields": fields,
      "containers": containers
    }, context);
    // final hackathonId = await CreateHackathon().postSingleHackathon({
    //   "hackathon": {
    //     "name": "albin",
    //     "organisation_name": "ellickal",
    //     "mode_of_conduct": 'online',
    //     "deadline": "2024-10-10",
    //     "team_size": 4,
    //     "visible": "Public",
    //     "start_date_time":
    //         "2024-10-10T00:00:00Z",
    //     "about": "hiiii",
    //     "brief": "k",
    //     "website": "https://req",
    //     "fee": "0",
    //     "venue": "oko",
    //     "contact1_name": "po",
    //     "contact1_number": "555",
    //     "contact2_name": "yuh",
    //     "contact2_number": "78751"
    //   },
    //   "round": [{
    //     "serial_number":  1,
    //     "name": "yu",
    //     "description": "jj",
    //     "start_timeline": "2024-12-15T00:00:00Z",
    //     "end_timeline": "2024-12-15T18:00:00Z"
    //   }],
    //   "fields": [],
    //   "containers": []
    // }, context);
    hackathonDetailsProvider.setLoadingPostHackathon(false);
    timer.cancel();

    Navigator.pop(context);
    if (hackathonId.isNotEmpty) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Success'),
            content: const Text('Hackathon created successfully!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationForm(
                                hackathonId: hackathonId,
                              )));
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Uhh-Ohh!'),
            content: const Text('Something went wrong'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
            ],
          );
        },
      );
    }
  }
}

class SectionButton extends StatelessWidget {
  const SectionButton({
    super.key,
    required this.selectedSection,
    required this.index,
    this.onTap,
  });

  final int selectedSection;
  final int index;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: scaleHeight(context, 15),
      ).copyWith(
        top: index == 0 ? 0 : null, // Remove top margin for the first item
        bottom: index == 5 ? 0 : null, // Remove bottom margin for the last item
      ),
      child: InkWell(
        highlightColor: Colors.transparent,
        hoverColor: sectionSelection.withOpacity(0.2),
        splashColor: sectionSelection,
        borderRadius: BorderRadius.circular(rad5_3),
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: scaleWidth(context, 19),
            vertical: scaleHeight(context, 14),
          ),
          decoration: BoxDecoration(
            color: selectedSection == index ? sectionSelection : null,
            borderRadius: BorderRadius.circular(rad5_3),
          ),
          child: SvgPicture.asset(
              'assets/icons/defaultEditPortal/section_icon.svg'),
        ),
      ),
    );
  }
}
