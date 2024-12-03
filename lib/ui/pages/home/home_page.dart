import 'package:flutter/material.dart';
import 'package:flutter_book_search_app/ui/pages/home/home_view_model.dart';
import 'package:flutter_book_search_app/ui/pages/home/widgets/home_bottom_sheet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  TextEditingController textEditingController = TextEditingController();

  void dispose() {
    //TextEditingController 사용시에는 반드시 dispose 호출해줘야 메모리에서 소거됨!
    textEditingController.dispose();
    super.dispose();
  }

  void onSearch(String text) {
    // TODO 홈뷰모델의 searchBooks 메서드 호출!
    ref.read(homeViewModelProvider.notifier).searchBooks(text);
    print('onSearch 호출됨');
  }

  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeViewModelProvider);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            GestureDetector(
              //버튼의 터치영역은 44디바이스 픽셀 이상으로 해줘야 함!!(UX)
              child: Container(
                  width: 50,
                  height: 50,
                  //컨테이너에 배경색이 없으면 자녀 위젯에만 터치 이벤트가 적용됨
                  color: Colors.transparent,
                  child: Icon(Icons.search)),
              onTap: () {
                // textEditingController의 text 속성으로 TextField의 값을 가져옴
                onSearch(textEditingController.text);
              },
            )
          ],
          title: TextField(
            maxLines: 1,
            onSubmitted: onSearch,
            controller: textEditingController,
            decoration: InputDecoration(
                hintText: '검색어를 입력해 주세요',
                border: MaterialStateOutlineInputBorder.resolveWith(
                  (states) {
                    print(states);
                    if (states.contains(WidgetState.focused)) {
                      return OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      );
                    }
                    return OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey),
                    );
                  },
                )),
          ),
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(20),
          itemCount: homeState.books.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (context, index) {
            final book = homeState.books[index];
            return GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return HomeBottomSheet(book);
                    },
                  );
                },
                child: Image.network(book.image));
          },
        ),
      ),
    );
  }
}
