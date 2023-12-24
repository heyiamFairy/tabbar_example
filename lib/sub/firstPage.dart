import 'package:flutter/material.dart';
import '../animalItem.dart';

class FirstApp extends StatelessWidget {
  final List<Animal>? list;
  //처음 FirstApp 객체를 생성할 때 목록이 있어야 하므로 final으로 선언
  //하지만 final로 선언하면 오류가 발생함
  //이럴 때 list를 매개변수로 입력받는 생성자를 추가하면 됨
  FirstApp({Key? key, this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ListView.builder(
              itemBuilder: (context, position) {
                return GestureDetector(
                  //GestureDetector 위젯은 한 번, 두 번 터치, 길게 누르기 끌기 등 손가락 제스처와 관련된 이벤트를 처리함
                  child: Card(
                    //리스트뷰의 아이템은 Card
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          list![position].imagePath!,
                          height: 100,
                          width: 100,
                          fit: BoxFit.contain,
                        ),
                        Text(list![position].animalName!)
                      ],
                    ),
                    //position은 리스트에서 아이템의 위치를 나타냄
                    //position이 1이면 list[1]코드는 목록에서 두번째 아이템을 의미 (0은 첫번째)
                    //각각의 아이템은 animal 객체이므로 리스트에 .animalName, .imagePath와 같은 코드를 붙여 동물 정보를 가져올 수 있음
                  ),
                  onTap: () {
                    // 한 번 터치했을 때 알림 창을 띄우도록 함
                    AlertDialog dialog = AlertDialog(
                      content: Text(
                        '이 동물은 ${list![position].kind}입니다',
                        style: TextStyle(fontSize: 30),
                      ),
                    );

                    showDialog(
                        context: context,
                        builder: (BuildContext context) => dialog);
                    // showDialog() 함수를 호출해 알림창을 띄움
                  },
                );
              },
              itemCount: list!.length),
          //아이템 개수만큼만 스크롤할 수 있게 제한
        ),
      ),
    );
  }
}
