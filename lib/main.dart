import 'package:flutter/material.dart';
import 'package:liquede/commons/theme.dart';
import 'package:liquede/presentation/onboarding/onboarding.dart';
import 'package:liquede/services/app_preference.dart';
import 'package:liquede/services/network_service_state.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:swagger/api.dart';
import 'package:liquede/extensions/string.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await startServices();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<BaseWidgetState>(create: (context) => BaseWidgetState()),
        ChangeNotifierProvider<NetworkServiceState2>(create: (context) => NetworkServiceState2()),
        // ChangeNotifierProvider<AppService>(create: (context) => AppService(context)),
        ChangeNotifierProvider<AppPreference>(create: (context) => _preference),
      ],
      child: const MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liquede',
      theme: theme(),
      home: const OnboardingScreen(),
    );
  }
}

late AppPreference _preference;
startServices() async {
  // _setUpLogging();
  _preference = await AppPreference.getInstance();
}


// void _setUpLogging(){
//   Logger.root.level = Level.ALL;
//   Logger.root.onRecord.listen((event) {
//     '${event.level.name}: ${event.time} ${event.message}'.log;
//   });
// }
