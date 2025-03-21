class Book {
  String title;
  DateTime publishDate;
  String comment;

  Book({required this.title, required this.comment, DateTime? publishDate})
    : publishDate = publishDate ?? DateTime.now();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          title == other.title &&
          publishDate == other.publishDate &&
          runtimeType == other.runtimeType;

  @override
  int get hashCode => title.hashCode ^ publishDate.hashCode;
}

void main() {
  Book book1 = Book(
    title: '한국책',
    comment: '댓글1',
    publishDate: DateTime(24, 01, 01),
  );

  Book book2 = Book(
    title: '한국책',
    comment: '댓글1',
    publishDate: DateTime(24, 01, 01),
  );
  print(book1 == book2);
}
