import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/app_router.dart';
import 'package:frontend/app_theme.dart';
import 'package:frontend/domain/repositories/dummy_repository.dart';
import 'package:frontend/presentation/InfoScreen/info_screen.dart';
import 'package:frontend/presentation/welcome_screen.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize Hive
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const Application()));
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider(create: (context) => DummyRepository())],
      child: GetMaterialApp(
        title: 'MedCord',
        theme: AppTheme.theme,
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: InfoScreen.id,
      ),
    );
  }
}
