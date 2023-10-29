import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/state/mainNavigationProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/views/Screens/MainNavigation/Desktop/Sections/Home/home.dart';
import 'package:major_project__widget_testing/views/Screens/MainNavigation/Desktop/Sections/Profile/profile.dart';
import 'package:major_project__widget_testing/views/Screens/MainNavigation/Desktop/Sections/Sponsors/sponsors.dart';
import 'package:provider/provider.dart';

class DesktopMainNavigation extends StatefulWidget {
  const DesktopMainNavigation({super.key});

  @override
  State<DesktopMainNavigation> createState() => _DesktopMainNavigationState();
}

class _DesktopMainNavigationState extends State<DesktopMainNavigation> {
  late List<Widget> _widgetOptions;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _widgetOptions = <Widget>[
      const Home(),
      const Sponsors(),
      const Profile(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final mainNavigationProvider = Provider.of<MainNavigationProvider>(context);

    return Column(
      children: [
        Visibility(
          visible: mainNavigationProvider.currentIndex == 0 ||
              mainNavigationProvider.currentIndex == 1,
          child: Padding(
            padding: EdgeInsets.only(
                right: scaleWidth(context, 81),
                left: scaleWidth(context, 81),
                top: scaleHeight(context, 39)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                        style: GoogleFonts.getFont(fontFamily1,
                            fontSize: scaleHeight(context, 20),
                            color: black1,
                            fontWeight: FontWeight.w400,
                            height: lineHeight(22.4, 20))),
                  ],
                ),

                //search box
                Container(
                  height: scaleHeight(context, 44),
                  width: scaleWidth(context, 450),
                  decoration: BoxDecoration(
                      color: grey1,
                      borderRadius: BorderRadius.circular(rad5_10)),
                ),

                Row(
                  children: [
                    MainNavTab(
                        mainNavigationProvider: mainNavigationProvider,
                        tabIndex: 0,
                        title: 'Home',
                        onTap: () => mainNavigationProvider.currentIndex = 0),
                    MainNavTab(
                        mainNavigationProvider: mainNavigationProvider,
                        tabIndex: 1,
                        title: 'Sponsorship',
                        onTap: () => mainNavigationProvider.currentIndex = 1),
                    MainNavTab(
                        mainNavigationProvider: mainNavigationProvider,
                        tabIndex: 2,
                        title: 'Host',
                        onTap: () => Navigator.pushNamed(context, '/hostNavigation')),
                    InkWell(
                      onTap: () {
                        mainNavigationProvider.currentIndex = 2;
                      },
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: scaleWidth(context, 40),
                              right: scaleWidth(context, 16),
                            ),
                            child: Text('Profile',
                                style: GoogleFonts.getFont(fontFamily2,
                                    fontSize: scaleHeight(context, 14),
                                    color: black1,
                                    fontWeight: FontWeight.w400,
                                    height: lineHeight(23, 14))),
                          ),
                          Container(
                            height: scaleHeight(context, 44),
                            width: scaleHeight(context, 44),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black.withOpacity(0.3),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: _widgetOptions.elementAt(mainNavigationProvider.currentIndex),
        )
      ],
    );
  }
}

class MainNavTab extends StatelessWidget {
  const MainNavTab({
    super.key,
    required this.mainNavigationProvider,
    this.onTap,
    required this.tabIndex,
    required this.title,
  });

  final Function()? onTap;
  final int tabIndex;
  final String title;

  final MainNavigationProvider mainNavigationProvider;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding:
            mainNavigationProvider.currentIndex == tabIndex || tabIndex == 2
                ? EdgeInsets.symmetric(
                    vertical: scaleHeight(context, 4),
                    horizontal: scaleWidth(context, 10))
                : null,
        margin: tabIndex == 0
            ? EdgeInsets.only(right: scaleWidth(context, 40))
            : EdgeInsets.symmetric(horizontal: scaleWidth(context, 40)),
        decoration: tabIndex != 2
            ? mainNavigationProvider.currentIndex == tabIndex
                ? const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                    color: red,
                    width: 2,
                  )))
                : null
            : const BoxDecoration(color: red),
        child: Text(title,
            style: GoogleFonts.getFont(fontFamily2,
                fontSize: scaleHeight(context, 14),
                color: tabIndex == 2 ? Colors.white : black1,
                fontWeight: mainNavigationProvider.currentIndex == tabIndex
                    ? FontWeight.w500
                    : FontWeight.w400,
                height: lineHeight(23, 14))),
      ),
    );
  }
}
