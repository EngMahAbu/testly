import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:testly/config/di/di.config.dart';
import 'package:testly/core/ui/theme/app_theme.dart';
import 'package:testly/features/exam/data/adapters/saved_answer_adapter.dart';
import 'package:testly/features/exam/data/adapters/saved_exam_adapter.dart';
import 'package:testly/features/exam/data/adapters/saved_question_adapter.dart';
import 'package:testly/features/exam/data/model/local_models/saved_exam_model.dart';
import 'package:testly/features/splash/presentation/views/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(SavedAnswerAdapter());
  Hive.registerAdapter(SavedQuestionAdapter());
  Hive.registerAdapter(SavedExamAdapter());
  await Hive.openBox<SavedExamModel>('saved_exams_box');
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: SplashView(),
    );
  }
}
