

import 'package:al_quran/models/pdfModel.dart';
import 'package:al_quran/models/suraModel.dart';

import 'arabicModel.dart';
import 'audioModel.dart';
import 'banglaModel.dart';

class MainModel {
  ArabicModel arabicModel;
  AudioModel audioModel;
  BanglaModel banglaModel;
  PDFModel pdfModel;
  SuraModel suraModel;
  MainModel({
    required this.arabicModel,
    required this.audioModel,
    required this.banglaModel,
    required this.pdfModel,
    required this.suraModel,
  });
}
