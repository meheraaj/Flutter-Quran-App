import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/hadithInfo.dart';
import '../components/loading.dart';
import '../controller/fetchHadith.dart';
import '../listViews/readhadithlist.dart';


class ViewHadith extends StatefulWidget {
  final String id;
  final String bname;
  final String ename;
  final String bookkey;
  const ViewHadith(
      {Key? key,
      required this.id,
      required this.bname,
      required this.ename,
      required this.bookkey})
      : super(key: key);

  @override
  State<ViewHadith> createState() => _ViewHadithState();
}

class _ViewHadithState extends State<ViewHadith> {
  @override
  void initState() {
    super.initState();

    Provider.of<FetchHadith>(context, listen: false)
        .fetchMedia(widget.bookkey, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.bname),
        ),
        body: SafeArea(
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: size.width / 30),
              child: Consumer<FetchHadith>(
                builder: (context, value, child) => value.hasData
                    ? Scrollbar(
                        thickness: value.hadithData.length > 4 ? 5 : 0,
                        thumbVisibility: true,
                        radius: Radius.circular(20),
                        interactive: true,
                        child: ListView(
                          children: [
                            SizedBox(
                              height: size.height / 50,
                            ),
                            Container(
                                child: hadithInfo(
                                    size, widget.bname, widget.ename)),
                            SizedBox(
                              height: size.height / 50,
                            ),
                            Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(
                                    child: readHadithList(
                                        context, size, value.hadithData)),
                              ],
                            )
                          ],
                        ),
                      )
                    : loadingg(2),
              )),
        ));
  }
}
