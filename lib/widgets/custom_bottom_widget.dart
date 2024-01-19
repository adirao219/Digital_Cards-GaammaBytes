import 'package:flutter/material.dart';
import 'package:pandabar/fab-button.view.dart';
import 'package:pandabar/model.dart';
import 'package:pandabar/pandabar.dart';

class BottomBarButton extends StatefulWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final bool isVisible;

  final VoidCallback? onTap;

  final Color? selectedColor;
  final Color? unselectedColor;

  const BottomBarButton(
      {Key? key,
      this.isSelected = false,
      this.icon = Icons.dashboard,
      this.selectedColor,
      this.unselectedColor,
      this.isVisible = false,
      this.title = '',
      this.onTap})
      : super(key: key);

  @override
  _BottomBarButtonState createState() => _BottomBarButtonState();
}

class _BottomBarButtonState extends State<BottomBarButton>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: Duration(milliseconds: 700),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    animation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 0, end: 10), weight: 50),
      TweenSequenceItem(tween: Tween<double>(begin: 10, end: 0), weight: 50),
    ]).chain(CurveTween(curve: Curves.bounceOut)).animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
        child: Expanded(
          child: InkResponse(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: widget.onTap as void Function(),
            onHighlightChanged: (touched) {
              if (!touched) {
                animationController.forward().whenCompleteOrCancel(() {
                  animationController.reset();
                });
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(widget.icon,
                    color: widget.isSelected
                        ? (widget.selectedColor ?? Color(0xFF078DF0))
                        : (widget.unselectedColor ?? Color(0xFF9FACBE))),
                Container(
                  height: animation.value,
                ),
                Text(widget.title,
                    style: TextStyle(
                        color: widget.isSelected
                            ? (widget.selectedColor ?? Color(0xFF078DF0))
                            : (widget.unselectedColor ?? Color(0xFF9FACBE)),
                        fontWeight: FontWeight.bold,
                        fontSize: 10))
              ],
            ),
          ),
        ),
        visible: widget.isVisible);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class BottomButtonData {
  final dynamic id;
  final IconData icon;
  final Widget? child;
  final String title;
  final bool isVisible;
  final bool isCustomChild;

  BottomButtonData({
    this.id,
    this.isVisible = false,
    this.isCustomChild = false,
    this.child,
    this.icon = Icons.home,
    this.title = '',
  });
}

class CustomBottomWidget extends StatefulWidget {
  final Color? backgroundColor;
  final List<BottomButtonData> buttonData;
  final Widget? fabIcon;

  final Color? buttonColor;
  final Color? buttonSelectedColor;
  final List<Color>? fabColors;

  final Function(dynamic selectedPage) onChange;
  final VoidCallback? onFabButtonPressed;

  const CustomBottomWidget({
    Key? key,
    required this.buttonData,
    required this.onChange,
    this.backgroundColor,
    this.fabIcon,
    this.fabColors,
    this.onFabButtonPressed,
    this.buttonColor,
    this.buttonSelectedColor,
  }) : super(key: key);

  @override
  _CustomBottomWidgetState createState() => _CustomBottomWidgetState();
}

class _CustomBottomWidgetState extends State<CustomBottomWidget> {
  final double fabSize = 50;
  final Color unSelectedColor = Colors.grey;

  dynamic selectedId;

  @override
  void initState() {
    selectedId =
        widget.buttonData.length > 0 ? widget.buttonData.first.id : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final clipper = _PandaBarClipper(fabSize: fabSize);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomPaint(
          painter: _ClipShadowPainter(
            shadow: Shadow(
                color: Colors.white.withOpacity(.1),
                blurRadius: 10,
                offset: Offset(0, -3)),
            clipper: clipper,
          ),
          child: ClipPath(
            clipper: clipper,
            child: Container(
              height: 70,
              padding: EdgeInsets.symmetric(vertical: 10),
              color: widget.backgroundColor ?? Color(0xFF222427),
              child: Builder(builder: (context) {
                List<Widget> leadingChildren = [];
                List<Widget> trailingChildren = [];

                widget.buttonData.asMap().forEach((i, data) {
                  Widget btn = data.isCustomChild
                      ? (Visibility(child: (data.child??Container()),visible:data.isVisible)) 
                      : BottomBarButton(
                          icon: data.icon,
                          isVisible: data.isVisible,
                          title: data.title,
                          isSelected: data.id != null && selectedId == data.id,
                          unselectedColor: widget.buttonColor,
                          selectedColor: widget.buttonSelectedColor,
                          onTap: () {
                            setState(() {
                              selectedId = data.id;
                            });
                            this.widget.onChange(data.id);
                          },
                        );

                  if (i < 2) {
                    leadingChildren.add(btn);
                  } else {
                    trailingChildren.add(btn);
                  }
                });

                return Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: leadingChildren,
                      ),
                    ),
                    Container(width: fabSize),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: trailingChildren,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
        PandaBarFabButton(
          size: fabSize,
          icon: widget.fabIcon,
          onTap: widget.onFabButtonPressed,
          colors: widget.fabColors,
        ),
      ],
    );
  }
}

class _PandaBarClipper extends CustomClipper<Path> {
  final double fabSize;
  final double padding = 50;
  final double centerRadius = 25;
  final double cornerRadius = 5;

  _PandaBarClipper({this.fabSize = 100});

  @override
  Path getClip(Size size) {
    final xCenter = (size.width / 2);

    final fabSizeWithPadding = fabSize + padding;

    final path = Path();
    path.lineTo((xCenter - (fabSizeWithPadding / 2) - cornerRadius), 0);
    path.quadraticBezierTo(xCenter - (fabSizeWithPadding / 2), 0,
        (xCenter - (fabSizeWithPadding / 2)) + cornerRadius, cornerRadius);
    path.lineTo(
        xCenter - centerRadius, (fabSizeWithPadding / 2) - centerRadius);
    path.quadraticBezierTo(xCenter, (fabSizeWithPadding / 2),
        xCenter + centerRadius, (fabSizeWithPadding / 2) - centerRadius);
    path.lineTo(
        (xCenter + (fabSizeWithPadding / 2) - cornerRadius), cornerRadius);
    path.quadraticBezierTo(xCenter + (fabSizeWithPadding / 2), 0,
        (xCenter + (fabSizeWithPadding / 2) + cornerRadius), 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(oldClipper) => false;
}

class _ClipShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
