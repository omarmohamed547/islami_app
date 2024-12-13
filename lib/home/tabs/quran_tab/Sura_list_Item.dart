import 'package:flutter/material.dart';

class SuraListItem extends StatelessWidget {
  SuraListItem({
    super.key,
    required this.englishQuranSurahs,
    required this.AyaNumber,
    required this.arabicAuranSuras,
    required this.index,
  });

  final List<String> englishQuranSurahs;
  final List<String> AyaNumber;
  final List<String> arabicAuranSuras;
  int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset("assets/images/GroupsuranNum.png"),
            Text(
              "${index + 1}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(
          width: 24,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "${englishQuranSurahs[index]}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${AyaNumber[index]} Verses",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                "${arabicAuranSuras[index]}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
