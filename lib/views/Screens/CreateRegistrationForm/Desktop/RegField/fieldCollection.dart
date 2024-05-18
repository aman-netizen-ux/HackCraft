import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/state/Registration.dart/createRegistrationProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/template.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/addFieldSection.dart';
import 'package:provider/provider.dart';

class FieldsCollection extends StatelessWidget {
  const FieldsCollection({
    super.key,
    required this.fieldtabController,
  });

  final TabController fieldtabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xf5f5f5f5),
          borderRadius: BorderRadius.circular(5)),
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
          top: scaleHeight(context, 19),
          left: scaleWidth(context, 17),
          right: scaleWidth(context, 14),
          bottom: scaleHeight(context, 47),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: scaleHeight(context, 14)),
              child: SizedBox(
                // height: scaleHeight(context, 68),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Add Field",
                      style: GoogleFonts.firaSans(
                          fontSize: scaleHeight(context, 21),
                          fontWeight: FontWeight.w500,
                          color: darkCharcoal),
                    ),
                    SizedBox(
                      height: scaleHeight(context, 3),
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet,  consectetur adipiscing elit.",
                      style: GoogleFonts.firaSans(
                          fontSize: scaleHeight(context, 12),
                          fontWeight: FontWeight.w400,
                          color: darkCharcoal),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: scaleHeight(context, 6),
                        horizontal: scaleWidth(context, 8)),
                    decoration: BoxDecoration(
                        color: lightSilver,
                        borderRadius: BorderRadius.circular(5)),
                    height: scaleHeight(context, 33),
                    width: widthScaler(context, 200),
                    child: TabBar(
                      controller: fieldtabController,
                      labelPadding: EdgeInsets.zero,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xfff5f5f5),
                      ),
                      tabs: [
                        Tab(
                          child: Text(
                            'Fields',
                            style: GoogleFonts.firaSans(
                                color: const Color(0xff000000),
                                fontSize: heightScaler(context, 14),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Templates',
                            style: GoogleFonts.firaSans(
                                color: const Color(0xff000000),
                                fontSize: heightScaler(context, 14),
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: scaleHeight(context, 10),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: fieldtabController,
                      children: const [
                        AddFieldSection(),
                        Templates(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: scaleHeight(context, 25),
            ),
            InkWell(
              onTap: () {
                final createRegistrationProvider =
                    Provider.of<CreateRegistrationProvider>(context,
                        listen: false);
                createRegistrationProvider.setTabField(
                    "New Tab ${createRegistrationProvider.tabField.length + 1}");
                createRegistrationProvider.refreshTabs();
                createRegistrationProvider.formcontroller
                    .animateTo(createRegistrationProvider.tabField.length - 1);
                //createRegistrationProvider.resetEditingState(createRegistrationProvider.tabField.length - 1);
              },
              child: Container(
                height: scaleHeight(context, 38),
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: lightSilver,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Text(
                  "New Section",
                  style: GoogleFonts.firaSans(
                    fontWeight: FontWeight.w400,
                    color: darkCharcoal,
                    fontSize: scaleHeight(context, 12),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
