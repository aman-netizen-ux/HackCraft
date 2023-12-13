import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';

class CustomGrid extends StatelessWidget {
  const CustomGrid({super.key, required this.itemCount, required this.columnCount, required this.menuList});
  final int itemCount;
  final int columnCount;
  final List<String> menuList;

  @override
  Widget build(BuildContext context) {

    final rowsNum= (itemCount/columnCount).ceil();


    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      final boxWidth = constraints.constrainWidth();
      final maxWidth= (boxWidth- (columnCount-1)*scaleWidth(context, 12))/columnCount;

      return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(columnCount, (columnIndex) {
            return Container(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(rowsNum.toInt(), (rowIndex) {

                     int indexInGrid = rowIndex * columnCount + columnIndex;

                     if (indexInGrid >= itemCount) {
                  return Container(); // Empty container for extra slots in the last row
                }
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: rowIndex != rowsNum.toInt()
                              ? scaleHeight(context, 35)
                              : scaleHeight(context, 0)),
                      child: Text(menuList[indexInGrid],
                          style: GoogleFonts.getFont(
                            fontFamily2,
                            fontSize: scaleHeight(context, 20),
                            fontWeight: FontWeight.w400,
                            height: lineHeight(0.08, 20),
                            color: Colors.white,
                          )),
                    );
                  })),
            );
          }));
    });
  }
}
