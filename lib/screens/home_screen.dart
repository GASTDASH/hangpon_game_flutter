import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangpon_game_flutter/screens/game_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              "HangPon",
              style: TextStyle(fontSize: 32.sp, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 32.sp),
            button(
              context,
              text: "ИГРАТЬ",
              icon: Icons.play_circle_outline,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GameScreen()));
              },
            ),
            SizedBox(height: 18.sp),
            button(
              context,
              text: "ДОСТИЖЕНИЯ",
              icon: Icons.emoji_events_outlined,
            ),
            SizedBox(height: 18.sp),
            button(
              context,
              text: "НАСТРОЙКИ",
              icon: Icons.settings_outlined,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("By GASTDASH ~ Alexey Shcherbakov")],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget button(
    BuildContext context, {
    required String text,
    required IconData icon,
    Function()? onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(15.sp),
      onTap: onTap,
      child: Container(
        width: 240.sp,
        height: 80.sp,
        decoration: BoxDecoration(
          border: Border.all(width: 3.sp),
          // color: Colors.lightBlue.shade600,
          // gradient: LinearGradient(
          //   colors: [
          //     Colors.lightBlue.shade100,
          //     Colors.lightBlue.shade300,
          //   ],
          // ),
          borderRadius: BorderRadius.circular(15.sp),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 21.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Icon(
                icon,
                size: 35.sp,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
