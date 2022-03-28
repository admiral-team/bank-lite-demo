import 'package:flutter/material.dart';

class ExpandedCell extends StatefulWidget {
  final Widget child;
  final bool expanded;
  final VoidCallback? completion;
  final Duration duration;

  const ExpandedCell({
    Key? key,
    required this.expanded,
    required this.child,
    required this.completion,
    this.duration = const Duration(seconds: 1),
  }) : super(key: key);

  @override
  _ExpandedCellState createState() => _ExpandedCellState();
}

class _ExpandedCellState extends State<ExpandedCell> with SingleTickerProviderStateMixin {
  late AnimationController _expandController;
  late Animation<double> _sizeAnimation;
  late Animation<double> _opactityAnimation;

  @override
  void initState() {
    _expandController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 0)
    );
    _sizeAnimation = Tween<double>(begin: 0.0, end: 1.0)
      .animate(CurvedAnimation(
        parent: _expandController, 
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut)
      )
    );
    _opactityAnimation = Tween<double>(begin: 0.0, end: 1.0)
      .animate(CurvedAnimation(
        parent: _expandController, 
        curve: const Interval(0.5, 1.0, curve: Curves.easeInOut)
      )
    );
    _runExpandCheck();
    _expandController.duration = widget.duration;
    _expandController.addStatusListener((status) {
      if (status == AnimationStatus.completed || status == AnimationStatus.dismissed) {
        widget.completion?.call();
      }
    });
    super.initState();
  }

  void _runExpandCheck() {
    if (widget.expanded) {
      _expandController.forward();
    } else {
      _expandController.reverse();
    }
  }

  @override
  void didUpdateWidget(ExpandedCell oldWidget) {
    super.didUpdateWidget(oldWidget);
    _runExpandCheck();
  }

  @override
  void dispose() {
    _expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opactityAnimation,
      child: SizeTransition(
        axis: Axis.vertical,
        sizeFactor: _sizeAnimation,
        child: widget.child,
      ),
    );
  }
}
