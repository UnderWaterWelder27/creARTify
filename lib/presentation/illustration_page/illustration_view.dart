import 'package:creartify/network/download_script.dart';
import 'package:creartify/presentation/illustration_page/widgets/illustration_description_widget.dart';
import 'package:creartify/presentation/illustration_page/widgets/illustration_overview_widget.dart';
import 'package:creartify/theme/theme_app.dart';
import 'package:creartify/theme/units.dart';
import 'package:flutter/material.dart';




class IllustrationView extends StatefulWidget {
  static late double illustrationWidth;
  static late double illustrationHeight;
  final dynamic imageData;

  const IllustrationView({
    super.key,
    required this.imageData
  });

  @override
  State<IllustrationView> createState() => _IllustrationViewState();
}




class _IllustrationViewState extends State<IllustrationView> {
  ImageDownloader downloader = ImageDownloader();
  double _dragScrollSheetExtent = 0;
  double _widgetHeight = IllustrationView.illustrationHeight;
  double _widgetWidth = IllustrationView.illustrationWidth;
  double _fabPosition = IllustrationView.illustrationHeight;
  late final DraggableScrollableController _scrollableController;
  late final ScrollController _imageScrollController;
  double _dragOffset = 0;
  bool _isSheetExpanded = false;


  void _expandDraggableSheet() {
    _scrollableController.animateTo(
      _isSheetExpanded ? kInitialDraggableSheetSize : kMaximumDraggableSheetSize,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    _isSheetExpanded = !_isSheetExpanded;
  }


  void _changeFabPositionOnDrag(
      BuildContext context,
      DraggableScrollableNotification notification)
  {
    _widgetHeight = context.size!.height;
    _widgetWidth = context.size!.width;
    _dragScrollSheetExtent = notification.extent;
    _fabPosition = _dragScrollSheetExtent * _widgetHeight;
  }


  void _imageDragDown(BuildContext context) {
    if (_dragOffset > 110) { Navigator.pop(context); }
    else { setState(() => _dragOffset = 0); }
  }


  void _imageDragUp(DragUpdateDetails details) {
    setState(() {
      _dragOffset += details.delta.dy;
      if (_dragOffset < 0) _dragOffset = 0;
    });
  }


  @override
  void initState() {
    _scrollableController = DraggableScrollableController();
    _imageScrollController = ScrollController();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                _imageScrollController.animateTo(
                  _imageScrollController.position.maxScrollExtent / 2,
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.ease,
                );
              },
              onVerticalDragUpdate: (details) => _imageDragUp(details),
              onVerticalDragEnd: (details) => _imageDragDown(context),
              child: Transform.translate(
                offset: Offset(0, _dragOffset),
                child: SingleChildScrollView(
                  controller: _imageScrollController,
                  scrollDirection: Axis.horizontal,
                  child: Image.network(
                    widget.imageData['fullHDURL'] ?? widget.imageData['largeImageURL'],
                    height: getScreenHeight(context),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: kIndentDefault, right: kIndentDefault, top: kIndentSmall * 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    color: globalColors.primaryForeground,
                    iconSize: kIconSmall,
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                  IconButton(
                    onPressed: () async {
                      await downloader.downloadFile(widget.imageData['largeImageURL']);
                    },
                    color: globalColors.primaryForeground,
                    iconSize: kIconSmall,
                    icon: Icon(Icons.file_download_outlined),
                  ),
                ],
              ),
            ),
          ),

          NotificationListener<DraggableScrollableNotification>(
            onNotification: (DraggableScrollableNotification notification) {
              setState(() {
                _changeFabPositionOnDrag(context, notification);
              });
              return true;
            },
            child: DraggableScrollableSheet(
              controller: _scrollableController,
              initialChildSize: kInitialDraggableSheetSize,
              minChildSize: kInitialDraggableSheetSize,
              maxChildSize: kMaximumDraggableSheetSize,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(kRadiusXLarge)),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: IllustrationDescriptionWidget(imageData: widget.imageData),
                  ),
                );
              },
            ),
          ),

          Theme(
            data: ThemeData(useMaterial3: true),
            child: Positioned(
              bottom: _fabPosition - kFabPositionPadding * 0.9,
              right: _widgetWidth/4,
              width: _widgetWidth/2,
              height: kFabPositionPadding * 1.8,

              child: FloatingActionButton(
                backgroundColor: Colors.transparent,
                elevation: 0,
                onPressed: _expandDraggableSheet,
                child: Container(
                  width: _widgetWidth/2,
                  height: kFabPositionPadding * 1.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(kRadiusDefault)),
                    gradient: ThemeApp.gradientColors(globalColors.activeLight, globalColors.activeDark),
                  ),
                  child: IllustrationOverviewWidget(

                  ),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
