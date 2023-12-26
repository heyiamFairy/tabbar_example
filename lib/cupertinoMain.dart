import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'animalItem.dart';

class CupertinoMain extends StatefulWidget {
  const CupertinoMain({super.key});

  @override
  State<CupertinoMain> createState() => _CupertinoMainState();
}

class _CupertinoMainState extends State<CupertinoMain> {
  CupertinoTabBar? tabBar;
  List<Animal> animalList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    tabBar = CupertinoTabBar(items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.add)),
    ]);
    animalList.add(
        Animal(animalName: "벌", kind: "곤충", imagePath: "repo/images/bee.png"));
    animalList.add(Animal(
        animalName: "고양이", kind: "포유류", imagePath: "repo/images/cat.png"));
    animalList.add(
        Animal(animalName: "젖소", kind: "곤충", imagePath: "repo/images/cow.png"));
    animalList.add(Animal(
        animalName: "강아지", kind: "곤충", imagePath: "repo/images/dog.png"));
    animalList.add(
        Animal(animalName: "여우", kind: "곤충", imagePath: "repo/images/fox.png"));
    animalList.add(Animal(
        animalName: "원숭이", kind: "영장류", imagePath: "repo/images/monkey.png"));
    animalList.add(
        Animal(animalName: "돼지", kind: "곤충", imagePath: "repo/images/bee.png"));
    animalList.add(
        Animal(animalName: "늑대", kind: "곤충", imagePath: "repo/images/bee.png"));
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoTabScaffold(
          tabBar: tabBar!,
          tabBuilder: (context, value) {
            if (value == 0) {
              return Container(
                child: Center(
                  child: Text('cupertino tab 1'),
                ),
              );
            } else {
              return Container(
                child: Center(child: Text('cupertino tab 2')),
              );
            }
          }),
    );
  }
}