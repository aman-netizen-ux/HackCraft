import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/state/DashboardProvider/dashboardProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:provider/provider.dart';

class DashboardDesktopBody extends StatefulWidget {
  const DashboardDesktopBody({super.key});

  @override
  State<DashboardDesktopBody> createState() => _DashboardDesktopBodyState();
}

class _DashboardDesktopBodyState extends State<DashboardDesktopBody> {

  @override
  Widget build(BuildContext context) {
    final dashboardProvider = Provider.of<DashboardProvider>(
      context,
    );
    return Row(
      children: [
        Expanded(
          flex: 58,
          child: Column(
            children: [
              SizedBox(
                height: scaleHeight(context, 80),
              ),
              TabButton(
                icon: Icons.dashboard,
                index: 0,
                provider: dashboardProvider,
              ),
              SizedBox(
                height: scaleHeight(context, 20),
              ),
              Visibility(
                visible: dashboardProvider.selectedIndex != 0 ,
                child: TabButton(
                  icon: Icons.hail,
                  index: 1,
                  provider: dashboardProvider,
                ),
              ),
              SizedBox(
                height: scaleHeight(context, 20),
              ),
              Visibility(
                visible: dashboardProvider.selectedIndex != 0,
                child: TabButton(
                  icon: Icons.hearing,
                  index: 2,
                  provider: dashboardProvider,
                ),
              ),
              SizedBox(
                height: scaleHeight(context, 300),
              ),
              TabButton(
                icon: Icons.hearing,
                index: 3,
                provider: dashboardProvider,
              ),
              SizedBox(
                height: scaleHeight(context, 54),
              )
            ],
          ),
        ),
        Expanded(
            flex: 942,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  dashboardProvider.pages[dashboardProvider.selectedIndex]
                ],
              ),
            )),
      ],
    );
  }
}

class TabButton extends StatelessWidget {
  final IconData icon;

  final int index;
  final DashboardProvider provider;

  const TabButton(
      {Key? key,
      required this.icon,
      required this.index,
      required this.provider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        provider.setSelectedIndex(index);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: scaleHeight(context, 15)),
        width: scaleHeight(context, 50),
        height: scaleHeight(context, 50),
        decoration: const BoxDecoration(
          color: grey1,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
        ),
      ),
    );
  }
}
