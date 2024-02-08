import 'package:flutter/material.dart';

class ControlledPageViewIndicatorWidget extends StatefulWidget {
  /// This widget displays a page indicator for a [PageView] with a [PageController].
  /// If you want to display the UI directly you can use [PageViewIndicatorWidget].
  const ControlledPageViewIndicatorWidget(
      {super.key, required this.pageController, required this.itemLength});

  final PageController pageController;
  final int itemLength;

  @override
  State<ControlledPageViewIndicatorWidget> createState() =>
      _ControlledPageViewIndicatorWidgetState();
}

class _ControlledPageViewIndicatorWidgetState
    extends State<ControlledPageViewIndicatorWidget> {
  int _activeIndex = 0;

  @override
  void initState() {
    super.initState();

    widget.pageController.addListener(() {
      if (widget.pageController.page == null) return;
      setState(() {
        _activeIndex = widget.pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageViewIndicatorWidget(
        itemLength: widget.itemLength, activePage: _activeIndex);
  }
}

class PageViewIndicatorWidget extends StatelessWidget {
  /// This widget displays a page indicator for a [PageView].
  /// You may also want to use [ControlledPageViewIndicatorWidget].
  const PageViewIndicatorWidget(
      {super.key, required this.itemLength, required this.activePage});

  final int itemLength;
  final int activePage;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      for (int i = 0; i < itemLength; i++)
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: AnimatedContainer(
            curve: Curves.easeInExpo,
            duration: const Duration(milliseconds: 300),
            width: 12.0,
            height: 12.0,
            decoration: BoxDecoration(
              color: i == activePage
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.surfaceVariant,
              shape: BoxShape.circle,
            ),
          ),
        ),
    ]);
  }
}
