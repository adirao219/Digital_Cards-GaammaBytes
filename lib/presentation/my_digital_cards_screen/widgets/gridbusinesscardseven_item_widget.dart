import '../models/gridbusinesscardseven_item_model.dart';
import 'package:digitalcardsgaammabytes/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class GridbusinesscardsevenItemWidget extends StatelessWidget {
  GridbusinesscardsevenItemWidget(this.gridbusinesscardsevenItemModelObj);

  GridbusinesscardsevenItemModel gridbusinesscardsevenItemModelObj;

  Offset _tapPosition = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (details) => _getTapPosition(details, context),
        onLongPress: () => _showContextMenu(context),
        child: Container(
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
                  115.00,
                ),
                width: getHorizontalSize(
                  115.00,
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
        ));
  }

  void _getTapPosition(TapDownDetails details, BuildContext mainContext) {
    final RenderBox referenceBox = mainContext.findRenderObject() as RenderBox;

    _tapPosition = referenceBox.globalToLocal(details.globalPosition);
  }

  void _showContextMenu(BuildContext context) async {
    final RenderObject? overlay =
        Overlay.of(context)?.context.findRenderObject();

    final result = await showMenu(
        context: context,

        // Show the context menu at the tap location
        position: RelativeRect.fromRect(
            Rect.fromLTWH(_tapPosition.dx, _tapPosition.dy, 30, 30),
            Rect.fromLTWH(0, 0, overlay!.paintBounds.size.width,
                overlay.paintBounds.size.height)),

        // set a list of choices for the context menu
        items: [
          const PopupMenuItem(
            value: 'favorites',
            child: Text('Add To Favorites'),
          ),
          const PopupMenuItem(
            value: 'comment',
            child: Text('Write Comment'),
          ),
          const PopupMenuItem(
            value: 'hide',
            child: Text('Hide'),
          ),
        ]);

    // Implement the logic for each choice here
    switch (result) {
      case 'favorites':
        debugPrint('Add To Favorites');
        break;
      case 'comment':
        debugPrint('Write Comment');
        break;
      case 'hide':
        debugPrint('Hide');
        break;
    }
  }
}
