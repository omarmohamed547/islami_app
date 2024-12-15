import 'package:flutter/material.dart';
import 'package:islami_app/models/Hadith_model.dart';

import '../../../app_colors.dart';

class HadithDetails extends StatelessWidget {
  static const String hadithdetailsScreenId = "HadithDetails";

  HadithDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)?.settings.arguments as HadithModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          arg.title,
          style: TextStyle(color: AppColors.primarycolor, fontSize: 24),
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: AppColors.primaryBlackcolor,
            child: Image.asset(
              "assets/images/qurandetailsBackground.png",
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Text(
                arg.title,
                style: TextStyle(color: AppColors.primarycolor, fontSize: 24),
              ),
              Expanded(
                child: ListView.builder(
                    //  itemCount: verses.length,
                    itemBuilder: (context, index) {
                  return Text(
                    arg.content[index],
                    style:
                        TextStyle(color: AppColors.primarycolor, fontSize: 24),
                  );
                }),
              )
            ],
          )
        ],
      ),
    );
  }
}
