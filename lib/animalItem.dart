import 'package:flutter/material.dart';

class Animal {
  String? imagePath; //동물 이미지 경로
  String? animalName; //동물 이름
  String? kind; //동물 종류
  bool? flyExist = false; //새로운 Animal 객체를 선언할 때 이를 입력받기 위해 false으로 함

  Animal(
      {required this.animalName,
      required this.kind,
      required this.imagePath,
      this.flyExist});
}

//reauired 은 함수를 호출할 때 꼭 전달해야 하는 값이라는 뜻