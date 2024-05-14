import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

class ComposeEmail extends StatefulWidget {
  const ComposeEmail({super.key});

  @override
  State<ComposeEmail> createState() => _ComposeEmailState();
}

class _ComposeEmailState extends State<ComposeEmail> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: scaleHeight(context, 536),
      width: scaleWidth(context, 437),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: scaleWidth(context, 20)),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: pastelBlueGray,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Lorem Ipsum",
                    style: GoogleFonts.getFont(fontFamily2,
                        fontSize: scaleHeight(context, 16),
                        fontWeight: FontWeight.w500,
                        color: darkCharcoal),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.close,
                        color: darkCharcoal,
                      ))
                ],
              ),
            ),
            TextFormField(
              cursorColor: darkCharcoal,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(2),
                    bottomRight: Radius.circular(2),
                  ),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: black1, width: 0.5),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(2),
                    bottomRight: Radius.circular(2),
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: black1, width: 1),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(2),
                    bottomRight: Radius.circular(2),
                  ),
                ),
                hintText: "Subject",
                hintStyle: GoogleFonts.getFont(fontFamily2,
                    fontSize: scaleHeight(context, 16),
                    fontWeight: FontWeight.w500,
                    color: darkCharcoal.withOpacity(0.4)),
              ),
            ),
            const Divider(
              height: 1,
              color: Color(0xffd0d3da),
            ),
            TextFormField(
              cursorColor: darkCharcoal,
              decoration: const InputDecoration(border: InputBorder.none),
              maxLines: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: scaleHeight(context, 32),
                      width: scaleHeight(context, 32),
                      decoration: BoxDecoration(
                          color: lightSilverGrey,
                          borderRadius: BorderRadius.circular(32)),
                    ),
                    Container(
                      height: scaleHeight(context, 32),
                      width: scaleHeight(context, 32),
                      decoration: BoxDecoration(
                          color: lightSilverGrey,
                          borderRadius: BorderRadius.circular(32)),
                    ),
                    Container(
                      height: scaleHeight(context, 32),
                      width: scaleHeight(context, 32),
                      decoration: BoxDecoration(
                          color: lightSilverGrey,
                          borderRadius: BorderRadius.circular(32)),
                    ),
                  ],
                ),
                Container(
                  height: scaleHeight(context, 32),
                  width: scaleHeight(context, 32),
                  decoration: BoxDecoration(
                      color: lightSilverGrey,
                      borderRadius: BorderRadius.circular(32)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
