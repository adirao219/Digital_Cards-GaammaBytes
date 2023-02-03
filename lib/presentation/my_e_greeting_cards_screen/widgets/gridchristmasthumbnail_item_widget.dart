import '../controller/my_e_greeting_cards_controller.dart';
import '../models/gridchristmasthumbnail_item_model.dart';
import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GridchristmasthumbnailItemWidget extends StatelessWidget {
  GridchristmasthumbnailItemWidget(this.gridchristmasthumbnailItemModelObj);

  GridchristmasthumbnailItemModel gridchristmasthumbnailItemModelObj;

  var controller = Get.find<MyEGreetingCardsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        left: 6,
        top: 3,
        right: 6,
        bottom: 3,
      ),
      decoration: AppDecoration.outlineBlack9002.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgChristmasthumbnail,
            height: getVerticalSize(
              122.00,
            ),
            width: getHorizontalSize(
              121.00,
            ),
            radius: BorderRadius.circular(
              getHorizontalSize(
                5.00,
              ),
            ),
            margin: getMargin(
              left: 2,
            ),
          ),
          Padding(
            padding: getPadding(
              left: 2,
              top: 12,
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
