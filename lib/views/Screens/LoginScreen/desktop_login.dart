import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Screens/LoginScreen/SignIn/signIn.dart';
import 'package:major_project__widget_testing/views/Screens/LoginScreen/screenChange.dart';

class LoginPageDesktop extends StatefulWidget {
  const LoginPageDesktop({final Key? key}) : super(key: key);

  @override
  State<LoginPageDesktop> createState() => _LoginPageDesktopState();
}

class _LoginPageDesktopState extends State<LoginPageDesktop>
    with TickerProviderStateMixin {
  late TabController _tabController;
  double girlImageLeft = 520.0;
  late AnimationController _animationController;
  late Animation<double> _positionAnimation;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_tabChanged);
    _animationController = AnimationController(
      duration: const Duration(
          milliseconds: 500), 
      vsync: this,
    );

    _positionAnimation = Tween<double>(
      begin: 520.0,
      end: 930.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
  }

  void _tabChanged() {
    if (_tabController.index == 1) {
      _animationController.forward(); 
    } else {
      _animationController.reverse(); 
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _positionAnimation,
        builder: (context, child) {
          return Scaffold(
            body: Stack(
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/login/loginBackground2.png',
                    width: widthScaler(context, 1440),
                    height: heightScaler(context, 678),
                    fit: BoxFit.fill,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: heightScaler(context, 53)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: heightScaler(context, 15),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: widthScaler(context, 5)),
                            child: Text(
                              "HackCraft",
                              style: GoogleFonts.capriola(
                                color: darkCharcoal,
                                fontSize: heightScaler(context, 21),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: heightScaler(context, 22)),
                      child: Text(
                        "Finish Account Setup",
                        style: GoogleFonts.firaSans(
                          color: darkCharcoal,
                          fontSize: heightScaler(context, 28),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: heightScaler(context, 9),
                          bottom: heightScaler(context, 22)),
                      child: Text(
                        "Create your account setup by providing your proper \n"
                        "                                  biography info",
                        style: GoogleFonts.firaSans(
                          color: darkCharcoal,
                          fontSize: heightScaler(context, 16),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: widthScaler(context, 200),
                                child: TabBar(
                                  controller: _tabController,
                                  tabs: [
                                    Tab(
                                      child: Text(
                                        'SignIn',
                                        style: GoogleFonts.firaSans(
                                            color: darkCharcoal,
                                            fontSize: heightScaler(context, 18),
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        'SignUp',
                                        style: GoogleFonts.firaSans(
                                            color: darkCharcoal,
                                            fontSize: heightScaler(context, 18),
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                  indicatorColor: const Color(0xFF406D80),
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  controller: _tabController,
                                  children: const [
                                    SignIn(),
                                    ScreenChange(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: heightScaler(context, 40),
                            left: _positionAnimation.value,
                            child: Image.asset(
                              'assets/images/login/girl.png',
                              height: 90,
                              width: 90.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
