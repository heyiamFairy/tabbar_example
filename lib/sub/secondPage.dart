import 'package:flutter/material.dart';
import '../animalItem.dart';

class SecondApp extends StatefulWidget {
  //처음 FirstApp 객체를 생성할 때 목록이 있어야 하므로 final으로 선언
  //하지만 final로 선언하면 오류가 발생함
  //이럴 때 list를 매개변수로 입력받는 생성자를 추가하면 됨
  @override
  State<SecondApp> createState() => _SecondApp();
  // createState() => _SecondAppState() 코드는 _SecondApp()를 반환하는 createState()함수
  final List<Animal>? list;
  SecondApp({Key? key, this.list}) : super(key: key);
}

class _SecondApp extends State<SecondApp> {
  final nameController = TextEditingController();
  // nameController를 사용하기 위해 TextEditingController() 함수의 반환값을 받는 변수를 final로 선언
  int? _radioValue = 0;
  bool? flyExist = false;
  String? _imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                //키보드 타입은 Text를 넣을 수 있는 타입
                maxLines: 1,
              ),
              Row(
                children: <Widget>[
                  Radio(
                      value: 0,
                      groupValue: _radioValue,
                      onChanged: _radioChange),
                  Text('양서류'),
                  Radio(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: _radioChange),
                  Text('파충류'),
                  Radio(
                      value: 2,
                      groupValue: _radioValue,
                      onChanged: _radioChange),
                  Text('포유류'),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
              // 라디오 버튼을 만드려면 value, groupValue, onChanged 값을 지정해야 함
              // value는 인덱스값, groupValue는 그룹화, onChanged는 이벤트 처리
              Row(
                children: <Widget>[
                  Text('날 수 있나요?'),
                  Checkbox(
                      value: flyExist,
                      onChanged: (bool? check) {
                        setState(() {
                          flyExist = check;
                        });
                      })
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
              // 날 수 있는지 체크박스
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    GestureDetector(
                      child: Image.asset('repoo/images/cow.png', width: 80),
                      onTap: () {
                        _imagePath = 'repo/images/cow.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repoo/images/pig.png', width: 80),
                      onTap: () {
                        _imagePath = 'repo/images/pig.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repoo/images/bee.png', width: 80),
                      onTap: () {
                        _imagePath = 'repo/images/bee.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repoo/images/cat.png', width: 80),
                      onTap: () {
                        _imagePath = 'repo/images/cat.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repoo/images/fox.png', width: 80),
                      onTap: () {
                        _imagePath = 'repo/images/fox.png';
                      },
                    ),
                    GestureDetector(
                      child: Image.asset('repoo/images/monkey.png', width: 80),
                      onTap: () {
                        _imagePath = 'repo/images/monkey.png';
                      },
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  child: Text('동물 추가하기'),
                  onPressed: () {
                    var animal = Animal(
                        animalName: nameController.value.text,
                        kind: getKind(_radioValue),
                        imagePath: _imagePath,
                        flyExist: flyExist);
                    AlertDialog dialog = AlertDialog(
                      title: Text('동물 추가하기'),
                      content: Text(
                        '이 동물은 ${animal.animalName}입니다'
                        '또 이 동물의 종류는 ${animal.kind}입니다. \n이 동물을 추가하시겠습니까?',
                        style: TextStyle(fontSize: 30),
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            widget.list?.add(animal);
                            Navigator.of(context).pop();
                          },
                          child: Text('예'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('아니요'),
                        ),
                      ],
                    );
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => dialog);
                  })
            ],
          ),
        ),
      ),
    );
  }

  _radioChange(int? value) {
    setState(() {
      _radioValue = value;
    });
  }
}

getKind(int? radioValue) {
  switch (radioValue) {
    case 0:
      return "양서류";
    case 1:
      return "파충류";
    case 2:
      return "포유류";
  }
}
