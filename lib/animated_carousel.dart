import 'package:flutter/material.dart';

class AnimatedCarousel extends StatefulWidget {
  const AnimatedCarousel({
    Key? key,
    this.reverse = false,
  }) : super(key: key);

  final bool reverse;

  @override
  _AnimatedCarouselState createState() => _AnimatedCarouselState();
}

class _AnimatedCarouselState extends State<AnimatedCarousel>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late ScrollController _scrollController;
  late int orientationFactor;
  late double offset = 0;

  @override
  void initState() {
    orientationFactor = widget.reverse ? -1 : 1;
    _scrollController = ScrollController();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _controller.repeat();
      _controller.addListener(() {
        offset = offset + 0.4;
        _scrollController.jumpTo(offset);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        reverse: widget.reverse,
        itemBuilder: (context, index) {
          return Align(
            child: Container(
              width: 72,
              height: 72,
              margin: const EdgeInsets.only(right: 8),
              color: Colors.red,
              child: Center(
                child: Text('$index'),
              ),
            ),
          );
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
