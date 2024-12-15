import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
  SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int count = 0;
  String zekr = "";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/images/Logohadith.png"),
          Center(
            child: Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
              style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          InkWell(
            onTap: () {
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
            child: Stack(alignment: Alignment.center, children: [
              Image.asset("assets/images/sebhaBodyGroub.png"),
              Column(
                children: [
                  Text(
                    zekr,
                    style: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "$count",
                    style: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}
