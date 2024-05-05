import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

class OptionExpansionTile extends StatefulWidget {
  final String title;

  const OptionExpansionTile({Key? key, required this.title}) : super(key: key);

  @override
  _OptionExpansionTileState createState() => _OptionExpansionTileState();
}

class _OptionExpansionTileState extends State<OptionExpansionTile> {
  bool isExpanded = false;
  TextEditingController ansController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal:  scaleWidth(context, 14), vertical: scaleHeight(context, 4)),
      color: lightSilver,
      child: Theme(
        data: ThemeData(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          title: Text(widget.title),
          onExpansionChanged: (value) {
            setState(() {
              isExpanded = value;
            });
          },
          trailing: isExpanded
              ? InkWell(
                  onTap: () {},
                  child: Container(
                      height: scaleHeight(context, 24),
                      alignment: Alignment.center,
                      color: const Color(0xffeaeaea),
                      margin: EdgeInsets.only(
                          left: scaleWidth(context, 8),
                          right: scaleWidth(context, 14)),
                      width: scaleHeight(context, 24),
                      child: const Icon(
                        Icons.delete,
                        size: 18,
                        color: white,
                      )),
                )
              :const Icon(Icons.close_rounded),
          childrenPadding: EdgeInsets.symmetric(
            horizontal: scaleHeight(context, 14),
            vertical: scaleWidth(context, 15),
          ),
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    style: GoogleFonts.firaSans(
                      fontSize: scaleHeight(context, 14),
                      fontWeight: FontWeight.w500,
                      color: darkCharcoal,
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                    maxLines: 4,
                    textAlign: TextAlign.start,
                    controller: ansController,
                    decoration: InputDecoration(
                      hintText: "Enter Option",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(
                        scaleWidth(context, 10),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: scaleHeight(context, 15),
                  right: scaleWidth(context, 9),
                  child: Text(
                    "${ansController.text.length}/${100}",
                    style: GoogleFonts.getFont(
                      fontFamily2,
                      fontSize: scaleHeight(context, 11),
                      color: const Color(0xff646262),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
