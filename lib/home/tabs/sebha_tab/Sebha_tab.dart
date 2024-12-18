import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami_app/utilis/app_style.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int count = 0;
  String zekr = "";
  double rotaion = 0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/images/Logohadith.png"),
          Center(
            child: Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
                style: AppStyle.bold36White),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            child: InkWell(
              onTap: () {
                rotaion += 2 * pi / 33;
                count++;
                if (count <= 33) {
                  zekr = "سبحان الله";
                } else if (count <= 66) {
                  zekr = "الحمدلله";
                } else if (count <= 99) {
                  zekr = "  الله أكبر";
                } else {
                  zekr = " لا إله إلا الله";
                }
                setState(() {});
              },
              child: Container(
                height: height * 0.49,
                child: Stack(alignment: Alignment.center, children: [
                  Transform.rotate(
                      angle: rotaion,
                      child: Image.asset("assets/images/sebhaBodyGroub.png")),
                  Column(
                    children: [
                      SizedBox(
                        height: height * 0.14,
                      ),
                      Text(zekr, style: AppStyle.bold36White),
                      SizedBox(
                        height: height * 0.081,
                      ),
                      Text("$count", style: AppStyle.bold36White)
                    ],
                  ),
                ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
