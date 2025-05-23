import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget suralistEmptyPlaceholder(BuildContext context, Size size) {
  return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: 15,
      itemBuilder: (context, index) {
        Color bg = Color(0x7E869FD6);
        return Shimmer.fromColors(
          baseColor: bg,
          highlightColor: Colors.black,
          child: Container(
            height: size.height / 20,
            margin: EdgeInsets.only(
              top: size.height / 50,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: size.width / 10,
                  height: size.height / 20,
                  decoration: BoxDecoration(
                      color: bg, borderRadius: BorderRadius.circular(100)),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: size.width / 5,
                        height: size.height / 60,
                        color: bg,
                      ),
                      Container(
                        width: size.width / 4,
                        height: size.height / 60,
                        color: bg,
                      )
                    ],
                  ),
                ),
                SizedBox(),
                SizedBox(),
                Container(
                  width: size.width / 5,
                  height: size.height / 50,
                  color: bg,
                )
              ],
            ),
          ),
        );
      });
}
