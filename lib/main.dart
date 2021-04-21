import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'courseinfo/CourseInfo.dart';
import 'home/Home.dart';
import 'login/loginProvider.dart';
import 'login/login_page.dart';
import 'news/Member.dart'; //Android
// import 'package:flutter/cupertino.dart'; iOS

// 進入點
void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => LoginProvider(),
    child: MyApp(),
  ));
}

// StatelessWidget 無狀態元件 快捷：stless
//          用於單純顯示資料使用
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartPage(),

      // Navigator.pushNamed 使用前的預先設定
      initialRoute: '/',
      routes: {
        "/l": (context) => LoginPage(),
        "/home": (context) => Home(),
        "/main": (context) => MyApp(),
      },
    );
  }
}

// StatefulWidget 有狀態元件  快捷：stful
//          用於更改資料使用
class StartPage extends StatefulWidget {
  // createState()：運用createState()來覆寫創建對象的狀態
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int count = 0;

  //  下方 Navbar 點擊的頁面
  int pageIndex = 0;

  // 下方 Navbar 頁面裡的內容
  final pages = [
    Home(),
    CourseInfo(),
    Member(),
  ];

  // 當系統認為或有設定都準備完成後，就會呼叫 build() 來進行畫面建構 Scaffold
  @override
  Widget build(BuildContext context) {
    // Scaffold 類似骨架，骨架裡可以放置多種類別
    return Scaffold(
      // 內容
      body: pages[pageIndex],

      // bottomNavigationBar 位於APP下方的選項列
      bottomNavigationBar: BottomNavigationBar(
        items: [
          //選項樣式和名稱
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'News'),
          BottomNavigationBarItem(
              icon: Icon(Icons.signal_cellular_4_bar_outlined),
              label: 'Signal'),
        ],
        backgroundColor: Colors.grey[800],
        unselectedItemColor: Colors.white,
        fixedColor: Colors.amber,
        //選擇頁顏色
        // 根據傳進來的 Index 去做當前顯示頁數
        currentIndex: pageIndex,

        // 回傳點擊 Index 並儲存，用於 setState 設定
        onTap: (index) {
          // setState()：當需要畫面更新時，就會呼叫此函數，並觸發 build()進重建 Scaffold
          setState(() {
            pageIndex = index;
          });
        },
      ),

      // 下方圓形按鈕
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.adb),
        onPressed: () {
          // setState()：當需要畫面更新時，就會呼叫此函數，並觸發 build()進重建 Scaffold
          setState(() {
            count += 1;
          });
        },
      ),
    );
  }
}
