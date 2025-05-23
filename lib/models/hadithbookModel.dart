class BooklistModel {
  BooklistModel(
      {required this.id,
      required this.nameEnglish,
      required this.nameBengali,
      required this.isActive,
      required this.priority,
      required this.publisherId,
      required this.sectionNumber,
      required this.hadithNumber,
      required this.bookKey,
      required this.lastUpdate});

  final String id;
  final String nameEnglish;
  final String nameBengali;
  final String isActive;
  final String lastUpdate;
  final String priority;
  final String publisherId;
  final String sectionNumber;
  final String hadithNumber;
  final String bookKey;
}
