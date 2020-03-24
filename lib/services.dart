import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

import 'book_model.dart';

const String key = 'UGMaXAbPB25WuYrcvN6tMg';
const String secret = 'mH5FjCZDRnaarDx6oRsemKv258PBxO4nM2LXd32rGE';
const String authorID = '1479015';

class Services {
  static getBooksInfo() async {
    String url =
        'https://www.goodreads.com/author/list/$authorID?format=xml&key=$key';
    final response = await http.get(url);
    var document = xml.parse(response.body);
    var bookElements = document.findAllElements('book');

    return bookElements.map((book) {
      return Book(
        bookTitle: book.findElements('title').first.text,
        authorName: book
            .findElements('authors')
            .first
            .findElements('author')
            .first
            .findElements('name')
            .first
            .text,
        numPages: book.findElements('num_pages').first.text,
        description: book.findElements('description').first.text,
        stars: book.findElements('average_rating').first.text,
        imageUrl: book.findElements('image_url').first.text,
      );
    }).toList();
  }
}
