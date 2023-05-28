import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_app/inner_screens/feeds_screen.dart';
import 'package:grocery_app/services/global_methods.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import '../services/utils.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen(
      {Key? key,
      required this.imagePath,
      required this.title,
      required this.subtitle,
      required this.buttonText})
      : super(key: key);
  final String imagePath, title, subtitle, buttonText;
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).color;
    final themeState = Utils(context).getTheme;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100.h,
              ),
              Image.asset(
                imagePath,
                width: 150.w,
                height: 150.h,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Whoops!',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextWidget(text: title, color: Colors.cyan, textSize: 12.sp),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: TextWidget(
                    text: subtitle, color: Colors.cyan, textSize: 16.sp),
              ),
              SizedBox(
                height: 50.h,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(
                      color: color,
                    ),
                  ),
                  primary: Theme.of(context).colorScheme.secondary,
                  // onPrimary: color,
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.h, vertical: 7.w),
                ),
                onPressed: () {
                  GlobalMethods.navigateTo(
                      ctx: context, routeName: FeedsScreen.routeName);
                },
                child: TextWidget(
                  text: buttonText,
                  textSize: 16.sp,
                  color:
                      themeState ? Colors.grey.shade300 : Colors.grey.shade800,
                  isTitle: true,
                ),
              ),
            ]),
      )),
    );
  }
}
