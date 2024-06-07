import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/models/DashboardModel/registration_model.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/Dashboard/RegistrationDetail/member_details.dart';
import 'package:major_project__widget_testing/views/Screens/Dashboard/RegistrationDetail/member_table_header.dart';

class RegistrationExpansionTile extends StatefulWidget {
  final Team teamDetails;
  final bool colorCheck;
  const RegistrationExpansionTile({
    super.key,
    required this.teamDetails,
    required this.colorCheck,
  });

  @override
  State<RegistrationExpansionTile> createState() =>
      _RegistrationExpansionTileState();
}

class _RegistrationExpansionTileState extends State<RegistrationExpansionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: scaleHeight(context, 10)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: widget.colorCheck ? const Color(0xffE9ECF3) : null,
      ),
      child: ExpansionTile(
        collapsedIconColor: Colors.transparent,
        trailing: null,
        shape: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        iconColor: Colors.transparent,
        title: Row(
          children: [
            Expanded(
              flex: 30,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: widget.colorCheck
                      ? const Color(0xffF1DECA)
                      : const Color(0xffCAF5D6),
                ),
                height: scaleHeight(context, 40),
                width: scaleHeight(context, 40),
                child: const Icon(
                  Icons.arrow_drop_down,
                  color: black1,
                ),
              ),
            ),
            Expanded(
              flex: 319,
              child: Center(
                child: Text(
                  widget.teamDetails.teamName,
                  style: GoogleFonts.getFont(fontFamily2,
                      fontSize: scaleHeight(context, 18),
                      fontWeight: FontWeight.w500,
                      color: darkCharcoal),
                ),
              ),
            ),
            Expanded(
              flex: 93,
              child: Container(
                height: scaleHeight(context, 40),
                width: scaleHeight(context, 40),
                margin:
                    EdgeInsets.symmetric(horizontal: scaleWidth(context, 30)),
                decoration: BoxDecoration(
                    color: widget.colorCheck
                        ? const Color(0xffF444DD)
                        : const Color(0xff8F45F4),
                    borderRadius: BorderRadius.circular(10)),
                alignment: Alignment.center,
                child: Text(
                  widget.teamDetails.teamCount.toString(),
                  style: GoogleFonts.getFont(fontFamily2,
                      fontSize: scaleHeight(context, 18),
                      fontWeight: FontWeight.w500,
                      color: const Color(0xffFFD4FF)),
                ),
              ),
            ),
            Expanded(
              flex: 140,
              child: Center(
                child: Text(
                  DateFormat('d MMMM yyyy').format(
                      DateTime.parse(widget.teamDetails.registrationDate)),
                  style: GoogleFonts.getFont(fontFamily2,
                      fontSize: scaleHeight(context, 16),
                      fontWeight: FontWeight.w500,
                      color: darkCharcoal),
                ),
              ),
            ),
            Expanded(
              flex: 158,
              child: Container(
                height: scaleHeight(context, 40),
                width: scaleHeight(context, 40),
                margin:
                    EdgeInsets.symmetric(horizontal: scaleWidth(context, 20)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: widget.teamDetails.registrationStatus == "Completed"
                      ? const Color(0xffBAEED1)
                      : const Color(0xffC6DAEE),
                ),
                alignment: Alignment.center,
                child: Text(
                  widget.teamDetails.registrationStatus,
                  style: GoogleFonts.getFont(fontFamily2,
                      fontSize: scaleHeight(context, 16),
                      fontWeight: FontWeight.w500,
                      color:
                          widget.teamDetails.registrationStatus == "Completed"
                              ? const Color(0xff22653C)
                              : const Color(0xff4575C0)),
                ),
              ),
            ),
            Expanded(
              flex: 260,
              child: Center(
                child: Text(
                  widget.teamDetails.leader,
                  style: GoogleFonts.getFont(fontFamily2,
                      fontSize: scaleHeight(context, 16),
                      fontWeight: FontWeight.w500,
                      color: darkCharcoal),
                ),
              ),
            )
          ],
        ),
        children: [
          const Divider(
            height: 1,
          ),
          SizedBox(
            height: scaleHeight(context, 40),
          ),
          memberTableHeader(context, widget.teamDetails.allFields),
          memberDetails(context, widget.teamDetails.members),
          SizedBox(
            height: scaleHeight(context, 24),
          ),
        ],
      ),
    );
  }
}
