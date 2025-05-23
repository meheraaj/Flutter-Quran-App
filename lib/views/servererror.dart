import 'package:flutter/material.dart';

import '../controller/urlLuncher.dart';



class AppsinfoDialog extends StatelessWidget {
  const AppsinfoDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            'আল কুরআন\n ওয়েব  এপ্স এ আপনাকে স্বাগতম!',
            style: TextStyle(
                fontSize: size.width / 30,
                fontFamily: 'Noto Serif',
                color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: size.width / 28),
          alignment: Alignment.center,
          child: Text(
            'এই আপটি সম্পূর্ণ ফ্রি এবং এই এপ্স এ কোনো প্রকার এড নেই। এই এপ বর্তমানে শুধু এন্ড্রোইড এবং ওয়েব এর জন্য BETA স্টেজ এ  আছে।ভবিষ্যতে এপস্টোর এবং প্লেস্টোরে  রিলিজ করবো , ইনশাল্লাহ।\nওয়েব এ বর্তমানে কোরআন পড়ার সুবিধা নেই। কুরআন পড়ার জন্যে এন্ড্রোইড ভার্সন ডাউনলোড করুন। ',
            style: TextStyle(
                fontSize: size.width / 30,
                fontFamily: 'Noto Serif',
                color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
            margin: EdgeInsets.symmetric(vertical: size.width / 28),
            alignment: Alignment.center,
            child: MaterialButton(
              child: Text(
                'ডাউনলোড করুন Android ভার্সন',
                style:
                    TextStyle(fontFamily: 'HindSiliguri', color: Colors.white),
              ),
              onPressed: () {
                lucnUrl(
                    'https://drive.google.com/drive/u/0/folders/1RMF8BvUG9n_u9kKBCx8l3H-Ias2p2aJz');
              },
              textColor: Colors.white,
              elevation: 10,
              minWidth: size.width / 4,
              height: size.height / 15,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Color.fromARGB(255, 235, 16, 64),
            )),
      ],
    );
  }
}
