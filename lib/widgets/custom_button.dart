import 'package:digitalcards_gaammabytes/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {this.shape,
      this.padding,
      this.variant,
      this.fontStyle,
      this.alignment,
      this.margin,
      this.onTap,
      this.width,
      this.height,
      this.text,
      this.prefixWidget,
      this.suffixWidget});

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  EdgeInsetsGeometry? margin;

  VoidCallback? onTap;

  double? width;

  double? height;

  String? text;

  Widget? prefixWidget;

  Widget? suffixWidget;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: TextButton(
        onPressed: onTap,
        style: _buildTextButtonStyle(),
        child: _buildButtonWithOrWithoutIcon(),
      ),
    );
  }

  _buildButtonWithOrWithoutIcon() {
    if (prefixWidget != null || suffixWidget != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prefixWidget ?? SizedBox(),
          Text(
            text ?? "",
            textAlign: TextAlign.center,
            style: _setFontStyle(),
          ),
          suffixWidget ?? SizedBox(),
        ],
      );
    } else {
      return Text(
        text ?? "",
        textAlign: TextAlign.center,
        style: _setFontStyle(),
      );
    }
  }

  _buildTextButtonStyle() {
    return TextButton.styleFrom(
      fixedSize: Size(
        getHorizontalSize(width ?? 0),
        getVerticalSize(height ?? 0),
      ),
      padding: _setPadding(),
      backgroundColor: _setColor(),
      shadowColor: _setTextButtonShadowColor(),
      shape: RoundedRectangleBorder(
        borderRadius: _setBorderRadius(),
      ),
    );
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingT9:
        return getPadding(
          top: 9,
          right: 9,
          bottom: 9,
        );
      case ButtonPadding.PaddingAll18:
        return getPadding(
          all: 18,
        );
      default:
        return getPadding(
          all: 9,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.OutlineBlack9003f:
        return ColorConstant.pink900;
      case ButtonVariant.OutlineBlack9003f_1:
        return ColorConstant.deepOrangeA10033;
      default:
        return ColorConstant.pink900;
    }
  }

  _setTextButtonShadowColor() {
    switch (variant) {
      case ButtonVariant.OutlineBlack9003f:
        return ColorConstant.black9003f;
      case ButtonVariant.OutlineBlack9003f_1:
        return ColorConstant.black9003f;
      default:
        return null;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.RoundedBorder28:
        return BorderRadius.circular(
          getHorizontalSize(
            28.00,
          ),
        );
      case ButtonShape.RoundedBorder15:
        return BorderRadius.circular(
          getHorizontalSize(
            15.00,
          ),
        );
      case ButtonShape.RoundedBorder5:
        return BorderRadius.circular(
          getHorizontalSize(
            5.00,
          ),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            20.00,
          ),
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.NunitoSansBlack16:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Nunito Sans',
          fontWeight: FontWeight.w900,
        );
      case ButtonFontStyle.InterSemiBold14:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
        );
      case ButtonFontStyle.NovaCut16:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Nova Cut',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.NunitoSansBold14:
        return TextStyle(
          color: ColorConstant.pink900,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Nunito Sans',
          fontWeight: FontWeight.w700,
        );
      case ButtonFontStyle.NunitoSansBlack12:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Nunito Sans',
          fontWeight: FontWeight.w900,
        );
      case ButtonFontStyle.NunitoSansBold16:
        return TextStyle(
          color: ColorConstant.pink900,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Nunito Sans',
          fontWeight: FontWeight.w700,
        );
      default:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Nunito Sans',
          fontWeight: FontWeight.w900,
        );
    }
  }
}

enum ButtonShape {
  Square,
  CircleBorder20,
  RoundedBorder28,
  RoundedBorder15,
  RoundedBorder5,
}
enum ButtonPadding {
  PaddingAll9,
  PaddingT9,
  PaddingAll18,
}
enum ButtonVariant {
  FillPink900,
  OutlineBlack9003f,
  OutlineBlack9003f_1,
}
enum ButtonFontStyle {
  NunitoSansBlack14,
  NunitoSansBlack16,
  InterSemiBold14,
  NovaCut16,
  NunitoSansBold14,
  NunitoSansBlack12,
  NunitoSansBold16,
}
