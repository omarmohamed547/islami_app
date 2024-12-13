import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';

class SuraConteent extends StatefulWidget {
  String content;
  int index;
  final VoidCallback onTap;
  bool isSelected;
  SuraConteent(
      {required this.content,
      required this.onTap,
      required this.index,
      required this.isSelected,
      super.key});

  @override
  State<SuraConteent> createState() => _SuraConteentState();
}

class _SuraConteentState extends State<SuraConteent> {
  @override
  Widget build(BuildContext context) {
    final Color containerColor = widget.isSelected
        ? AppColors.primarycolor
        : AppColors.primaryBlackcolor;
    final Color textColor = widget.isSelected
        ? AppColors.primaryBlackcolor
        : AppColors.primarycolor;

    final double textSize = widget.isSelected ? 24 : 18;
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 22, vertical: 4),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: AppColors.primarycolor, width: 2)),
        child: Text(
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          "${widget.content}[${widget.index + 1}]",
          style: TextStyle(fontSize: textSize, color: textColor),
        ),
      ),
    );
  }
}
