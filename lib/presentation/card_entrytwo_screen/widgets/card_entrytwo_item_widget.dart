import '../models/card_entrytwo_item_model.dart';
import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:digitalcards_gaammabytes/widgets/custom_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CardEntrytwoItemWidget extends StatelessWidget {
  CardEntrytwoItemWidget(this.cardEntrytwoItemModelObj,
      {this.onTapSelectimage});

  CardEntrytwoItemModel cardEntrytwoItemModelObj;


  VoidCallback? onTapSelectimage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: getPadding(
            top: 11,
            bottom: 3,
          ),
          child: Text(
            "lbl_logo".tr,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: AppStyle.txtNunitoSansRegular14.copyWith(
              letterSpacing: getHorizontalSize(
                0.36,
              ),
            ),
          ),
        ),
        Spacer(),
        CustomButton(
          height: 35,
          width: 118,
          text: "lbl_select_image".tr,
          variant: ButtonVariant.OutlineBlack9003f,
          shape: ButtonShape.RoundedBorder5,
          padding: ButtonPadding.PaddingT9,
          fontStyle: ButtonFontStyle.NunitoSansBlack12,
          prefixWidget: Container(
            margin: getMargin(
              right: 9,
            ),
            child: CustomImageView(
              svgPath: ImageConstant.imgCut,
            ),
          ),
          onTap: onTapSelectimage,
        ),
        Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          margin: getMargin(
            left: 10,
          ),
          color: ColorConstant.pink900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusStyle.roundedBorder5,
          ),
          child: Container(
            height: getVerticalSize(
              35.00,
            ),
            width: getHorizontalSize(
              41.00,
            ),
            padding: getPadding(
              left: 15,
              top: 11,
              right: 15,
              bottom: 11,
            ),
            decoration: AppDecoration.outlineBlack9003f2.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder5,
            ),
            child: Stack(
              children: [
                CustomImageView(
                  svgPath: ImageConstant.imgDelete,
                  height: getVerticalSize(
                    11.00,
                  ),
                  width: getHorizontalSize(
                    8.00,
                  ),
                  alignment: Alignment.topRight,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
