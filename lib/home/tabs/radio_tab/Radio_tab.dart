import 'package:flutter/material.dart';
import 'package:islami_app/app_colors.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset("assets/images/appQuranTabimage.png"),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: AppColors.primarycolor),
                    onPressed: () {},
                    child: Text(
                      "Radio",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )),
              ),
              Expanded(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Colors.transparent),
                    onPressed: () {},
                    child: Text(
                      "Reciters",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        RadioContainerPlay(
          name: "Radio Ibrahim Al-Akdar",
          image: "assets/images/radiocontainer.png",
          iconfirst: "assets/images/Polygon 2.png",
          secondicon: "assets/images/Volume High.png",
        ),
        RadioContainerPlay(
          name: "Radio Ibrahim Al-Akdar",
          image: "assets/images/radiocontainer.png",
          iconfirst: "assets/images/Pause.png",
          secondicon: "assets/images/Volume Cross.png",
        ),
        RadioContainerPlay(
          name: "Radio Ibrahim Al-Akdar",
          image: "assets/images/radiocontainer.png",
          iconfirst: "assets/images/Polygon 2.png",
          secondicon: "assets/images/Volume High.png",
        ),
        RadioContainerPlay(
          name: "Radio Ibrahim Al-Akdar",
          image: "assets/images/radiocontainer.png",
          iconfirst: "assets/images/Polygon 2.png",
          secondicon: "assets/images/Volume High.png",
        )
      ],
    );
  }
}

class RadioContainerPlay extends StatelessWidget {
  String name;
  String image;
  String iconfirst;
  String secondicon;
  RadioContainerPlay({
    required this.iconfirst,
    required this.secondicon,
    required this.name,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(image),
          Positioned(
            bottom: 95,
            child: Text(
              name,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(iconfirst),
              SizedBox(
                width: 12,
              ),
              Image.asset(secondicon),
            ],
          )
        ],
      ),
    );
  }
}
