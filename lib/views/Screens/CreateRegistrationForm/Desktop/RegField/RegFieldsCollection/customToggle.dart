import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/constants/fontfamily.dart';
import 'package:major_project__widget_testing/state/Registration.dart/createRegistrationProvider.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';
import 'package:major_project__widget_testing/views/Components/toolTip_custom_decoration.dart';
import 'package:provider/provider.dart';



class CustomToggle extends StatefulWidget {
  const CustomToggle(
      {super.key,
      required this.name,
      required this.iconPath,
      required this.onTap,
      required this.isChecked,
      required this.activeColor});
  final String name;
  final String iconPath;

  final void Function()? onTap;
  final bool isChecked;
  final Color activeColor;

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    // Initialize animation based on initial isChecked state
    if (widget.isChecked) {
      _animationController.value =
          1.0; // Set to end position if initially checked
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(CustomToggle oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update the animation when the isChecked value changes
    if (widget.isChecked != oldWidget.isChecked) {
      widget.isChecked
          ? _animationController.forward()
          : _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Tooltip(
            message: widget.isChecked? "Required Field": "Not Required Field",
            verticalOffset: 5,
            decoration: const ShapeDecoration(
              shape: ToolTipCustomDecoration(
                  side: TooltipSide.top, borderColor: greyish3, borderWidth: 0),
              color: greyish7,
            ),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Stack(
          children: [
            Container(
              height: scaleHeight(context, 40),
              width: scaleWidth(context, 65),
              // margin: EdgeInsets.symmetric(
              //   vertical: scaleHeight(context, 2.81),
              //   horizontal: scaleWidth(context, 0.375),
              // ),
              decoration: BoxDecoration(
                color: widget.isChecked ? widget.activeColor : grey5,
                borderRadius:
                    BorderRadius.circular(5), // Adjusted for smaller size
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Align(
                    alignment: Alignment.lerp(Alignment.centerLeft,
                        Alignment.centerRight, _animation.value)!,
                    child: Container(
                      height: scaleWidth(context, 20),
                      width: scaleWidth(context, 20),
                      margin: EdgeInsets.symmetric(
                        horizontal: scaleWidth(context, 5)
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(5), // Adjusted for smaller size
                      ),
                      child: Text('*',
                      textAlign: TextAlign.center,
                          style: GoogleFonts.getFont(
                            fontFamily2,
                            fontSize: scaleWidth(context, 20),
                            color: black1,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
