import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:leute/view/widget/custom_widgets/super_container.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../../data/models/foods_model.dart';
import '../../../styles/app_text_style.dart';
import '../my_food_detail_page_widget/food_detail_image_widget.dart';

class FoodThumbNail extends StatelessWidget {
  const FoodThumbNail(
      {super.key,
      required this.foodItem,
      required this.period,
      required this.extendPeriod,
      required this.isManager});

  final int period;
  final int extendPeriod;
  final FoodDetail foodItem;
  final bool isManager;

  @override
  Widget build(BuildContext context) {
    int passedDate = DateTime.now()
        .difference(DateTime.fromMillisecondsSinceEpoch(foodItem.registerDate))
        .inDays;
    int remainPeriod = period - passedDate;
    if (foodItem.isExtended == true) {
      remainPeriod += extendPeriod;
    }
    return GestureDetector(
      onTap: () {
        if (isManager) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodDetailImageWidget(
                itemImage: foodItem.foodImage,
              ),
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.only(top: 4, left: 8),
        child: Column(
          children: [
            WidgetAnimator(
                incomingEffect:
                    WidgetTransitionEffects.incomingSlideInFromBottom(),
                atRestEffect: WidgetRestingEffects.swing(
                  numberOfPlays: 2,
                ),
                child: SuperContainer(
                  height: 70,
                  width: 80,
                  border: 50,
                  borderWidth: 5,
                  borderColor: Color(0xFF254e7a),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      foodItem.foodImage,
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(12),
                color: Colors.black,
                strokeWidth: 1,
                child: Container(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Column(
                      children: [
                        Text('주인: ${foodItem.userName}',
                            style: AppTextStyle.body12R()),
                        Text('남은날: $remainPeriod 일',
                            style: AppTextStyle.body12R())
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
