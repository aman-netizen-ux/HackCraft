import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/state/loginProvider.dart';
import 'package:major_project__widget_testing/state/rulesAndRoundsProvider.dart';
import 'package:major_project__widget_testing/state/templateSelectionprovider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/snackBar.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:provider/provider.dart';
import 'package:major_project__widget_testing/views/Screens/TempelateSelection/Desktop/terms_and_conditions_popup.dart';
import 'package:url_launcher/url_launcher.dart';

class TemplateSelectionBody extends StatefulWidget {
  const TemplateSelectionBody({super.key});

  @override
  State<TemplateSelectionBody> createState() => _TemplateSelectionBodyState();
}

class _TemplateSelectionBodyState extends State<TemplateSelectionBody> {
  @override
  Widget build(BuildContext context) {
    // bool isChecked= false;
    final templateSelectionProvider =
        context.watch<TemplateSelectionProvider>();
    final loginProvider = Provider.of<LoginProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: scaleWidth(context, 81),
                  left: scaleWidth(context, 81),
                  top: scaleHeight(context, 39)),
              child: Row(
                children: [
                  //container to be updated with image logic
                  Container(
                    height: scaleHeight(context, 44),
                    width: scaleHeight(context, 44),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),
                  SizedBox(
                    width: scaleWidth(context, 6),
                  ),
                  Text('HackCraft',
                      style: GoogleFonts.getFont(fontFamily2,
                          fontSize: scaleHeight(context, 20),
                          color: black1,
                          fontWeight: FontWeight.w400,
                          height: lineHeight(22.4, 20))),
                ],
              ),
            ),
            SizedBox(
              height: scaleHeight(context, 60),
            ),
            Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(fontFamily2,
                    fontSize: scaleHeight(context, 18),
                    color: black1,
                    fontWeight: FontWeight.w400,
                    height: lineHeight(22, 18))),
            SizedBox(
              height: scaleHeight(context, 15),
            ),
            Text('Lorem ipsum dolor sit amet',
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(fontFamily2,
                    fontSize: scaleHeight(context, 48),
                    color: black1,
                    fontWeight: FontWeight.w500,
                    height: lineHeight(38, 48))),
          ],
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                SizedBox(height: scaleHeight(context, 311)),
                Container(
                  height: scaleHeight(context, 234),
                  width: double.infinity,
                  color: green,
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.only(
                      left: scaleWidth(context, 81),
                      right: scaleWidth(context, 81),
                      bottom: scaleHeight(context, 28)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.arrow_back),
                              SizedBox(
                                width: scaleWidth(context, 10),
                              ),
                              Text('Back to\nScreen',
                                  style: GoogleFonts.getFont(fontFamily2,
                                      fontSize: scaleHeight(context, 18),
                                      color: black1,
                                      fontWeight: FontWeight.w600,
                                      height: lineHeight(23, 18))),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Checkbox(
                                value: templateSelectionProvider.isTnCChecked,
                                activeColor: black1_75,
                                side: const BorderSide(
                                  color: black1_100,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(rad5_1)),
                                onChanged: (value) {
                                  if (templateSelectionProvider
                                          .selectedTemplate !=
                                      0) {
                                    if (value!) {
                                      // If checkbox is checked, show the terms and conditions popup
                                      showTermsAndConditions(context);
                                    } else {
                                      // If checkbox is unchecked, just update the state without showing the popup
                                      templateSelectionProvider.setTnC(value);
                                    }
                                  } else {
                                    // If no template is selected, show a message and keep the checkbox unchecked
                                    templateSelectionProvider.setTnC(false);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Please select a template before agreeing to the terms and conditions.'),
                                        duration: Duration(seconds: 2),
                                      ),
                                    );
                                  }
                                }),
                            InkWell(
                              onTap: () {
                                showTermsAndConditions(context);
                              },
                              child: Text(
                                'I agree with Terms and conditions',
                                style: GoogleFonts.getFont(fontFamily2,
                                    fontSize: scaleHeight(context, 18),
                                    color: black1,
                                    fontWeight: FontWeight.w300,
                                    height: lineHeight(22, 18),
                                    decoration: TextDecoration.underline,
                                    decorationColor: black1_100),
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (templateSelectionProvider.isTnCChecked!) {
                              if (templateSelectionProvider.selectedTemplate ==
                                  1) {
                                final templateSelectionProvider =
                                    Provider.of<TemplateSelectionProvider>(
                                        context,
                                        listen: false);
                                templateSelectionProvider.selectTemplate(0);
                                templateSelectionProvider.setTnC(false);

                                final rulesProvider =
                                    Provider.of<RulesProvider>(context,
                                        listen: false);
                                rulesProvider.setEditSelectedIndex(-1);
                                rulesProvider.setEditDescriptionWidget(
                                    SvgPicture.asset(
                                        'assets/images/defaultTemplate/clickme.svg'));
                                Navigator.pushNamed(
                                    context, '/defaultEditPortal');
                              } else if (templateSelectionProvider
                                      .selectedTemplate ==
                                  2) {
                                Navigator.pushNamed(
                                    context, '/customEditPortal');
                                // final Uri url = Uri.parse(
                                //     "http://127.0.0.1:5173/?${loginProvider.emailId}");

                                // if (await canLaunchUrl(url)) {
                                //   await launchUrl(url);
                                // } else {
                                //   // Can't launch the URL, handle the error
                                //   debugPrint('Could not launch $url');
                                // }
                              } else {
                                // TODO Create something to tell user to select card and check terms and conditions
                                showSnackBar(
                                    "Select any of the one card and check",
                                    red2,
                                    const Icon(
                                      Icons.report_gmailerrorred_outlined,
                                      color: white,
                                    ),
                                    context);
                              }
                            } else {
                              showSnackBar(
                                  "Please check  the Terms and Condition ",
                                  red2,
                                  const Icon(
                                    Icons.report_gmailerrorred_outlined,
                                    color: white,
                                  ),
                                  context);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.only(
                                  top: scaleHeight(context, 12),
                                  bottom: scaleHeight(context, 12),
                                  left: scaleWidth(context, 44),
                                  right: scaleWidth(context, 13)),
                              backgroundColor: black1,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(rad5_10),
                              )),
                          child: Row(
                            children: [
                              Text('Next',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.getFont(fontFamily2,
                                      fontSize: scaleHeight(context, 18),
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      height: lineHeight(23, 18))),
                              SizedBox(
                                width: scaleWidth(context, 25),
                              ),
                              const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              )
                            ],
                          ),
                        )
                      ]),
                ),
              ],
            ),
            Positioned(
                //top: -scaleHeight(context, 311),
                left:
                    (scaleWidth(context, 1280) - scaleWidth(context, 855)) / 2,
                child: Row(
                  children: [
                    templateCard(
                        cardIndex: 1,
                        context: context,
                        title: 'Default Template',
                        titleColor: defaultTemplateCardTitle,
                        subtitle:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut ante eu nisi imperdiet ullamcorper. Sed nec ante ac lorem eleifend viverra',
                        subTitleColor: black1,
                        borderColor: defaultTemplateCardBorder),
                    SizedBox(
                      width: scaleWidth(context, 69),
                    ),
                    templateCard(
                        cardIndex: 2,
                        context: context,
                        title: 'Custom Template',
                        titleColor: customTemplateCardTitle,
                        subtitle:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ut ante eu nisi imperdiet ullamcorper. Sed nec ante ac lorem eleifend viverra',
                        subTitleColor: black1,
                        borderColor: customTemplateCardBorder)
                  ],
                ))
          ],
        )
      ],
    );
  }

  InkWell templateCard(
      {required int cardIndex,
      required BuildContext context,
      required String title,
      required String subtitle,
      Color? titleColor,
      Color? subTitleColor,
      required Color borderColor}) {
    final templateSelectionProvider =
        context.watch<TemplateSelectionProvider>();
    return InkWell(
      onTap: () {
        templateSelectionProvider.selectTemplate(cardIndex);
      },
      child: Container(
        height: scaleHeight(context, 428),
        width: scaleWidth(context, 393),
        padding: EdgeInsets.only(
            top: scaleHeight(context, 40),
            bottom: scaleHeight(context, 34),
            left: scaleWidth(context, 33),
            right: scaleWidth(context, 33)),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(rad5_5),
            border: templateSelectionProvider.selectedTemplate == cardIndex
                ? Border.all(
                    color: borderColor,
                    width: scaleWidth(context, 3) // changed from 4 to 3
                    )
                : null,
            boxShadow: [
              BoxShadow(
                  blurRadius: 15,
                  offset: const Offset(0, 4),
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 0)
            ]),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: scaleWidth(context, 20)), // changed from 11 to 20
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(rad5_3),
                  child: Image.asset(
                    'assets/images/defaultTemplate/GalleryImage.png',
                    height: scaleHeight(context, 174),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              height: scaleHeight(context, 32),
            ),
            Text(title,
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(fontFamily2,
                    fontSize: scaleHeight(context, 24),
                    color: titleColor,
                    fontWeight: FontWeight.w400,
                    height: lineHeight(29, 24))),
            SizedBox(
              height: scaleHeight(context, 19),
            ),
            Text(subtitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(fontFamily2,
                    fontSize: scaleHeight(context, 18),
                    color: subTitleColor,
                    fontWeight: FontWeight.w400,
                    height: lineHeight(22, 18))),
          ],
        ),
      ),
    );
  }
}
