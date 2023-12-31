import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:major_project__widget_testing/api/post_default_hackathon.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/state/Registration.dart/getRegistration.dart';
import 'package:major_project__widget_testing/state/hackathonDetailsProvider.dart';
import 'package:major_project__widget_testing/state/rulesAndRoundsProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:provider/provider.dart';

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

    final rulesProvider = Provider.of<RulesProvider>(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: scaleHeight(context, 45)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                if (widget.formKey.currentState!.validate()) {
                  widget.formKey.currentState!.save();

                  // hackathonDetailsProvider.hackathonName=widget.textinput.toString();
                  Navigator.pushNamed(context, '/defaultTemplate');
                }
              },
              child: const Icon(
                Icons.menu,
                color: Colors.white,
              )),
          Column(
            children: List.generate(6, (index) {
              int selectedSection = 2;
              return SectionButton(
                selectedSection: selectedSection,
                index: index,
              );
            }),
          ),
          InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                if (widget.formKey.currentState!.validate()) {
                  widget.formKey.currentState!.save();

                  List<Map<String, dynamic>> rounds =
                      rulesProvider.roundsList.map((round) {
                    return {
                      "serial_number":
                          rulesProvider.roundsList.indexOf(round) + 1,
                      "name": round['roundTitle'],
                      "description": round['roundDescription'],
                      "start_timeline": "${round['startDate']}T00:00:00Z",
                      "end_timeline": "${round['endDate']}T18:00:00Z"
                    };
                  }).toList();
                  print(hackathonDetailsProvider.hackathonContactNumber1);

                  await CreateHackathon().postSingleHackathon({
                    "hackathon": {
                      "name": hackathonDetailsProvider.hackathonName,
                      "organisation_name": "Gov of India",
                      "mode_of_conduct": hackathonDetailsProvider.hackathonMode,
                      "deadline": hackathonDetailsProvider.hackathonDate,
                      "team_size": 4,
                      "visible": "Public",
                      "start_date_time":
                          "${hackathonDetailsProvider.hackathonDate}T00:00:00Z",
                      "about": hackathonDetailsProvider.hackathonAbout,
                      "brief": hackathonDetailsProvider.hackathonDescription,
                      "website": "https://req",
                      "fee": 100.00,
                      "venue": hackathonDetailsProvider.hackathonVenue,
                      "contact1_name":
                          hackathonDetailsProvider.hackathonContactName1,
                      "contact1_number":
                          hackathonDetailsProvider.hackathonContactNumber1,
                      "contact2_name":
                          hackathonDetailsProvider.hackathonContactName2,
                      "contact2_number":
                          hackathonDetailsProvider.hackathonContactNumber2
                    },
                    "round": rounds,
                    "fields": [],
                    "containers": []
                  });
                }
              },
              child: SvgPicture.asset(
                  'assets/icons/defaultEditPortal/settings.svg'))
        ],
      ),
    );
  }
}

class SectionButton extends StatelessWidget {
  const SectionButton({
    super.key,
    required this.selectedSection,
    required this.index,
  });

  final int selectedSection;
  final int index;

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
        onTap: () {
          // Add your onTap functionality here
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: scaleWidth(context, 19),
            vertical: scaleHeight(context, 14),
          ),
          // margin: EdgeInsets.symmetric(
          //   vertical: scaleHeight(context, 15),
          // ).copyWith(
          //   top: index == 0
          //       ? 0
          //       : null, // Remove top margin for the first item
          //   bottom: index == 5
          //       ? 0
          //       : null, // Remove bottom margin for the last item
          // ),
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
