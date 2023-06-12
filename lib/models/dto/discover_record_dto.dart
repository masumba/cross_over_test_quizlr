class DiscoverRecordDto {
  String hashTag;
  int totalItems;
  List<String> topItemTitles;

  DiscoverRecordDto(
      {required this.hashTag,
      required this.totalItems,
      required this.topItemTitles});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiscoverRecordDto &&
          runtimeType == other.runtimeType &&
          hashTag == other.hashTag &&
          totalItems == other.totalItems &&
          topItemTitles == other.topItemTitles;

  @override
  int get hashCode =>
      hashTag.hashCode ^ totalItems.hashCode ^ topItemTitles.hashCode;

  @override
  String toString() {
    return 'DiscoverRecordDto{hashTag: $hashTag, totalItems: $totalItems, topItemTitles: $topItemTitles}';
  }
}
