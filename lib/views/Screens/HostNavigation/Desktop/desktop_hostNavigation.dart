import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/state/hostNavigationProvider.dart';
import 'package:major_project__widget_testing/state/mainNavigationProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/utils/text_lineheight.dart';
import 'package:major_project__widget_testing/views/Screens/MainNavigation/Desktop/Sections/Home/home.dart';
import 'package:major_project__widget_testing/views/Screens/HostNavigation/Desktop/host.dart';
import 'package:major_project__widget_testing/views/Screens/MainNavigation/Desktop/Sections/Profile/profile.dart';
import 'package:provider/provider.dart';

class DesktopHostNavigation extends StatefulWidget {
  const DesktopHostNavigation({super.key});

  @override
  State<DesktopHostNavigation> createState() => _DesktopHostNavigationState();
}

class _DesktopHostNavigationState extends State<DesktopHostNavigation> {
  late List<Widget> _widgetOptions;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _widgetOptions = <Widget>[
      Home(),
      const HostDesktopBody(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final hostNavigationProvider = Provider.of<HostNavigationProvider>(context);
    final mainNavigationProvider = Provider.of<MainNavigationProvider>(context);

    return Stack(
      children: [
        Center(
            child: Image.asset(
          'assets/images/host/hostbg.png',
          width: double.infinity,
          fit: BoxFit.cover,
        )),
        Column(
          children: [
            Visibility(
                visible: hostNavigationProvider.currentIndex == 1,
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
                      Row(
                        children: [
                          HostNavTab(
                              hostNavigationProvider: hostNavigationProvider,
                              tabIndex: 0,
                              title: 'Hackathons',
                              onTap: () {
                                mainNavigationProvider.currentIndex = 0;
                                Navigator.pop(context);
                              }),
                          HostNavTab(
                            hostNavigationProvider: hostNavigationProvider,
                            tabIndex: 1,
                            title: 'Host',
                            // onTap: ,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: scaleWidth(context, 40),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/profile');
                              },
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      right: scaleWidth(context, 16),
                                    ),
                                    child: Text('Profile',
                                        style: GoogleFonts.getFont(fontFamily2,
                                            fontSize: scaleHeight(context, 16),
                                            color: black1,
                                            fontWeight: FontWeight.w400,
                                            height: lineHeight(23, 16))),
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
                          ),
                        ],
                      )
                    ],
                  ),
                )),
            Expanded(
              child:
                  _widgetOptions.elementAt(hostNavigationProvider.currentIndex),
            )
          ],
        ),
      ],
    );
  }
}

class HostNavTab extends StatelessWidget {
  const HostNavTab({
    super.key,
    required this.hostNavigationProvider,
    this.onTap,
    required this.tabIndex,
    required this.title,
  });

  final Function()? onTap;
  final int tabIndex;
  final String title;

  final HostNavigationProvider hostNavigationProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: tabIndex == 0
          ? EdgeInsets.only(right: scaleWidth(context, 40))
          : EdgeInsets.symmetric(horizontal: scaleWidth(context, 40)),
      child: InkWell(
        onTap: onTap,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Container(
          padding: hostNavigationProvider.currentIndex == tabIndex
              ? EdgeInsets.symmetric(
                  vertical: scaleHeight(context, 4),
                  horizontal: scaleWidth(context, 10))
              : null,
          // margin:

          decoration: hostNavigationProvider.currentIndex == tabIndex
              ? const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                  color: red,
                  width: 2,
                )))
              : null,

          child: Text(title,
              style: GoogleFonts.getFont(fontFamily2,
                  fontSize: scaleHeight(context, 16),
                  color: black1,
                  fontWeight: hostNavigationProvider.currentIndex == tabIndex
                      ? FontWeight.w500
                      : FontWeight.w400,
                  height: lineHeight(23, 16))),
        ),
      ),
    );
  }
}
