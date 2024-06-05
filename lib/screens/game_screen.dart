import 'dart:math';

import 'package:drawing_animation/drawing_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hangpon_game_flutter/words.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key, required this.theme});

  final String theme;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String word_answer = "дженнифер";
  List<String> chars = <String>[];
  int fails = 0;
  bool anim_run = true;

  @override
  void initState() {
    super.initState();

    fails = 0;
    chars = <String>[];

    Random _random = new Random();
    String _word = word_list[widget.theme]
        [_random.nextInt(word_list[widget.theme].length)];
    word_answer = _word;
  }

  void checkWin() async {
    String word_check = "";
    for (String char1 in word_answer.characters) {
      bool found = false;
      for (String char2 in chars) {
        if (char1 == char2) {
          found = true;
          word_check += char2;
        }
      }
      if (!found) break;
    }
    print("word_answer = " + word_answer);
    print("word_check = " + word_check);
    if (word_answer == word_check) {
      print("Победа");
      await showWinDialog();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40.sp,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title: Text(
          "HangPon",
          style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w800),
        ),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              size: 15.sp,
            )),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 60,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(fails.toString() + "/10",
                  //     style: TextStyle(
                  //         fontSize: 48.sp, fontWeight: FontWeight.w800)),
                  fails > 0
                      ? SizedBox(
                          height: 250.sp,
                          width: 250.sp,
                          // child: Transform.flip(
                          //   flipY: true,
                          //   child: AnimatedDrawing.svg(
                          //     "assets/images/hp_" + fails.toString() + ".svg",
                          //     run: this.anim_run,
                          //     duration: Duration(seconds: 1),
                          //     onFinish: () => setState(() {
                          //       this.anim_run = false;
                          //     }),
                          //     scaleToViewport: true,
                          //     animationCurve: Curves.easeOut,
                          //   ),
                          // ),
                          child: Image.asset(
                            "assets/images/hpe_" + fails.toString() + ".png",
                          ),
                        )
                      // child: Image.asset(
                      //     "assets/images/hp_" + fails.toString() + ".png"))
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Center(
              child: ListView.builder(
                itemCount: word_answer.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.sp),
                    child: Text(
                        chars.contains(word_answer[index])
                            ? word_answer[index].toUpperCase()
                            : "_",
                        style: TextStyle(
                            fontSize: 32.sp, fontWeight: FontWeight.w700)),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 40,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.sp),
              child: fails < 10 ? keyboard() : SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showWinDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.all(14.sp),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.sp)),
          child: Container(
            height: 200.sp,
            width: double.infinity,
            padding: EdgeInsets.all(12.sp),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Победа!",
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    "Вы угадали слово с " + fails.toString() + " ошибками",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> showFailDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.all(14.sp),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.sp)),
          child: Container(
            height: 200.sp,
            width: double.infinity,
            padding: EdgeInsets.all(12.sp),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Вы не угадали :(",
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    "Загаданное слово было - " + word_answer.toString(),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget keyboard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            key_btn("Й"),
            key_btn("Ц"),
            key_btn("У"),
            key_btn("К"),
            key_btn("Е"),
            key_btn("Н"),
            key_btn("Г"),
            key_btn("Ш"),
            key_btn("Щ"),
            key_btn("З"),
            key_btn("Х"),
            key_btn("Ъ"),
          ],
        ),
        SizedBox(height: 5.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            key_btn("Ф"),
            key_btn("Ы"),
            key_btn("В"),
            key_btn("А"),
            key_btn("П"),
            key_btn("Р"),
            key_btn("О"),
            key_btn("Л"),
            key_btn("Д"),
            key_btn("Ж"),
            key_btn("Э"),
          ],
        ),
        SizedBox(height: 5.sp),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              key_btn("Я"),
              key_btn("Ч"),
              key_btn("С"),
              key_btn("М"),
              key_btn("И"),
              key_btn("Т"),
              key_btn("Ь"),
              key_btn("Б"),
              key_btn("Ю"),
            ],
          ),
        ),
      ],
    );
  }

  Widget key_btn(String letter) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.sp),
        child: InkWell(
          onTap: () {
            if (chars.contains(letter.toLowerCase())) {
              // Уже есть
            } else {
              chars.add(letter.toLowerCase());
              if (!word_answer.characters.contains(letter.toLowerCase())) {
                setState(() {
                  anim_run = true;
                  fails++;
                });
              }
              if (fails >= 10) {
                showFailDialog();
              } else {
                checkWin();
              }
              setState(() {});
            }
          },
          child: Container(
            height: 32.sp,
            decoration: BoxDecoration(
                color: chars.contains(letter.toLowerCase())
                    ? word_answer.characters.contains(letter.toLowerCase())
                        ? Colors.green.shade400
                        : Colors.red.shade400
                    : Colors.grey.shade600,
                borderRadius: BorderRadius.circular(6)),
            child: Center(
                child: Text(
              letter,
              style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            )),
          ),
        ),
      ),
    );
  }
}
