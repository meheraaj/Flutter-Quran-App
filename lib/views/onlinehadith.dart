import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/loading.dart';
import '../controller/checkConnection.dart';
import '../controller/fetchBookList.dart';
import '../listViews/hblist.dart';
import 'noint.dart';

class OnlineHadith extends StatelessWidget {
  const OnlineHadith({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Provider.of<CheckConnection>(context, listen: true).hasConnection
        ? Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('হাদিস',
                  style: TextStyle(
                      fontFamily: "HindSiliguri",
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[400])),
            ),
            body: Consumer<FetchBookList>(
                builder: (context, value, child) => value.hasData
                    ? Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: size.width / 50),
                        child: hadithBList(context, value.booklistModel, 1))
                    : loadingg(1)),
          )
        : NoInternet();
  }
}
