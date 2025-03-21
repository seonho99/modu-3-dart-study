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

  @override
  String toString() {
    return 'Book{title: $title, publishDate: $publishDate, comment: $comment}';
  }
}

void main() {
  Book book1 = Book(
    title: '한국책',
    comment: '댓글1',
    publishDate: DateTime(24, 01, 01),
  );

  Book book2 = Book(
    title: '한국책',
    comment: '댓글2',
    publishDate: DateTime(24, 01, 01),
  );
  print(book1 == book2);

  Book book3 = Book(
    title: '미국책',
    comment: '댓글3',
    publishDate: DateTime(23, 03, 13),
  );

  Book book4 = Book(
    title: '중국책',
    comment: '댓글4',
    publishDate: DateTime(21, 12, 25),
  );

  final books = [book1, book2, book3, book4];

  final byPublishDate = books.toList()..sort((a,b) => a.publishDate.compareTo(b.publishDate));


  print(book1 == book2);
  print(byPublishDate);
}
