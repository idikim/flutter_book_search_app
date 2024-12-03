//  {
//       "title": "Harry",
//       "link": "https://search.shopping.naver.com/book/catalog/32545811884",
//       "image": "https://shopping-phinf.pstatic.net/main_3254581/32545811884.20220523152733.jpg",
//       "author": "",
//       "discount": "34470",
//       "publisher": "Green Hill Publishing",
//       "pubdate": "20200515",
//       "isbn": "9781922337658",
//       "description": "When 18-year-old Harry is just beginning to find his feet after a difficult childhood in post-WWI Adelaide, he experiences heart-rending rejection and runs away to the Australian outback where, as an awkward station hand, he discovers a rare talent for shearing. Success as a gun shearer gives him confidence he’s only dreamed of but also brings with it, the biggest battle of his life. A challenge that needs someone bigger than himself to overcome."
//     },

class Book {
  String title;
  String link;
  String image;
  String author;
  String discount;
  String publisher;
  String pubdate;
  String isbn;
  String description;

  Book({
    required this.title,
    required this.link,
    required this.image,
    required this.author,
    required this.discount,
    required this.publisher,
    required this.pubdate,
    required this.isbn,
    required this.description,
  });
//1. fromJson 네임드 생성자 만들기
  Book.fromJson(Map<String, dynamic> map)
      : this(
          title: map['title'],
          link: map['link'],
          image: map['image'],
          author: map['author'],
          discount: map['discount'],
          publisher: map['publisher'],
          pubdate: map['pubdate'],
          isbn: map['isbn'],
          description: map['description'],
        );

//2. toJson 메서드 만들기
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'link': link,
      'image': image,
      'author': author,
      'discount': discount,
      'publisher': publisher,
      'pubdate': pubdate,
      'isbn': isbn,
      'description': description,
    };
  }
}
