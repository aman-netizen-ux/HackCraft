import 'package:flutter/material.dart';
import 'package:major_project__widget_testing/views/Screens/MainNavigation/Desktop/Sections/Home/Hackathons/Hackathon.dart';
import 'package:major_project__widget_testing/views/Screens/MainNavigation/Desktop/Sections/Home/home_landing.dart';

final GlobalKey hackathonKey = GlobalKey();

class Home extends StatelessWidget {
  Home({super.key});
  final ScrollController _scrollController = ScrollController();

  void _scrollToHackathons() {
    // Scroll to the position of the hackathonKey
    final context = hackathonKey.currentContext;
    if (context != null) {
      // Get the RenderBox of the widget
      final renderBox = context.findRenderObject() as RenderBox;
      // Get the offset of the widget
      final offset = renderBox.localToGlobal(Offset.zero);

      // Scroll to the offset of the widget with animation
      _scrollController.animateTo(offset.dy,
          duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: _scrollController,
      children: [
        const SizedBox(
          height: 25,
        ),
        HomeLanding(onExploreTap: _scrollToHackathons),
        const SizedBox(height: 150),
        HomeHackathon(key: hackathonKey)
      ],
    );
  }
}
