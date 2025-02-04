abstract class BoardsEvent {}


class BoardsFetchMultipleCategoriesEvent extends BoardsEvent {
  BoardsFetchMultipleCategoriesEvent({
    required this.searchQueries,
    required this.type,
    required this.amount});

  final List<String> searchQueries;
  final String type;
  final int amount;
}