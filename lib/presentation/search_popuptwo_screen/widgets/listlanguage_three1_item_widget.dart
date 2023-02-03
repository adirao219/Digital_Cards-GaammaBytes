
import '../models/listlanguage_three1_item_model.dart';
import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ListlanguageThree1ItemWidget extends StatelessWidget {
  ListlanguageThree1ItemWidget(this.listlanguageThree1ItemModelObj);

  ListlanguageThree1ItemModel listlanguageThree1ItemModelObj;


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: getPadding(
              bottom: 1,
            ),
            child: Text(
              "lbl_sort_by".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtNotoSerifTeluguRegular12,
            ),
          ),
          Container(
            margin: getMargin(
              left: 13,
              top: 5,
              bottom: 4,
            ),
            padding: getPadding(
              all: 3,
            ),
            decoration: AppDecoration.fillGray5001.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder5,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: getHorizontalSize(
                    3.00,
                  ),
                  decoration: AppDecoration.fillBlack900.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder1,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: getSize(
                          3.00,
                        ),
                        width: getSize(
                          3.00,
                        ),
                        decoration: BoxDecoration(
                          color: ColorConstant.black900,
                          borderRadius: BorderRadius.circular(
                            getHorizontalSize(
                              1.00,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: getPadding(
              left: 4,
              top: 1,
            ),
            child: Text(
              "lbl_published_date".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtNotoSerifTeluguRegular12,
            ),
          ),
          Container(
            height: getSize(
              9.00,
            ),
            width: getSize(
              9.00,
            ),
            margin: getMargin(
              left: 11,
              top: 5,
              bottom: 4,
            ),
            decoration: BoxDecoration(
              color: ColorConstant.gray5001,
              borderRadius: BorderRadius.circular(
                getHorizontalSize(
                  4.00,
                ),
              ),
            ),
          ),
          Padding(
            padding: getPadding(
              left: 4,
              top: 1,
            ),
            child: Text(
              "lbl_created_date".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtNotoSerifTeluguRegular12,
            ),
          ),
        ],
      ),
    );
  }
}
