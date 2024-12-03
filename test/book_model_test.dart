import 'dart:convert';
import 'package:flutter_book_search_app/data/model/book.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'Book model test',
    () {
      String dummyData = """
{
      "title": "Harry",
      "link": "https://search.shopping.naver.com/book/catalog/32545811884",
      "image": "https://shopping-phinf.pstatic.net/main_3254581/32545811884.20220523152733.jpg",
      "author": "",
      "discount": "34470",
      "publisher": "Green Hill Publishing",
      "pubdate": "20200515",
      "isbn": "9781922337658",
      "description": "When 18-year-old Harry is just beginning to find his feet after a difficult childhood in post-WWI Adelaide, he experiences heart-rending rejection and runs away to the Australian outback where, as an awkward station hand, he discovers a rare talent for shearing. Success as a gun shearer gives him confidence he’s only dreamed of but also brings with it, the biggest battle of his life. A challenge that needs someone bigger than himself to overcome."
    }
""";
      Map<String, dynamic> map = jsonDecode(dummyData);
      Book book = Book.fromJson(map);
      expect(book.discount, '34470');
      print(book.toJson());
    },
  );
}
