import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/template.dart';
import 'package:major_project__widget_testing/views/Screens/CreateRegistrationForm/Desktop/RegField/addFieldSection.dart';

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
          color: Color(0xf5f5f5f5), borderRadius: BorderRadius.circular(5)),
      //  height: scaleHeight(context, 672),
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
          top: scaleHeight(context, 19),
          left: scaleWidth(context, 17),
          right: scaleWidth(context, 14),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: scaleHeight(context, 14)),
              child: SizedBox(
                height: scaleHeight(context, 62),
                width: scaleWidth(context, 180),
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
                      height: scaleHeight(context, 5),
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
            SizedBox(
              width: scaleWidth(context, 200),
              height: 482,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: scaleHeight(context, 6),
                        horizontal: scaleWidth(context, 8)),
                    decoration: BoxDecoration(
                        color: Color(0xffd9d9d9),
                        borderRadius: BorderRadius.circular(5)),
                    height: scaleHeight(context, 33),
                    width: widthScaler(context, 200),
                    child: TabBar(
                      controller: fieldtabController,
                      labelPadding: EdgeInsets.zero,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xfff5f5f5),
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
                  SizedBox(
                    height: scaleHeight(context, 480),
                    child: TabBarView(
                      controller: fieldtabController,
                      children: [
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
            SizedBox(
              height: scaleHeight(context, 38),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFD9D9D9),
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
