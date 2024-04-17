import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';

class DateRange {
  final int start;
  final int end;
  final MaterialColor color;

  DateRange(this.start, this.end, this.color);
}

class DateCheckResult {
  final MaterialColor color;
  final String description;

  DateCheckResult(this.color, this.description);
}





List<DateCheckResult> Datecheck(int date, List<DateRange> ranges) {
  List<DateCheckResult> list =[];
  for (DateRange range in ranges) {
    if(date == range.start&&date == range.end){
  list.add(DateCheckResult(range.color, "Date is same as start and end"));
    }
    else if (date == range.start) {
      list.add( DateCheckResult(range.color, "Date is equal to the start date"));
    } else if (date == range.end) {
      list.add( DateCheckResult(range.color, "Date is equal to the end date"));
    } else if (date > range.start && date < range.end) {
      list.add( DateCheckResult(
          range.color, "Date lies between the start and end dates"));
    }
  }
  return list; 
}

Map<String, List<MaterialColor>> separateColors(List<DateCheckResult> results) {
  List<MaterialColor> endAndBetweenColors = [];
  List<MaterialColor> startAndBetweenColors = [];
   List<MaterialColor> isStartOrEndDate = [];

  for (DateCheckResult result in results) {
    if (result.description == "Date is equal to the end date" || result.description == "Date lies between the start and end dates") {
      endAndBetweenColors.add(result.color);
    }
    if (result.description == "Date is equal to the start date" || result.description == "Date lies between the start and end dates") {
      startAndBetweenColors.add(result.color);
    }
     if (result.description == "Date is equal to the start date" ||result.description == "Date is equal to the end date"|| result.description == "Date is same as start and end") {
      isStartOrEndDate.add(result.color);
    }
  }

  return {
    "End and Between": endAndBetweenColors,
    "Start and Between": startAndBetweenColors,
    "isStartOrEndDate":isStartOrEndDate
  };
}


bool checkDateValidity(List<DateCheckResult> results) {
  for (DateCheckResult result in results) {
    if (result.description == "Date is same as start and end" ||
        result.description == "Date is equal to the start date" ||
        result.description == "Date is equal to the end date") {
      return false;
    }
  }
  return true;  // Return true if none of the disqualifying descriptions are found
}












// BoxDecoration? getDateCellShape(int date, List<DateRange> ranges) {
// //   final dateResult = Datecheck(date, ranges);

// //   bool isStartDate = dateResult == null
// //       ? false
// //       : dateResult.description == "Date is equal to the start date";

// //   bool isEndDate = dateResult == null
// //       ? false
// //       : dateResult.description == "Date is equal to the end date";
// //   bool isInRange = dateResult == null
// //       ? false
// //       : dateResult.description == "Date lies between the start and end dates";
// //  bool isStartEndDateSame= dateResult == null
// //   ?false
// //   :dateResult.description == "Date is same as start and end";

// //   return dateResult == null
// //       ? null
// //       : BoxDecoration(
// //           shape:
// //               isStartDate || isEndDate ||isStartEndDateSame? BoxShape.circle : BoxShape.rectangle,
// //           color: isStartDate || isEndDate||isStartEndDateSame
// //               ? dateResult.color.shade300
// //               : isInRange
// //                   ? dateResult.color.shade100
// //                   : null,

// //                  gradient:const  LinearGradient(
// //           colors: [
           
// //                  Colors.purple, // Replace with any color you like
// //             Colors.pink, // Transition to transparent
// //           ],
// //           stops: [0.5, 0.5], // This defines the sharp transition point
// //           begin: Alignment.topCenter,
// //           end: Alignment.bottomCenter,
// //         ) 
// //         );

// return null;
// }


BoxDecoration? getDateCellShape(int date, List<DateRange> ranges) {
final dateResult= Datecheck(date, ranges);
final dateValidity = checkDateValidity(dateResult);
final seperateColorList= separateColors(dateResult);

final endAndStartColorList= seperateColorList["isStartOrEndDate"];

if (dateValidity || endAndStartColorList == null || endAndStartColorList.isEmpty) {
    return null;
  }

  List<Color> colors = endAndStartColorList.map((materialColor) => materialColor.shade300).toList();
  
  // Check if only one color and handle gracefully
  if (endAndStartColorList.length == 1) {
    // Repeat the same color to allow for a gradient effect with identical start and end
    colors.add(colors[0]);
  }

  // Generate stops - Ensure there is always a start and end point for multiple colors
  List<double> stops = List<double>.generate(
    colors.length,
    (index) => index / (colors.length - 1),
    growable: false,
  );
log("stops: $stops");
  return BoxDecoration(
    shape: BoxShape.circle,
    gradient: LinearGradient(
      colors: colors,
      stops: stops,
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    ),
  );

// return dateValidity? null:  BoxDecoration(
// shape: BoxShape.circle,
//   gradient:  LinearGradient(
//           colors: [
//             ...List.generate(endAndStartColorList!.length, (index) {
//             return endAndStartColorList[index].shade300;
//           }),

//           endAndStartColorList.length==1? endAndStartColorList[0].shade300: Colors.transparent

          
//           ],
//           stops:List<double>.generate(
//      endAndStartColorList.length==1? endAndStartColorList.length+1: endAndStartColorList.length,
//       (index) => index / ((endAndStartColorList.length==1? endAndStartColorList.length+1: endAndStartColorList.length)- 1),
//       growable: false,
//     ),
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ) 
// );

}


 Widget getDateCellBackgroundDecoration(int date, List<DateRange> ranges){
final dateResult= Datecheck(date, ranges);
final seperateColorList= separateColors(dateResult);

final endAndInRangeColorList= seperateColorList["End and Between"];
final startAndInRangeColorList= seperateColorList["Start and Between"];


    return  Row(
       children: [
         Expanded(
          flex:1,
           child: SizedBox(
            width: double.infinity,
             child: Column(
              children: List.generate(endAndInRangeColorList!.length, (index) => Expanded(flex:1,child: Container(width: double.infinity,  color: endAndInRangeColorList[index].shade100)))
             ),
           ),
         ),
         Expanded(
          flex:1,
           child: SizedBox(
            width: double.infinity,
             child: Column(
              children: List.generate(startAndInRangeColorList!.length, (index) => Expanded(flex:1,child: Container(width: double.infinity,  color: startAndInRangeColorList[index].shade100)))
             ),
           ),
         ),
       ],
     );
  }























class ThisMonthCalenderNew extends StatelessWidget {
  final List<DateRange> dateRanges;
  final double size;

  const ThisMonthCalenderNew({super.key, required this.dateRanges, required this.size});

  @override
  Widget build(BuildContext context) {
    Map<int, String> dayMap = {
      1: 'S', // Sunday
      2: 'M', // Monday
      3: 'T', // Tuesday
      4: 'W', // Wednesday
      5: 'T', // Thursday
      6: 'F', // Friday
      7: 'S' // Saturday
    };
    String getDayInitial(int dayNumber) {
      return dayMap[dayNumber] ??
          'Invalid day'; // Return 'Invalid day' if the number is not 1-7
    }

    DateTime now = DateTime.now();
    DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);
    int dayOfWeek = firstDayOfMonth.weekday;

    DateTime firstDayNextMonth;

    // If it's December, the next month is January of the next year
    if (now.month == 12) {
      firstDayNextMonth = DateTime(now.year + 1, 1, 1);
    } else {
      firstDayNextMonth = DateTime(now.year, now.month + 1, 1);
    }

    int numberOfDays = firstDayNextMonth.difference(firstDayOfMonth).inDays;
    int numberOfDaysThisMonth = numberOfDays;
    int dateGettingAdd = 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat('MMMM').format(now),
          style: GoogleFonts.getFont(fontFamily2,
              fontSize: scaleWidth(context, 14),
              color: black1,
              fontWeight: FontWeight.w400,
              height: lineHeight(22.4, 14)),
        ),
        SizedBox(height: scaleHeight(context, 4)),
        Container(
            width: double.infinity,
            height: scaleHeight(context, size),
            padding: EdgeInsets.symmetric(vertical: scaleHeight(context, 4)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(7, (index) {
                  return Expanded(
                      flex: 1,
                      child: Text(
                          textAlign: TextAlign.center,
                          getDayInitial((index + 1))));
                }))),





        Container(
            width: double.infinity,
            height: scaleHeight(context, size),
            padding: EdgeInsets.symmetric(vertical: scaleHeight(context, 4)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(7, (index) {
                  numberOfDays =
                      index < dayOfWeek ? numberOfDays - 0 : numberOfDays - 1;
                  dateGettingAdd =
                      index < dayOfWeek ? dateGettingAdd : dateGettingAdd + 1;
                  return Expanded(
                    flex: 1,
                    child: SizedBox(
                     width: double.infinity,
                      child: Stack(
                        children: [
                            index < dayOfWeek ? const SizedBox():getDateCellBackgroundDecoration(dateGettingAdd, dateRanges),
                            Container(
                              alignment: Alignment.center,
                               decoration:  index < dayOfWeek ? null:getDateCellShape(dateGettingAdd, dateRanges),
                            child: Text(
                                textAlign: TextAlign.center,
                                index < dayOfWeek ? "" : dateGettingAdd.toString()),
                          ),
                        ],
                      ),
                    ),
                  );
                }))),




        Container(
            width: double.infinity,
            height: scaleHeight(context, size),
            padding: EdgeInsets.symmetric(vertical: scaleHeight(context, 4)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(7, (index) {
                  numberOfDays = numberOfDays - 1;
                  dateGettingAdd = dateGettingAdd + 1;
                  return Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: double.infinity,
                      child: Stack(
                        children: [
                         getDateCellBackgroundDecoration(dateGettingAdd, dateRanges),
                            Container(
                              alignment: Alignment.center,
                               decoration: getDateCellShape(dateGettingAdd, dateRanges),
                              child: Text(
                                  textAlign: TextAlign.center, dateGettingAdd.toString()),
                            
                          ),
                        ],
                      ),
                    ),
                  );
                }))),








                
        Container(
            width: double.infinity,
            height: scaleHeight(context, size),
            padding: EdgeInsets.symmetric(vertical: scaleHeight(context, 4)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(7, (index) {
                  numberOfDays = numberOfDays - 1;
                  dateGettingAdd = dateGettingAdd + 1;
                  return Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: double.infinity,
                      child: Stack(
                        children: [
                         getDateCellBackgroundDecoration(dateGettingAdd, dateRanges),
                            Container(
                              alignment: Alignment.center,
                             decoration: getDateCellShape(dateGettingAdd, dateRanges),
                            child: Text(
                                textAlign: TextAlign.center,
                                dateGettingAdd.toString()),
                          ),
                        ],
                      ),
                    ),
                  );
                }))),
        Container(
            width: double.infinity,
            height: scaleHeight(context, size),
            padding: EdgeInsets.symmetric(vertical: scaleHeight(context, 4)),
            child: Row(
                children: List.generate(7, (index) {
              numberOfDays = numberOfDays - 1;
              dateGettingAdd = dateGettingAdd + 1;
              return Expanded(
                flex: 1,
                child: SizedBox(
                      width: double.infinity,
                      child: Stack(
                        children: [
                         getDateCellBackgroundDecoration(dateGettingAdd, dateRanges),
                            Container(
                              alignment: Alignment.center,
                             decoration: getDateCellShape(dateGettingAdd, dateRanges),
                                              child: Text(
                            textAlign: TextAlign.center, dateGettingAdd.toString()),
                                            ),
                        ],
                      ),
                ),
              );
            }))),
        dateGettingAdd < numberOfDaysThisMonth + 1
            ? Container(
                width: double.infinity,
                height: scaleHeight(context, size),
                padding:
                    EdgeInsets.symmetric(vertical: scaleHeight(context, 4)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(7, (index) {
                      numberOfDays = dateGettingAdd < numberOfDaysThisMonth + 1
                          ? numberOfDays - 1
                          : numberOfDays;
                      dateGettingAdd =
                          dateGettingAdd < numberOfDaysThisMonth + 1
                              ? dateGettingAdd + 1
                              : dateGettingAdd;
                      return Expanded(
                        flex: 1,
                        child: SizedBox(
                      width: double.infinity,
                      child: Stack(
                        children: [
                          getDateCellBackgroundDecoration(dateGettingAdd, dateRanges),
                            Container(
                              alignment: Alignment.center,
                             decoration: getDateCellShape(dateGettingAdd, dateRanges),
                                child: Text(
                                    textAlign: TextAlign.center,
                                    dateGettingAdd < numberOfDaysThisMonth + 1
                                        ? dateGettingAdd.toString()
                                        : ""),
                              ),
                        ],
                      ),
                        ),
                      );
                    })))
            : const SizedBox.shrink(),
        dateGettingAdd < numberOfDaysThisMonth + 1
            ? Container(
                width: double.infinity,
                height: scaleHeight(context, size),
                padding:
                    EdgeInsets.symmetric(vertical: scaleHeight(context, 4)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(7, (index) {
                      numberOfDays = dateGettingAdd < numberOfDaysThisMonth + 1
                          ? numberOfDays - 1
                          : numberOfDays;
                      dateGettingAdd =
                          dateGettingAdd < numberOfDaysThisMonth + 1
                              ? dateGettingAdd + 1
                              : dateGettingAdd;
                      return Expanded(
                        flex: 1,
                        child: SizedBox(
                      width: double.infinity,
                      child: Stack(
                        children: [
                           getDateCellBackgroundDecoration(dateGettingAdd, dateRanges),
                            Container(
                              alignment: Alignment.center,
                             decoration: getDateCellShape(dateGettingAdd, dateRanges),
                                child: Text(
                                    textAlign: TextAlign.center,
                                    dateGettingAdd < numberOfDaysThisMonth + 1
                                        ? dateGettingAdd.toString()
                                        : ""),
                              ),
                        ],
                      ),
                        ),
                      );
                    })))
            : const SizedBox.shrink(),
      ],
    );
  }
 
}

