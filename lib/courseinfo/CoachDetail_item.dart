import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_homework/Model/Coach.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';

Widget coachDetailItem(BuildContext context, Result result) {
  final listTitle = ['學歷', '專長', '獎項', '經歷'];

  final listContent = [
    '${result.coachContent}',
    '${result.coachEmpertise}',
    '${result.coachAwards}',
    '${result.coachHistory}'
  ];

  return Column(
      children: List.generate(4, (index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 20,
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            '${listTitle[index]}',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900]),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Html(
            data: '<div>${listContent[index]}</div>',
            style: {
              'div': Style(
                fontSize:FontSize(16),
                fontWeight: FontWeight.bold
              ),
            }
          )
        )
      ],
    );
  }));
}
