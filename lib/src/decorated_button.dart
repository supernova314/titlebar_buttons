import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:window_decorations/src/theme_type.dart';

class DecoratedMinimizeButton extends StatelessWidget {
  /// Specify the type of theme you want to be
  /// used for the window decorations
  final ThemeType type;

  /// Specify a nullable onPressed callback
  /// used when this button is pressed
  final VoidCallback? onPressed;

  const DecoratedMinimizeButton({
    Key? key,
    required this.type,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawDecoratedWindowButton(
      type: type,
      name: 'minimize',
      onPressed: onPressed,
    );
  }
}

class DecoratedMaximizeButton extends StatelessWidget {
  /// Specify the type of theme you want to be
  /// used for the window decorations
  final ThemeType type;

  /// Specify a nullable onPressed callback
  /// used when this button is pressed
  final VoidCallback? onPressed;

  const DecoratedMaximizeButton({
    Key? key,
    required this.type,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawDecoratedWindowButton(
      type: type,
      name: 'maximize',
      onPressed: onPressed,
    );
  }
}

class DecoratedCloseButton extends StatelessWidget {
  /// Specify the type of theme you want to be
  /// used for the window decorations
  final ThemeType type;

  /// Specify a nullable onPressed callback
  /// used when this button is pressed
  final VoidCallback? onPressed;

  const DecoratedCloseButton({
    Key? key,
    required this.type,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawDecoratedWindowButton(
      type: type,
      name: 'close',
      onPressed: onPressed,
    );
  }
}

class RawDecoratedWindowButton extends StatefulWidget {
  const RawDecoratedWindowButton({
    Key? key,
    required this.type,
    required this.name,
    required this.onPressed,
  }) : super(key: key);

  /// Specify the type of theme you want to be
  /// used for the window decorations
  final ThemeType type;

  /// Specify the name of the button that
  /// you are trying to create
  final String name;

  /// Specify a nullable onPressed callback
  /// used when this button is pressed
  final VoidCallback? onPressed;

  @override
  State<RawDecoratedWindowButton> createState() =>
      _RawDecoratedWindowButtonState();
}

class _RawDecoratedWindowButtonState extends State<RawDecoratedWindowButton> {
  bool isHovering = false;
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    onEntered(bool hover) => setState(() {
          isHovering = hover;
        });

    onActive(bool hover) => setState(() {
          isActive = hover;
        });

    return MouseRegion(
      onExit: (value) => onEntered(false),
      onHover: (value) => onEntered(true),
      child: GestureDetector(
        onTapDown: (_) => onActive(true),
        onTapCancel: () => onActive(false),
        child: RawMaterialButton(
          shape: const CircleBorder(),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          padding: const EdgeInsets.all(4),
          constraints: const BoxConstraints(minWidth: 15),
          child: SvgPicture.asset(
            'packages/window_decorations/assets/themes/${describeEnum(widget.type).replaceAll('_', '-')}${widget.type == ThemeType.pop || widget.type == ThemeType.arc || widget.type == ThemeType.materia || widget.type == ThemeType.united || widget.type == ThemeType.unity ? Theme.of(context).brightness == Brightness.dark ? '-dark' : '-light' : ''}/${widget.name}${isActive ? '-active' : isHovering ? '-hover' : ''}.svg',
            color: (!isHovering &&
                        !isActive &&
                        widget.type == ThemeType.yaru &&
                        widget.name != 'close' ||
                    widget.type == ThemeType.breeze ||
                    !isHovering &&
                        !isActive &&
                        widget.type == ThemeType.adwaita)
                ? Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black
                : null,
          ),
          onPressed: widget.onPressed,
        ),
      ),
    );
  }
}
