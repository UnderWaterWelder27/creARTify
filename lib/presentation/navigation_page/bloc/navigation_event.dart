abstract class NavigationEvent {}

class NavigationChangedPageEvent extends NavigationEvent {
  NavigationChangedPageEvent({required this.pageIndex});

  final int pageIndex;
}