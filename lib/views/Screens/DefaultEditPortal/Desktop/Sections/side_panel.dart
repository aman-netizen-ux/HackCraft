import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/radius.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

class SidePanel extends StatefulWidget {
  const SidePanel({super.key});

  @override
  State<SidePanel> createState() => _SidePanelState();
}

class _SidePanelState extends State<SidePanel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: scaleHeight(context, 45)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
              onTap: () {
                Navigator.pushNamed(context, '/defaultTemplate');
              },
              child: const Icon(
                Icons.menu,
                color: Colors.white,
              )),
       
          Column(
            children: List.generate(6, (index) {
              int selectedSection = 2;
              return SectionButton(
                selectedSection: selectedSection,
                index: index,
              );
            }),
          ),
        
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
              onTap: () {},
              child: SvgPicture.asset(
                  'assets/icons/defaultEditPortal/settings.svg'))
        ],
      ),
    );
  }
}

class SectionButton extends StatelessWidget {
  const SectionButton({
    super.key,
    required this.selectedSection, required this.index,
  });

  final int selectedSection;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
          vertical: scaleHeight(context, 15),
        ).copyWith(
          top: index == 0
              ? 0
              : null, // Remove top margin for the first item
          bottom: index == 5
              ? 0
              : null, // Remove bottom margin for the last item
        ),
      child: InkWell(
      highlightColor: Colors.transparent,
      hoverColor: sectionSelection.withOpacity(0.2),
      splashColor: sectionSelection,
      borderRadius:  BorderRadius.circular(rad5_3),
      
        onTap: () {
          // Add your onTap functionality here
          
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: scaleWidth(context, 19),
            vertical: scaleHeight(context, 14),
          ),
          // margin: EdgeInsets.symmetric(
          //   vertical: scaleHeight(context, 15),
          // ).copyWith(
          //   top: index == 0
          //       ? 0
          //       : null, // Remove top margin for the first item
          //   bottom: index == 5
          //       ? 0
          //       : null, // Remove bottom margin for the last item
          // ),
          decoration: BoxDecoration(
            color: selectedSection == index ? sectionSelection : null,
            borderRadius: BorderRadius.circular(rad5_3),
          ),
          child: SvgPicture.asset(
              'assets/icons/defaultEditPortal/section_icon.svg'),
        ),
      ),
    );
  }
}
