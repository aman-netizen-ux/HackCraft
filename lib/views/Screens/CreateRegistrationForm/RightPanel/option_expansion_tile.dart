import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/models/Registration/registration_form_model.dart';
import 'package:major_project__widget_testing/state/Registration.dart/createRegistrationProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:provider/provider.dart';

class OptionExpansionTile extends StatefulWidget {
  final String title;
  final String expandedTitle;
  final int index;

  const OptionExpansionTile(
      {Key? key,
      required this.title,
      required this.expandedTitle,
      required this.index})
      : super(key: key);

  @override
  _OptionExpansionTileState createState() => _OptionExpansionTileState();
}

class _OptionExpansionTileState extends State<OptionExpansionTile> {
  bool isExpanded = false;

  TextEditingController ansController = TextEditingController();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final createRegistrationProvider =
        Provider.of<CreateRegistrationProvider>(context, listen: false);
    dynamic currentField = createRegistrationProvider.tabField[
        createRegistrationProvider
            .currentKey]![createRegistrationProvider.currentIndex];
    List<RegistrationOption> registrationOptions =
        currentField.options.cast<RegistrationOption>();
    ansController.text = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    final createRegistrationProvider =
        Provider.of<CreateRegistrationProvider>(context, listen: false);
    dynamic currentField = createRegistrationProvider.tabField[
        createRegistrationProvider
            .currentKey]![createRegistrationProvider.currentIndex];
    List<RegistrationOption> registrationOptions =
        currentField.options.cast<RegistrationOption>();
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: scaleWidth(context, 14),
          vertical: scaleHeight(context, 4)),
      color: lightSilver,
      child: Theme(
        data: ThemeData(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          title: isExpanded ? Text(widget.expandedTitle) : Text(widget.title),
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
              : const Icon(Icons.close_rounded),
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

                      currentField.options[widget.index].text = value;
                      createRegistrationProvider.notify();
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
