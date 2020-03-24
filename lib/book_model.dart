class Book {
  final String bookTitle;
  final String authorName;
  final String description;
  final String stars;
  final String imageUrl;
  final String numPages;

  Book(
      {this.imageUrl,
      this.authorName,
      this.numPages,
      this.bookTitle,
      this.description,
      this.stars});
}
