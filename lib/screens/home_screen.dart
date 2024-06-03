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
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "HangPon",
          style: TextStyle(fontSize: 42.sp, fontWeight: FontWeight.w800),
        ),
        // leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 32.sp),
            InkWell(
              borderRadius: BorderRadius.circular(15.sp),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GameScreen()));
              },
              child: Container(
                width: 240.sp,
                height: 80.sp,
                decoration: BoxDecoration(
                  border: Border.all(width: 3.sp),
                  // color: Colors.lightBlue.shade600,
                  borderRadius: BorderRadius.circular(15.sp),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "ИГРАТЬ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Icon(
                        Icons.play_circle_outline,
                        size: 35.sp,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
