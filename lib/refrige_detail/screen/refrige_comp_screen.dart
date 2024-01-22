import 'package:flutter/material.dart';

import '../data/mock_repository/foods_repository.dart';
import '../data/mock_repository/refrige_repository.dart';
import '../widgets/food_thumb_nail_list.dart';

class RefrigeCompScreen extends StatefulWidget {
  final int refrigeNum;

  const RefrigeCompScreen({
    Key? key,
    required this.refrigeNum,
  }) : super(key: key);

  @override
  State<RefrigeCompScreen> createState() => _RefrigeCompScreenState();
}

class _RefrigeCompScreenState extends State<RefrigeCompScreen> {
  List<Widget> sliverList = [];

  @override
  void initState() {
    super.initState();
    final foodInfos =
        RegisterdFoodsRepository().getFoodDetail(widget.refrigeNum);
    var refrigeItem =
        RegisterdRefrigeRepository().getRefrigeDetail()[widget.refrigeNum];

    for (int i = 0; i < refrigeItem.refrigeCompCount; i++) {
      final samePositionFoodList =
          RegisterdFoodsRepository().filterFoods(foodInfos, false, i + 1);
      sliverList
          .add(FoodThumbNailList(samePositionFoodList: samePositionFoodList));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('냉장실'),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: sliverList,
      ),
    );
  }
}
