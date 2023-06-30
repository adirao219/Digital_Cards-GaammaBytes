// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library focused_menu;

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:focused_menu/modals.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../core/utils/color_constant.dart';
import '../../theme/app_style.dart';

const double _kPanelHeaderCollapsedHeight = 48.0;
const double _kPanelHeaderExpandedHeight = 64.0;
const EdgeInsets _kPanelHeaderExpandedDefaultPadding = EdgeInsets.symmetric(
  vertical: 64.0 - _kPanelHeaderCollapsedHeight,
);

class CustomExpansionPanelList extends StatelessWidget {
  const CustomExpansionPanelList(
      {this.children: const <ExpansionPanel>[],
      this.expansionCallback,
      this.expandedHeaderPadding = _kPanelHeaderExpandedDefaultPadding,
      this.elevation = 2,
      this.radius=8,
      this.animationDuration: kThemeAnimationDuration})
      : assert(children != null),
        assert(animationDuration != null);

  final List<ExpansionPanel> children;

  final EdgeInsets expandedHeaderPadding;
  final ExpansionPanelCallback? expansionCallback;

  final Duration animationDuration;
  final double elevation;
  final double radius;
  bool _isChildExpanded(int index) {
    return children[index].isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = <Widget>[];
    // const EdgeInsets kExpandedEdgeInsets = const EdgeInsets.symmetric(
    //     vertical: _kPanelHeaderExpandedHeight - _kPanelHeaderCollapsedHeight);

    for (int index = 0; index < children.length; index += 1) {
      if (_isChildExpanded(index) && index != 0 && !_isChildExpanded(index - 1))
        items.add(new Divider(
          key: new _SaltedKey<BuildContext, int>(context, index * 2 - 1),
          height: 15.0,
          color: Colors.transparent,
        ));

      final Row header = new Row(
        children: <Widget>[
          new Expanded(
            child: new AnimatedContainer(
              duration: animationDuration,
              curve: Curves.fastOutSlowIn,
              margin: _isChildExpanded(index)
                  ? this.expandedHeaderPadding
                  : EdgeInsets.all(5),
              child: new SizedBox(
                height: _kPanelHeaderCollapsedHeight,
                child: children[index].headerBuilder(
                  context,
                  children[index].isExpanded,
                ),
              ),
            ),
          ),
          new Container(
            margin: const EdgeInsetsDirectional.only(end: 8.0),
            child: new ExpandIcon(
              isExpanded: _isChildExpanded(index),
              padding: const EdgeInsets.all(16.0),
              onPressed: (bool isExpanded) {
                if (expansionCallback != null)
                  expansionCallback!(index, isExpanded);
              },
            ),
          ),
        ],
      );

      double _radiusValue = radius;
      items.add(
        new Container(
          key: new _SaltedKey<BuildContext, int>(context, index * 2),
          child: new Material(
            elevation: this.elevation,
            
            borderRadius:
                new BorderRadius.all(new Radius.circular(_radiusValue)),
            child: new Column(
              children: <Widget>[
                header,
                new AnimatedCrossFade(
                  firstChild: new Container(height: 0.0),
                  secondChild: children[index].body,
                  firstCurve:
                      const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
                  secondCurve:
                      const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
                  sizeCurve: Curves.fastOutSlowIn,
                  crossFadeState: _isChildExpanded(index)
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: animationDuration,
                ),
              ],
            ),
          ),
        ),
      );

      if (_isChildExpanded(index) && index != children.length - 1)
        items.add(new Divider(
          key: new _SaltedKey<BuildContext, int>(context, index * 2 + 1),
          height: 15.0,
        ));
    }

    return Container(
        // color: ColorConstant.pink900,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // color: ColorConstant.pink900,
          // border: Border(
          //   left: BorderSide(
          //     color: Colors.green,
          //     width: 3,
          //   ),
          // ),
        ),
        child: Column(
          children: items,
        ));
  }
}

class _SaltedKey<S, V> extends LocalKey {
  const _SaltedKey(this.salt, this.value);

  final S salt;
  final V value;

  @override
  bool operator ==(dynamic other) {
    if (other.runtimeType != runtimeType) return false;
    final _SaltedKey<S, V> typedOther = other;
    return salt == typedOther.salt && value == typedOther.value;
  }

  @override
  int get hashCode => hashValues(runtimeType, salt, value);

  @override
  String toString() {
    final String saltString = S == String ? '<\'$salt\'>' : '<$salt>';
    final String valueString = V == String ? '<\'$value\'>' : '<$value>';
    return '[$saltString $valueString]';
  }
}

// ignore: must_be_immutable
class AppbarSubtitle2 extends StatelessWidget {
  AppbarSubtitle2({required this.text, this.margin, this.onTap});

  String text;

  EdgeInsetsGeometry? margin;

  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Padding(
        padding: margin ?? EdgeInsets.zero,
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppStyle.txtNotoSerifTeluguRegular12.copyWith(
            color: ColorConstant.pink900,
          ),
        ),
      ),
    );
  }
}



class CustomFocusedMenuHolder extends StatefulWidget {
  final Widget child;
  final double? menuItemExtent;
  final double? menuWidth;
  final List<CustomFocusedMenuItem> menuItems;
  final bool? animateMenuItems;
  final BoxDecoration? menuBoxDecoration;
  final Function onPressed;
  final Duration? duration;
  final double? blurSize;
  final Color? blurBackgroundColor;
  final double? bottomOffsetHeight;
  final double? menuOffset;
  /// Open with tap insted of long press.
  final bool openWithTap;

  const CustomFocusedMenuHolder(
      {Key? key,
      required this.child,
      required this.onPressed,
      required this.menuItems,
      this.duration,
      this.menuBoxDecoration,
      this.menuItemExtent,
      this.animateMenuItems,
      this.blurSize,
      this.blurBackgroundColor,
      this.menuWidth,
      this.bottomOffsetHeight,
      this.menuOffset,
      this.openWithTap = false})
      : super(key: key);

  @override
  _CustomFocusedMenuHolderState createState() => _CustomFocusedMenuHolderState();
}

class _CustomFocusedMenuHolderState extends State<CustomFocusedMenuHolder> {
  GlobalKey containerKey = GlobalKey();
  Offset childOffset = Offset(0, 0);
  Size? childSize;

  getOffset(){
    RenderBox renderBox = containerKey.currentContext!.findRenderObject() as RenderBox;
    Size size = renderBox.size;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    setState(() {
      this.childOffset = Offset(offset.dx, offset.dy);
      childSize = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        key: containerKey,
        onTap: () async {
          widget.onPressed();
          if (widget.openWithTap) {
            await openMenu(context);
          }
        },
        onLongPress: () async {
          if (!widget.openWithTap) {
            await openMenu(context);
          }
        },
        child: widget.child);
  }

  Future openMenu(BuildContext context) async {
    getOffset();
    await Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: widget.duration ?? Duration(milliseconds: 100),
            pageBuilder: (context, animation, secondaryAnimation) {
              animation = Tween(begin: 0.0, end: 1.0).animate(animation);
              return FadeTransition(
                  opacity: animation,
                  child: CustomFocusedMenuDetails(
                    itemExtent: widget.menuItemExtent,
                    menuBoxDecoration: widget.menuBoxDecoration,
                    child: widget.child,
                    childOffset: childOffset,
                    childSize: childSize,
                    menuItems: widget.menuItems,
                    blurSize: widget.blurSize,
                    menuWidth: widget.menuWidth,
                    blurBackgroundColor: widget.blurBackgroundColor,
                    animateMenu: widget.animateMenuItems ?? true,
                    bottomOffsetHeight: widget.bottomOffsetHeight ?? 0,
                    menuOffset: widget.menuOffset ?? 0,
                  ));
            },
            fullscreenDialog: true,
            opaque: false));
  }
}

class CustomFocusedMenuDetails extends StatelessWidget {
  final List<CustomFocusedMenuItem> menuItems;
  final BoxDecoration? menuBoxDecoration;
  final Offset childOffset;
  final double? itemExtent;
  final Size? childSize;
  final Widget child;
  final bool animateMenu;
  final double? blurSize;
  final double? menuWidth;
  final Color? blurBackgroundColor;
  final double? bottomOffsetHeight;
  final double? menuOffset;

  const CustomFocusedMenuDetails(
      {Key? key, required this.menuItems, required this.child, required this.childOffset, required this.childSize,required this.menuBoxDecoration, required this.itemExtent,required this.animateMenu,required this.blurSize,required this.blurBackgroundColor,required this.menuWidth, this.bottomOffsetHeight, this.menuOffset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final maxMenuHeight = size.height * 0.45;
    final listHeight = menuItems.where((element) => element.isVisible).length * (itemExtent ?? 50.0);

    final maxMenuWidth = menuWidth??(size.width * 0.70);
    final menuHeight = listHeight < maxMenuHeight ? listHeight : maxMenuHeight;
    final leftOffset = (childOffset.dx+maxMenuWidth ) < size.width ? childOffset.dx: (childOffset.dx-maxMenuWidth+childSize!.width);
    final topOffset = (childOffset.dy + menuHeight + childSize!.height) < size.height - bottomOffsetHeight! ? childOffset.dy + childSize!.height + menuOffset! : childOffset.dy - menuHeight - menuOffset!;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: blurSize??4, sigmaY: blurSize??4),
                  child: Container(
                    color: (blurBackgroundColor??Colors.black).withOpacity(0.7),
                  ),
                )),
            Positioned(
              top: topOffset,
              left: leftOffset,
              child: TweenAnimationBuilder(
                duration: Duration(milliseconds: 200),
                builder: (BuildContext context, dynamic value, Widget? child) {
                  return Transform.scale(
                    scale: value,
                    alignment: Alignment.center,
                    child: child,
                  );
                },
                tween: Tween(begin: 0.0, end: 1.0),
                child: Container(
                  width: maxMenuWidth,
                  height: menuHeight,
                  decoration: menuBoxDecoration ??
                      BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                          boxShadow: [const BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: 1)]),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: ListView.builder(
                      itemCount: menuItems.length,
                      padding: EdgeInsets.zero,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        CustomFocusedMenuItem item = menuItems[index];
                        Widget listItem =Visibility(child:  GestureDetector(
                            onTap:
                                () {
                              Navigator.pop(context);
                              item.onPressed();

                            },
                            child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(bottom: 1),
                                color: item.backgroundColor ?? Colors.white,
                                height: itemExtent ?? 50.0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      item.title,
                                      if (item.trailingIcon != null) ...[item.trailingIcon!]
                                    ],
                                  ),
                                ))),visible: item.isVisible,);
                        if (animateMenu) {
                          return TweenAnimationBuilder(
                              builder: (context, dynamic value, child) {
                                return Transform(
                                  transform: Matrix4.rotationX(1.5708 * value),
                                  alignment: Alignment.bottomCenter,
                                  child: child,
                                );
                              },
                              tween: Tween(begin: 1.0, end: 0.0),
                              duration: Duration(milliseconds: index * 200),
                              child: listItem);
                        } else {
                          return listItem;
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
            Positioned(top: childOffset.dy, left: childOffset.dx, child: AbsorbPointer(absorbing: true, child: Container(
                width: childSize!.width,
                height: childSize!.height,
                child: child))),
          ],
        ),
      ),
    );
  }
}
class CustomFocusedMenuItem {
  Color? backgroundColor;
  Widget title;
  bool isVisible;
  Icon? trailingIcon;
  Function onPressed;

 CustomFocusedMenuItem(
      {this.backgroundColor,
      required this.title,
      this.trailingIcon,
      this.isVisible=true,
      required this.onPressed});
}
