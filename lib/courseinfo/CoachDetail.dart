import 'package:flutter/material.dart';
import 'package:flutter_homework/Model/Coach.dart';
import 'package:flutter_homework/courseinfo/CoachDetail_item.dart';
class CoachDetail extends StatelessWidget {
  Result result;

  CoachDetail(this.result):super();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('教練資訊'),
      ),
      body: CustomScrollView(

        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 350,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network('${result.coachPhoto}'),
            ),
          ),
          SliverList(delegate: SliverChildListDelegate([
            coachDetailItem(context, result)
          ]))
        ],
      ),
    );
  }
}
