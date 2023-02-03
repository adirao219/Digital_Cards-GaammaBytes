import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({this.onChanged});

  RxInt selectedIndex = 0.obs;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgVector,
      type: BottomBarEnum.Vector,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgArrowdownPink900,
      type: BottomBarEnum.Arrowdownpink900,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgArrowdownPink900,
      type: BottomBarEnum.Arrowdownpink900,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgShare,
      type: BottomBarEnum.Share,
    )
  ];

  Function(BottomBarEnum)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: ColorConstant.deepOrangeA1005b,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              getHorizontalSize(
                20.00,
              ),
            ),
            topRight: Radius.circular(
              getHorizontalSize(
                20.00,
              ),
            ),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          currentIndex: selectedIndex.value,
          type: BottomNavigationBarType.fixed,
          items: List.generate(bottomMenuList.length, (index) {
            return BottomNavigationBarItem(
              icon: CustomImageView(
                svgPath: bottomMenuList[index].icon,
                height: getVerticalSize(
                  23.00,
                ),
                width: getHorizontalSize(
                  17.00,
                ),
                color: ColorConstant.pink900,
              ),
              activeIcon: CustomImageView(
                svgPath: bottomMenuList[index].icon,
                height: getVerticalSize(
                  19.00,
                ),
                width: getHorizontalSize(
                  27.00,
                ),
                color: ColorConstant.pink900,
              ),
              label: '',
            );
          }),
          onTap: (index) {
            selectedIndex.value = index;
            onChanged!(bottomMenuList[index].type);
          },
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  Vector,
  Arrowdownpink900,
  Share,
}

class BottomMenuModel {
  BottomMenuModel({required this.icon, required this.type});

  String icon;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
