import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

class FileUploadField extends StatefulWidget {
  const FileUploadField(
      {super.key,
      required this.question,
      required this.create,
      required this.required});
  final String question;
  final bool create;
  final bool required;

  @override
  State<FileUploadField> createState() => _FileUploadFieldState();
}

class _FileUploadFieldState extends State<FileUploadField> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(
            left: widget.create ? scaleWidth(context, 10) : 0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: scaleHeight(context, 20),
                    bottom: scaleHeight(context, 10)),
                child: Text(
                  widget.question,
                  style: GoogleFonts.getFont(
                    fontFamily2,
                    fontSize: heightScaler(context, 14),
                    fontWeight: FontWeight.w500,
                    color: black1,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    //margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  color: lightSilver,
                                  height: scaleHeight(context, 34),
                                  width: scaleWidth(context, 34),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "OPTIONAL",
                                      style: GoogleFonts.getFont(
                                        fontFamily2,
                                        fontSize: heightScaler(context, 14),
                                        fontWeight: FontWeight.w500,
                                        color: black1,
                                      ),
                                    ),
                                    Text(
                                      "44 MB",
                                      style: GoogleFonts.getFont(
                                        fontFamily2,
                                        fontSize: heightScaler(context, 10),
                                        fontWeight: FontWeight.w500,
                                        color: black1,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 17,
                              height: 8,
                              child: IconButton(
                                icon:const Icon(Icons.close),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                     const   SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "OPTIONAL",
                              style: GoogleFonts.getFont(
                                fontFamily2,
                                fontSize: heightScaler(context, 10),
                                fontWeight: FontWeight.w500,
                                color: black1,
                              ),
                            ),
                            Text(
                              "OPTIONAL",
                              style: GoogleFonts.getFont(
                                fontFamily2,
                                fontSize: heightScaler(context, 10),
                                fontWeight: FontWeight.w500,
                                color: black1,
                              ),
                            ),
                            Text(
                              "OPTIONAL",
                              style: GoogleFonts.getFont(
                                fontFamily2,
                                fontSize: heightScaler(context, 10),
                                fontWeight: FontWeight.w500,
                                color: black1,
                              ),
                            ),
                            Text(
                              "OPTIONAL",
                              style: GoogleFonts.getFont(
                                fontFamily2,
                                fontSize: heightScaler(context, 10),
                                fontWeight: FontWeight.w500,
                                color: black1,
                              ),
                            ),
                          ],
                        ),
                       const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: FloatingActionButton(
                              onPressed: () {},
                              child:const Icon(Icons.add),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: scaleWidth(context, 16),
                  ),
                  widget.required
                      ? Text(
                          "REQUIRED",
                          style: GoogleFonts.getFont(fontFamily2,
                              fontSize: scaleHeight(context, 16),
                              color: midnigthBlue,
                              fontWeight: FontWeight.w500),
                        )
                      : Container(),
                  SizedBox(
                    width: widget.create ? scaleWidth(context, 50) : 0,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
