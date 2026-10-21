import 'package:flutter/material.dart';
import 'package:rick_n_morty/presentation/ui_contants.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ContentList<T> extends StatefulWidget {
  final List<T> content;
  final Widget Function(T item) itemBuilder;
  final int indexToLoad;
  final VoidCallback load;

  const ContentList({
    super.key,
    required this.content,
    required this.load,
    required this.itemBuilder,
    this.indexToLoad = indexToPaginate,
  });

  @override
  State<ContentList<T>> createState() => _ContentListState<T>();
}

class _ContentListState<T> extends State<ContentList<T>> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: widget.content.length,
      itemBuilder: (_, index) {
        final item = widget.content[index];
        return VisibilityDetector(
          key: ValueKey(item),
          onVisibilityChanged: (info) {
            if (index == widget.content.length - widget.indexToLoad &&
                info.visibleFraction > fractionToPaginate) {
              widget.load();
            }
          },
          child: widget.itemBuilder(item),
        );
      },
    );
  }
}
