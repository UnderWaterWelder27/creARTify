// FLUTTER LIBRARIES
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// BOTTOM NAVIGATION PAGE
import 'package:creartify/presentation/navigation_page/navigation_view.dart';
import 'package:creartify/presentation/navigation_page/bloc/navigation_bloc.dart';
import 'package:creartify/presentation/navigation_page/bloc/navigation_event.dart';
// VIEWS
import 'package:creartify/presentation/gallery_page/gallery_view.dart';
// PACKAGES
import 'package:zoom_tap_animation/zoom_tap_animation.dart';


class BoardIconWidget extends StatefulWidget {
  const BoardIconWidget({
    super.key,
    required this.queryToSend,
  });

  final String queryToSend;

  @override
  State<BoardIconWidget> createState() => _BoardIconWidgetState();
}

class _BoardIconWidgetState extends State<BoardIconWidget> with SingleTickerProviderStateMixin {
  bool isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      begin: 1.0,
      end: 0.7,
      beginDuration: const Duration(milliseconds: 50),
      endDuration: const Duration(milliseconds: 250),
      child: TextButton(
        onPressed: () {
          GalleryView.categorizedQuery = widget.queryToSend;
          NavigationView.navClickedIndexNotifier.value = 1;
          context.read<NavigationBloc>().add(NavigationChangedPageEvent(pageIndex: 1));
        },
        child: Icon(
          Icons.queue_play_next,
          color: isButtonPressed ? Colors.orangeAccent : Colors.grey[400],
          size: 35,
        ),
      ),
    );
  }
}
