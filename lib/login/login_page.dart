import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_homework/ApI/Api.dart';
import 'package:flutter_homework/Model/Account.dart';
import 'package:flutter_homework/home/Home.dart';
import 'package:flutter_homework/login/loginProvider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var AccountController = TextEditingController();
  var pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("登入"),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.asset('assets/images/unnamed.jpg'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: AccountController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '請輸入帳號',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  controller: pwdController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '請輸入密碼',
                  ),
                ),
              ),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child:
                  ElevatedButton(
                    child: Text(
                      '登入',
                      style: TextStyle(fontSize: 20),
                    ),

                    // 點擊登入按鈕後才會連接API並確認帳號密碼是否錯誤
                    onPressed: () {
                      // Api.queryAccount(AccountController.text, pwdController.text).then((value) => print(value));
                      Api.queryAccount(
                          AccountController.text, pwdController.text)
                          .then((value) {
                        var data = Account.fromJson((value));
                        // rs == 0 代表通過
                        // rs == 4 代表失敗
                        if (data.rs == 0) {
                          Provider.of<LoginProvider>(context, listen: false).loginState(true);
                          showDialog(
                              context: context,
                              builder: (context) {
                                Future.delayed(Duration(seconds: 1), () {
                                  // 回到 Home 頁面
                                  // pushNamedAndRemoveUntil 會將前面頁面移除
                                  Navigator.pushNamedAndRemoveUntil(context, "/home", (_) => false);
                                });
                                return AlertDialog(
                                  backgroundColor: Colors.grey[800],
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))
                                  ),
                                  content: Container(
                                    height: 25,
                                    width: 80,
                                    child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child:
                                        Text("登入成功", style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white),)
                                    ),
                                  )
                                );
                              }
                          );
                        }

                        else {
                          Provider.of<LoginProvider>(context, listen: false).login(false);
                          // 跳錯誤訊息
                          showDialog(
                              context: context,
                              builder: (context) {
                                Future.delayed(Duration(seconds: 1), () {
                                  Navigator.pop(context);
                                });
                                return AlertDialog(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))
                                  ),
                                  content: Column(
                                    // 對齊方式
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    // (看當下是用Column 或 Row) MainAxisSize.min 盡可能縮減高或寬度等於子組件
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Icon(Icons.announcement_outlined,
                                        color: Colors.white, size: 30,),
                                      Padding(padding: EdgeInsets.only(
                                          right: 20),),
                                      Text("帳號密碼錯誤", style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white),),
                                    ],
                                  ),
                                );
                              }
                          );
                        }
                      });
                    },
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
