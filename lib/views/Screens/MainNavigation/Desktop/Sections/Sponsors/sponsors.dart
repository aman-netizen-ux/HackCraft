import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:intl/intl.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/views/Screens/MainNavigation/Desktop/Sections/Profile/customCalendar.dart';
//import 'package:major_project__widget_testing/views/Screens/MainNavigation/Desktop/Sections/Sponsors/sponsors_landing.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Sponsors extends StatelessWidget {
  const Sponsors({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // ListView(
        //   children: const  [
        //     SizedBox(height: 50,),
        //     SponsorsLanding(),
        //      SizedBox(height: 50,),
        //    Placeholder()
        //   ],
        // );

        Row(children: [
      Expanded(
        flex: 200,
        child: Container(),
      ),
      Expanded(
        flex: 800,
        child: Row(children: [
          Expanded(
            flex: 705,
            child: Container(color: Colors.grey.shade300),
          ),
          Expanded(
            flex: 295,
            child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: scaleWidth(context, 18)),
                decoration: BoxDecoration(color: Colors.grey.shade200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Upcoming Hackathons",
                      style: GoogleFonts.getFont(fontFamily2,
                          fontSize: scaleWidth(context, 14),
                          color: black1,
                          fontWeight: FontWeight.w400,
                          height: lineHeight(22.4, 14)),
                    ),
                    SizedBox(height: scaleHeight(context, 8)),
                    ThisMonthCalenderNew(
                      dateRanges: [
                        DateRange(18, 28, Colors.orange),
                        DateRange(1, 5, Colors.blue),
                        DateRange(13, 19, Colors.brown),//13-19 case
                        DateRange(21, 24, Colors.pink),// overlapping problem
                        DateRange(22, 26, Colors.purple),
                        DateRange(22, 26, Colors.green),
                        DateRange(22, 26, Colors.red),
                         DateRange(10, 10, Colors.yellow),
                      ],
                      size: 35,
                    ),

  

                  ],
                )),
          )
        ]),
      )
    ]);
  }
}

// class DateRange {
//   final int start;
//   final int end;
//   final MaterialColor color;

//   DateRange(this.start, this.end, this.color);
// }

// class DateCheckResult {
//   final MaterialColor color;
//   final String description;

//   DateCheckResult(this.color, this.description);
// }

// DateCheckResult? Datecheck(int date, List<DateRange> ranges) {
//   for (DateRange range in ranges) {
//     if(date == range.start&&date == range.end){
//  return DateCheckResult(range.color, "Date is same as start and end");
//     }
//     else if (date == range.start) {
//       return DateCheckResult(range.color, "Date is equal to the start date");
//     } else if (date == range.end) {
//       return DateCheckResult(range.color, "Date is equal to the end date");
//     } else if (date > range.start && date < range.end) {
//       return DateCheckResult(
//           range.color, "Date lies between the start and end dates");
//     }
//   }
//   return null; // Return null if no matching range is found.
// }

// BoxDecoration? getDateCellBoxDecorationBackground(
//     int date, List<DateRange> ranges) {
//   final dateResult = Datecheck(date, ranges);


//    bool isStartDate = dateResult == null
//       ? false
//       : dateResult.description == "Date is equal to the start date";

//   bool isEndDate = dateResult == null
//       ? false
//       : dateResult.description == "Date is equal to the end date";
//   bool isInRange = dateResult == null
//       ? false
//       : dateResult.description == "Date lies between the start and end dates";

//   bool isStartEndDateSame= dateResult == null
//   ?false
//   :dateResult.description == "Date is same as start and end";

//   return dateResult == null ||isStartEndDateSame||
//           isInRange
//       ? null
//       : BoxDecoration(
//           gradient: LinearGradient(
//           colors: [
//             isStartDate
//                 ? dateResult.color.shade100.withOpacity(0)
//                 : dateResult.color.shade100, // Replace with any color you like
//             isStartDate
//                 ? dateResult.color.shade100
//                 : dateResult.color.shade100
//                     .withOpacity(0), // Transition to transparent
//           ],
//           stops: [0.5, 0.5], // This defines the sharp transition point
//           begin: Alignment.centerLeft,
//           end: Alignment.centerRight,
//         ));
// }

// BoxDecoration? getDateCellBoxDecoration(int date, List<DateRange> ranges) {
//   final dateResult = Datecheck(date, ranges);

//   bool isStartDate = dateResult == null
//       ? false
//       : dateResult.description == "Date is equal to the start date";

//   bool isEndDate = dateResult == null
//       ? false
//       : dateResult.description == "Date is equal to the end date";
//   bool isInRange = dateResult == null
//       ? false
//       : dateResult.description == "Date lies between the start and end dates";
//  bool isStartEndDateSame= dateResult == null
//   ?false
//   :dateResult.description == "Date is same as start and end";

//   return dateResult == null
//       ? null
//       : BoxDecoration(
//           shape:
//               isStartDate || isEndDate ||isStartEndDateSame? BoxShape.circle : BoxShape.rectangle,
//           color: isStartDate || isEndDate||isStartEndDateSame
//               ? dateResult.color.shade300
//               : isInRange
//                   ? dateResult.color.shade100
//                   : null,
//         );
// }

// class ThisMonthCalenderNew extends StatelessWidget {
//   final List<DateRange> dateRanges;

//   const ThisMonthCalenderNew({super.key, required this.dateRanges});

//   @override
//   Widget build(BuildContext context) {
//     Map<int, String> dayMap = {
//       1: 'S', // Sunday
//       2: 'M', // Monday
//       3: 'T', // Tuesday
//       4: 'W', // Wednesday
//       5: 'T', // Thursday
//       6: 'F', // Friday
//       7: 'S' // Saturday
//     };
//     String getDayInitial(int dayNumber) {
//       return dayMap[dayNumber] ??
//           'Invalid day'; // Return 'Invalid day' if the number is not 1-7
//     }

//     DateTime now = DateTime.now();
//     DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);
//     int dayOfWeek = firstDayOfMonth.weekday;

//     DateTime firstDayNextMonth;

//     // If it's December, the next month is January of the next year
//     if (now.month == 12) {
//       firstDayNextMonth = DateTime(now.year + 1, 1, 1);
//     } else {
//       firstDayNextMonth = DateTime(now.year, now.month + 1, 1);
//     }

//     int numberOfDays = firstDayNextMonth.difference(firstDayOfMonth).inDays;
//     int numberOfDaysThisMonth = numberOfDays;
//     int dateGettingAdd = 0;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           DateFormat('MMMM').format(now),
//           style: GoogleFonts.getFont(fontFamily2,
//               fontSize: scaleWidth(context, 14),
//               color: black1,
//               fontWeight: FontWeight.w400,
//               height: lineHeight(22.4, 14)),
//         ),
//         SizedBox(height: scaleHeight(context, 4)),
//         Container(
//             width: double.infinity,
//             height: scaleHeight(context, 30),
//             padding: EdgeInsets.symmetric(vertical: scaleHeight(context, 4)),
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: List.generate(7, (index) {
//                   return Expanded(
//                       flex: 1,
//                       child: Text(
//                           textAlign: TextAlign.center,
//                           getDayInitial((index + 1))));
//                 }))),





//         Container(
//             width: double.infinity,
//             height: scaleHeight(context, 30),
//             padding: EdgeInsets.symmetric(vertical: scaleHeight(context, 4)),
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: List.generate(7, (index) {
//                   numberOfDays =
//                       index < dayOfWeek ? numberOfDays - 0 : numberOfDays - 1;
//                   dateGettingAdd =
//                       index < dayOfWeek ? dateGettingAdd : dateGettingAdd + 1;
//                   return Expanded(
//                     flex: 1,
//                     child: Container(
//                       decoration: index < dayOfWeek ? null:getDateCellBoxDecorationBackground(dateGettingAdd, dateRanges),
//                       child: Container(
//                         decoration: index < dayOfWeek ? null:getDateCellBoxDecoration(dateGettingAdd, dateRanges),
//                         child: Text(
//                             textAlign: TextAlign.center,
//                             index < dayOfWeek ? "" : dateGettingAdd.toString()),
//                       ),
//                     ),
//                   );
//                 }))),
//         Container(
//             width: double.infinity,
//             height: scaleHeight(context, 30),
//             padding: EdgeInsets.symmetric(vertical: scaleHeight(context, 4)),
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: List.generate(7, (index) {
//                   numberOfDays = numberOfDays - 1;
//                   dateGettingAdd = dateGettingAdd + 1;
//                   return Expanded(
//                     flex: 1,
//                     child: Container(
//                       decoration: getDateCellBoxDecorationBackground(dateGettingAdd, dateRanges),
//                       child: Container(
//                          decoration: getDateCellBoxDecoration(dateGettingAdd, dateRanges),
//                         child: Text(
//                             textAlign: TextAlign.center, dateGettingAdd.toString()),
//                       ),
//                     ),
//                   );
//                 }))),
//         Container(
//             width: double.infinity,
//             height: scaleHeight(context, 30),
//             padding: EdgeInsets.symmetric(vertical: scaleHeight(context, 4)),
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: List.generate(7, (index) {
//                   numberOfDays = numberOfDays - 1;
//                   dateGettingAdd = dateGettingAdd + 1;
//                   return Expanded(
//                     flex: 1,
//                     child: Container(
//                       decoration: getDateCellBoxDecorationBackground(dateGettingAdd, dateRanges),
//                       child: Container(
//                          decoration: getDateCellBoxDecoration(dateGettingAdd, dateRanges),
//                         child: Text(
//                             textAlign: TextAlign.center,
//                             dateGettingAdd.toString()),
//                       ),
//                     ),
//                   );
//                 }))),
//         Container(
//             width: double.infinity,
//             height: scaleHeight(context, 50),
//             padding: EdgeInsets.symmetric(vertical: scaleHeight(context, 4)),
//             child: Row(
//                 children: List.generate(7, (index) {
//               numberOfDays = numberOfDays - 1;
//               dateGettingAdd = dateGettingAdd + 1;
//               return Expanded(
//                 flex: 1,
//                 child: Container(
//                       decoration: getDateCellBoxDecorationBackground(dateGettingAdd, dateRanges),
//                       child: Container(
//                          decoration: getDateCellBoxDecoration(dateGettingAdd, dateRanges),
//                     child: Text(
//                         textAlign: TextAlign.center, dateGettingAdd.toString()),
//                   ),
//                 ),
//               );
//             }))),
//         dateGettingAdd < numberOfDaysThisMonth + 1
//             ? Container(
//                 width: double.infinity,
//                 height: scaleHeight(context, 30),
//                 padding:
//                     EdgeInsets.symmetric(vertical: scaleHeight(context, 4)),
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: List.generate(7, (index) {
//                       numberOfDays = dateGettingAdd < numberOfDaysThisMonth + 1
//                           ? numberOfDays - 1
//                           : numberOfDays;
//                       dateGettingAdd =
//                           dateGettingAdd < numberOfDaysThisMonth + 1
//                               ? dateGettingAdd + 1
//                               : dateGettingAdd;
//                       return Expanded(
//                         flex: 1,
//                         child: Container(
//                       decoration: getDateCellBoxDecorationBackground(dateGettingAdd, dateRanges),
//                       child: Container(
//                          decoration: getDateCellBoxDecoration(dateGettingAdd, dateRanges),
//                             child: Text(
//                                 textAlign: TextAlign.center,
//                                 dateGettingAdd < numberOfDaysThisMonth + 1
//                                     ? dateGettingAdd.toString()
//                                     : ""),
//                           ),
//                         ),
//                       );
//                     })))
//             : const SizedBox.shrink(),
//         dateGettingAdd < numberOfDaysThisMonth + 1
//             ? Container(
//                 width: double.infinity,
//                 height: scaleHeight(context, 30),
//                 padding:
//                     EdgeInsets.symmetric(vertical: scaleHeight(context, 4)),
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: List.generate(7, (index) {
//                       numberOfDays = dateGettingAdd < numberOfDaysThisMonth + 1
//                           ? numberOfDays - 1
//                           : numberOfDays;
//                       dateGettingAdd =
//                           dateGettingAdd < numberOfDaysThisMonth + 1
//                               ? dateGettingAdd + 1
//                               : dateGettingAdd;
//                       return Expanded(
//                         flex: 1,
//                         child: Container(
//                       decoration: getDateCellBoxDecorationBackground(dateGettingAdd, dateRanges),
//                       child: Container(
//                          decoration: getDateCellBoxDecoration(dateGettingAdd, dateRanges),
//                             child: Text(
//                                 textAlign: TextAlign.center,
//                                 dateGettingAdd < numberOfDaysThisMonth + 1
//                                     ? dateGettingAdd.toString()
//                                     : ""),
//                           ),
//                         ),
//                       );
//                     })))
//             : const SizedBox.shrink(),
//       ],
//     );
//   }
// }

// class ThisMonthCalendar extends StatelessWidget {
//   const ThisMonthCalendar({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Map<int, String> dayMap = {
//       1: 'S', // Sunday
//       2: 'M', // Monday
//       3: 'T', // Tuesday
//       4: 'W', // Wednesday
//       5: 'T', // Thursday
//       6: 'F', // Friday
//       7: 'S' // Saturday
//     };
//     String getDayInitial(int dayNumber) {
//       return dayMap[dayNumber] ??
//           'Invalid day'; // Return 'Invalid day' if the number is not 1-7
//     }

//     DateTime now = DateTime.now();
//     DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);
//     int dayOfWeek = firstDayOfMonth.weekday;

//     DateTime firstDayNextMonth;

//     // If it's December, the next month is January of the next year
//     if (now.month == 12) {
//       firstDayNextMonth = DateTime(now.year + 1, 1, 1);
//     } else {
//       firstDayNextMonth = DateTime(now.year, now.month + 1, 1);
//     }

//     int numberOfDays = firstDayNextMonth.difference(firstDayOfMonth).inDays;
//     int numberOfDaysThisMonth = numberOfDays;
//     int dateGettingAdd = 0;
//     int startdate=18;
//     int enddate=23;

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           DateFormat('MMMM').format(now),
//           style: GoogleFonts.getFont(fontFamily2,
//               fontSize: scaleWidth(context, 14),
//               color: black1,
//               fontWeight: FontWeight.w400,
//               height: lineHeight(22.4, 14)),
//         ),
//         SizedBox(height: scaleHeight(context, 4)),
//         Container(
//             width: double.infinity,
//             height: scaleHeight(context, 30),
//             padding: EdgeInsets.symmetric(vertical: scaleHeight(context, 4)),
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: List.generate(7, (index) {
//                   return Expanded(
//                       flex: 1,
//                       child: Text(
//                           textAlign: TextAlign.center,
//                           getDayInitial((index + 1))));
//                 }))),
//         Container(
//             width: double.infinity,
//             height: scaleHeight(context, 30),
//             padding: EdgeInsets.symmetric(vertical: scaleHeight(context, 4)),
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: List.generate(7, (index) {
//                   numberOfDays =
//                       index < dayOfWeek ? numberOfDays - 0 : numberOfDays - 1;
//                   dateGettingAdd =
//                       index < dayOfWeek ? dateGettingAdd : dateGettingAdd + 1;
//                   return Expanded(
//                     flex: 1,
//                     child: Text(
//                         textAlign: TextAlign.center,
//                         index < dayOfWeek ? "" : dateGettingAdd.toString()),
//                   );
//                 }))),
//         Container(
//             width: double.infinity,
//             height: scaleHeight(context, 30),
//             padding: EdgeInsets.symmetric(vertical: scaleHeight(context, 4)),
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: List.generate(7, (index) {
//                   numberOfDays = numberOfDays - 1;
//                   dateGettingAdd = dateGettingAdd + 1;
//                   return Expanded(
//                     flex: 1,
//                     child: Text(
//                         textAlign: TextAlign.center, dateGettingAdd.toString()),
//                   );
//                 }))),
//         Container(
//             width: double.infinity,
//             height: scaleHeight(context, 30),
//             padding: EdgeInsets.symmetric(vertical: scaleHeight(context, 4)),
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: List.generate(7, (index) {
//                   numberOfDays = numberOfDays - 1;
//                   dateGettingAdd = dateGettingAdd + 1;
//                   return Expanded(
//                     flex: 1,
//                     child: Container(
//                       // color: startdate==dateGettingAdd ||enddate==dateGettingAdd?Colors.orange.shade100: null,

//                       decoration: startdate == dateGettingAdd ||
//                               enddate == dateGettingAdd
//                           ? BoxDecoration(
//                               // Define the gradient here
//                               gradient: LinearGradient(
//                                 colors: [
//                                   startdate == dateGettingAdd
//                                       ? Colors.blue.shade100.withOpacity(0)
//                                       : Colors.blue
//                                           .shade100, // Replace with any color you like
//                                   startdate == dateGettingAdd
//                                       ? Colors.blue.shade100
//                                       : Colors.blue.shade100.withOpacity(
//                                           0), // Transition to transparent
//                                 ],
//                                 stops: [
//                                   0.5,
//                                   0.5
//                                 ], // This defines the sharp transition point
//                                 begin: Alignment.centerLeft,
//                                 end: Alignment.centerRight,
//                               ),
//                             )
//                           : null,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           shape: startdate == dateGettingAdd ||
//                                   enddate == dateGettingAdd
//                               ? BoxShape.circle
//                               : BoxShape.rectangle,
//                           color: startdate == dateGettingAdd ||
//                                   enddate == dateGettingAdd
//                               ? Colors.blue.shade300
//                               : dateGettingAdd > startdate &&
//                                       dateGettingAdd < enddate
//                                   ? Colors.blue.shade100
//                                   : null,
//                         ),
//                         child: Text(
//                             textAlign: TextAlign.center,
//                             dateGettingAdd.toString()),
//                       ),
//                     ),
//                   );
//                 }))),
//         Container(
//             width: double.infinity,
//             height: scaleHeight(context, 50),
//             padding: EdgeInsets.symmetric(vertical: scaleHeight(context, 4)),
//             child: Row(
//                 children: List.generate(7, (index) {
//               numberOfDays = numberOfDays - 1;
//               dateGettingAdd = dateGettingAdd + 1;
//               return Expanded(
//                 flex: 1,
//                 child: Container(
//                   decoration:
//                       startdate == dateGettingAdd || enddate == dateGettingAdd
//                           ? BoxDecoration(
//                               // Define the gradient here
//                               gradient: LinearGradient(
//                                 colors: [
//                                   startdate == dateGettingAdd
//                                       ? Colors.blue.shade100.withOpacity(0)
//                                       : Colors.blue
//                                           .shade100, // Replace with any color you like
//                                   startdate == dateGettingAdd
//                                       ? Colors.blue.shade100
//                                       : Colors.blue.shade100.withOpacity(
//                                           0), // Transition to transparent
//                                 ],
//                                 stops: [
//                                   0.5,
//                                   0.5
//                                 ], // This defines the sharp transition point
//                                 begin: Alignment.centerLeft,
//                                 end: Alignment.centerRight,
//                               ),
//                             )
//                           : null,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       shape: startdate == dateGettingAdd ||
//                               enddate == dateGettingAdd
//                           ? BoxShape.circle
//                           : BoxShape.rectangle,
//                       color: startdate == dateGettingAdd ||
//                               enddate == dateGettingAdd
//                           ? Colors.blue.shade300
//                           : dateGettingAdd > startdate &&
//                                   dateGettingAdd < enddate
//                               ? Colors.blue.shade100
//                               : null,

//                       //  borderRadius:BorderRadius.only(
//                       //   bottomLeft: Radius.circular(index==0?10:0),
//                       //    bottomRight: Radius.circular(index==6?10:0),

//                       //     topLeft: Radius.circular(index==0?10:0),
//                       //      topRight: Radius.circular(index==6?10:0)
//                       //  )
//                     ),
//                     child: Text(
//                         textAlign: TextAlign.center, dateGettingAdd.toString()),
//                   ),
//                 ),
//               );
//             }))),
//         dateGettingAdd < numberOfDaysThisMonth + 1
//             ? Container(
//                 width: double.infinity,
//                 height: scaleHeight(context, 30),
//                 padding:
//                     EdgeInsets.symmetric(vertical: scaleHeight(context, 4)),
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: List.generate(7, (index) {
//                       numberOfDays = dateGettingAdd < numberOfDaysThisMonth + 1
//                           ? numberOfDays - 1
//                           : numberOfDays;
//                       dateGettingAdd =
//                           dateGettingAdd < numberOfDaysThisMonth + 1
//                               ? dateGettingAdd + 1
//                               : dateGettingAdd;
//                       return Expanded(
//                         flex: 1,
//                         child: Text(
//                             textAlign: TextAlign.center,
//                             dateGettingAdd < numberOfDaysThisMonth + 1
//                                 ? dateGettingAdd.toString()
//                                 : ""),
//                       );
//                     })))
//             : const SizedBox.shrink(),
//         dateGettingAdd < numberOfDaysThisMonth + 1
//             ? Container(
//                 width: double.infinity,
//                 height: scaleHeight(context, 30),
//                 padding:
//                     EdgeInsets.symmetric(vertical: scaleHeight(context, 4)),
//                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: List.generate(7, (index) {
//                       numberOfDays = dateGettingAdd < numberOfDaysThisMonth + 1
//                           ? numberOfDays - 1
//                           : numberOfDays;
//                       dateGettingAdd =
//                           dateGettingAdd < numberOfDaysThisMonth + 1
//                               ? dateGettingAdd + 1
//                               : dateGettingAdd;
//                       return Expanded(
//                         flex: 1,
//                         child: Text(
//                             textAlign: TextAlign.center,
//                             dateGettingAdd < numberOfDaysThisMonth + 1
//                                 ? dateGettingAdd.toString()
//                                 : ""),
//                       );
//                     })))
//             : const SizedBox.shrink(),
//       ],
//     );
//   }
// }
