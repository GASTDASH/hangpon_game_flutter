import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangpon_game_flutter/screens/game_screen.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40.sp,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Выбор темы",
          style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w800),
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              size: 15.sp,
            )),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 32.sp),
              button(
                context,
                text: "Всё сразу",
                icon: Icons.generating_tokens_outlined,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GameScreen(theme: "all"))),
              ),
              SizedBox(height: 18.sp),
              button(
                context,
                text: "Общее",
                icon: Icons.workspaces_outline,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GameScreen(theme: "general"))),
              ),
              SizedBox(height: 18.sp),
              button(
                context,
                text: "Пони",
                icon: Icons.bedroom_baby_outlined,
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GameScreen(theme: "pony"))),
              ),
              SizedBox(height: 18.sp),
              button(
                context,
                text: "Майнкрафт",
                icon: Icons.view_in_ar,
              ),
              SizedBox(height: 18.sp),
              button(
                context,
                text: "Еда и напитки",
                icon: Icons.fastfood_outlined,
              ),
              SizedBox(height: 18.sp),
              button(
                context,
                text: "Города России",
                icon: Icons.location_city_rounded,
              ),
              SizedBox(height: 18.sp),
              button(
                context,
                text: "Музыка",
                icon: Icons.library_music_outlined,
              ),
              SizedBox(height: 18.sp),
              button(
                context,
                text: "Животные",
                icon: Icons.pets,
              ),
              SizedBox(height: 18.sp),
            ],
          ),
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
