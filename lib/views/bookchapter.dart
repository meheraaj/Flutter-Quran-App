import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/loading.dart';
import '../controller/fetchBookChapter.dart';
import '../listViews/hblist.dart';


class BookChapter extends StatefulWidget {
  String bookkey;
  String bookName;
  BookChapter({Key? key, required this.bookkey, required this.bookName})
      : super(key: key);

  @override
  State<BookChapter> createState() => _BookChapterState();
}

class _BookChapterState extends State<BookChapter> {
  @override
  void initState() {
    super.initState();
    Provider.of<FetchBookChapter>(context, listen: false)
        .fetchMedia(widget.bookkey);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.bookName),
      ),
      body: Consumer<FetchBookChapter>(
          builder: (context, value, child) => value.hasData
              ? Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width / 50),
                  child: hadithBList(context, value.booklistModel, 2))
              : loadingg(1)),
    );
  }
}
