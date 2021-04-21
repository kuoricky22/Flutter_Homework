import 'package:flutter/material.dart';
import 'package:flutter_homework/Model/News.dart';
import 'package:flutter_homework/home/basic.dart';
import 'package:flutter_html/flutter_html.dart';

class NewsDetail extends StatelessWidget {
  //
  Result result;

  // 構造函數
  NewsDetail(this.result) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('最新消息'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // GestureDetector 觸發事件
          GestureDetector(
            /*
            * Hero
            *   用途:點擊圖片後，圖片會有一個畫面並且獨力呈現，再次點擊就會回復原狀
            *   實際原理: 實際上是使用兩個不同Route但長得一樣的物件，在中間計算補間動畫
            * */
            child: Hero(
              tag: 'imageHero',
              child: Image.network('${result.newsImgUrl}'),
            ),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (_){
                return ImgScreen('${result.newsImgUrl}');
              }));
            },
          ),
          Padding(padding: EdgeInsets.only(left: 16),
            // Html 內容以 Html 形式呈現
            child: Html(
                data: result.newsContent
            ),
          )
        ],
      ),
    );
  }
}
