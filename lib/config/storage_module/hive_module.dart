import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:testly/features/exam/data/model/local_models/saved_exam_model.dart';
@module
abstract class HiveModule {

  @preResolve
  Future<Box<SavedExamModel>> savedExamBox() async {
    return Hive.openBox<SavedExamModel>(
      'saved_exams_box',
    );
  }
}