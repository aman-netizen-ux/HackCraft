import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/state/hackathonDetailsProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/scroll_Controller.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:provider/provider.dart';

class DefaultEditAboutus extends StatelessWidget {
  final double containerHeight;
  final double containerWidth;
  const DefaultEditAboutus(
      {super.key, required this.containerHeight, required this.containerWidth});

  @override
  Widget build(BuildContext context) {
    final hackathonAboutController = TextEditingController();
    final hackathonDetailsProvider =
        Provider.of<HackathonDetailsProvider>(context);
    if (hackathonDetailsProvider.about.isNotEmpty) {
      hackathonAboutController.text = hackathonDetailsProvider.about;
    }

    return Padding(
      key: aboutUsEdit,
      padding:
          EdgeInsets.only(top: defaultEditScaleHeight(containerHeight, 67)),
      child: Column(
        children: [
          Stack(clipBehavior: Clip.none, children: [
            //This container will show the complete description of the hackathon, including rounds, rules, and many other things.
            //The height of the container will automatically increase based on the size of the text being entered.
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: defaultEditScaleHeight(containerHeight, 29),
                  // color: Colors.blue,
                ),
                Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                        horizontal: defaultEditScaleWidth(containerWidth, 37)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: black3,
                            width: defaultEditScaleWidth(containerWidth, 1))),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: defaultEditScaleWidth(containerWidth, 44),
                          right: defaultEditScaleWidth(containerWidth, 44),
                          top: defaultEditScaleHeight(containerHeight, 59),
                          bottom: defaultEditScaleHeight(containerHeight, 165)),
                      child: TextFormField(
                        controller: hackathonAboutController,
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.center,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText:
                              'Give a detail description of your hahathon',
                          hintStyle: GoogleFonts.getFont(fontFamily2,
                              fontSize:
                                  defaultEditScaleHeight(containerHeight, 18),
                              color: black2,
                              fontWeight: FontWeight.w400,
                              height: lineHeight(22.4, 18)),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          counterText: "",
                        ),
                        maxLength: 1900,
                        keyboardType: TextInputType.text,
                        style: GoogleFonts.getFont(fontFamily2,
                            fontSize:
                                defaultEditScaleHeight(containerHeight, 18),
                            color: black2,
                            fontWeight: FontWeight.w400,
                            height: lineHeight(22.4, 18)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          hackathonDetailsProvider.about = value.toString();
                        },
                      ),

                      //  Text(
                      //   'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam quis velit nec justo fermentum dignissim. Sed lacinia ex eu mi malesuada, sed interdum metus posuere. Vivamus auctor sapien in eleifend. Fusce nec est eget lorem ultrices facilisis a eget dolor. Integer eget velit sit amet lorem gravida vestibulum. Proin eget vestibulum nunc. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur eget tellus ut odio facilisis bibendum nec nec tortor. Vivamus iaculis, turpis et tincidunt mattis, est arcu laoreet urna, nec dignissim nisl odio a nunc. Phasellus fermentum tristique orci, vel convallis tortor vehicula nec.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam quis velit nec justo fermentum dignissim. Sed lacinia ex eu mi malesuada, sed interdum metus posuere. Vivamus auctor sapien in eleifend. Fusce nec est eget lorem ultrices facilisis a eget dolor. Integer eget velit sit amet lorem gravida vestibulum. Proin eget vestibulum nunc. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur eget tellus ut odio facilisis bibendum nec nec tortor. Vivamus iaculis, turpis et tincidunt mattis, est arcu laoreet urna, nec dignissim nisl odio a nunc. Phasellus fermentum tristique orci, vel convallis tortor vehicula nec.Suspendisse potenti. Donec ullamcorper consectetur nunc, ut aliquam nulla blandit eget. Nunc pharetra diam ac turpis viverra varius. Sed ut erat justo. Fusce in tellus ut sapien venenatis volutpat. Nam eu sapien nec enim rhoncus volutpat vel eu libero. Nam vel augue sit amet odio malesuada mattis eget eu sapien. Integer ut nisi vitae libero gravida pharetra. Nunc varius tincidunt justo, a vehicula justo rhoncus ut. Sed bibendum, risus at euismod venenatis, purus metus tincidunt libero, a facilisis justo justo id libero. Maecenas ultricies augue a hendrerit iaculis.',
                      //   style: GoogleFonts.getFont(
                      //     fontFamily2,
                      //     fontWeight: FontWeight.w400,
                      //     height: lineHeight(22.4, 18),
                      //     fontSize: defaultEditScaleWidth(containerWidth, 18),
                      //     color: black2,
                      //   ),
                      // ),
                    )),

                    Container(
                  width: double.infinity,
                  height: defaultEditScaleHeight(containerWidth, 125),
                  // color: Colors.blue,
                ),
              ],
            ),
            //The register button is positioned accordingly so that it starts before the container and goes until the container starts.
            //When you run the code, you'll understand what's written here.
            Positioned(
                // top: -defaultEditScaleWidth(containerWidth, 29),
                child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: defaultEditScaleWidth(containerWidth, 512)),
              height: defaultEditScaleHeight(containerHeight, 58),
              width: defaultEditScaleWidth(containerWidth, 256),
              decoration: BoxDecoration(
                color: black4,
                borderRadius: BorderRadius.circular(55),
              ),
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(55)),
                    backgroundColor: Colors.white,
                  ),
                  child: Text("Get Registered",
                      style: GoogleFonts.getFont(fontFamily2,
                          fontWeight: FontWeight.w600,
                          fontSize: defaultEditScaleWidth(containerWidth, 21),
                          height: lineHeight(22.4, 21),
                          color: black1))),
            )),
            //This container is used to show the prize section. It's also positioned like the above container,
            //but the difference is that the above one was positioned from the top and this one was positioned from the bottom.
            //Run the code once, and you'll understand.
            Positioned(
              bottom:defaultEditScaleHeight(containerWidth, 0),//120
              child: Container(
                  color: lavender,
                  height: defaultEditScaleHeight(containerHeight, 400), //240
                  width: defaultEditScaleWidth(containerWidth, 1118),
                  margin: EdgeInsets.symmetric(
                      horizontal: defaultEditScaleWidth(containerWidth, 81)),
                  child: SvgPicture.asset(
                      'assets/icons/defaultEditPortal/about.svg',
                      fit: BoxFit.fill)),
            ),
          ]),
          SizedBox(
            height: defaultEditScaleHeight(containerHeight, 0), //153 //233
          )
        ],
      ),
    );
  }
}
