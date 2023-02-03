import '../controller/my_digital_cards_controller.dart';
import '../models/gridbusinesscardseven_item_model.dart';
import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GridbusinesscardsevenItemWidget extends StatelessWidget {
  GridbusinesscardsevenItemWidget(this.gridbusinesscardsevenItemModelObj);

  GridbusinesscardsevenItemModel gridbusinesscardsevenItemModelObj;

  var controller = Get.find<MyDigitalCardsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        left: 5,
        top: 3,
        right: 5,
        bottom: 3,
      ),
      decoration: AppDecoration.outlineBlack900.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgBusinesscard7,
            height: getVerticalSize(
              131.00,
            ),
            width: getHorizontalSize(
              123.00,
            ),
            radius: BorderRadius.circular(
              getHorizontalSize(
                5.00,
              ),
            ),
            margin: getMargin(
              left: 3,
              top: 2,
            ),
          ),
          Padding(
            padding: getPadding(
              left: 3,
              top: 2,
            ),
            child: Text(
              "lbl_card_name".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtOdibeeSansRegular14.copyWith(
                letterSpacing: getHorizontalSize(
                  0.36,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
