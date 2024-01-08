import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:major_project__widget_testing/constants/colors.dart';
import 'package:major_project__widget_testing/utils/scaling.dart';

class ColorWidget extends StatelessWidget {
  const ColorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "Text Color",
      child: InkWell(
        onTap: (){},
        child: Container(
          height: scaleHeight(context, 37),
          width: scaleHeight(context, 37),
          // color: Colors.pink[100],
          padding: EdgeInsets.symmetric(
              vertical: scaleHeight(context, 3),
              horizontal: scaleHeight(context, 5)),
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: scaleHeight(context, 20.5),
                child: SvgPicture.asset("assets/icons/defaultEditPortal/color.svg"),
              ),
              Container(
                height: scaleHeight(context, 4.5),
                //  margin: EdgeInsets.only(
                //    top: scaleHeight(context, 4)
                //  ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50), color: darkBlue),
              )
            ],
          ),
        ),
      ),
    );
  }
}