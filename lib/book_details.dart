import 'package:booksapp/book_model.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  final Book book;
  BookDetails({this.book});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(book.imageUrl),
                          fit: BoxFit.cover,
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[200],
                            blurRadius: 6,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'back',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Text(
                book.bookTitle,
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                book.authorName,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text('${book.numPages} Pages'),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Text('Rating: ${book.stars}')
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Description',
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontSize: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[200],
                          offset: Offset(0, 0),
                          blurRadius: 3,
                          spreadRadius: 1,
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      book.description.replaceAll(RegExp(r'<br />'), ' '),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
