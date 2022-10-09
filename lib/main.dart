import 'package:flutter/material.dart';
import 'package:liquede/commons/theme.dart';
import 'package:liquede/presentation/onboarding/login.dart';
import 'package:liquede/presentation/onboarding/onboarding.dart';
import 'package:liquede/services/api/bills_service.dart';
import 'package:liquede/services/api/loan_service.dart';
import 'package:liquede/services/api/saving_service.dart';
import 'package:liquede/services/api/user_service.dart';
import 'package:liquede/services/api/wallet_service.dart';
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
        ChangeNotifierProvider<NetworkServiceState2>(create: (context) => networkState),
        ChangeNotifierProvider<UserService>(create: (context) => UserService()),
        ChangeNotifierProvider<WalletService>(create: (context) => WalletService()),
        ChangeNotifierProvider<BillsService>(create: (context) => BillsService()),
        ChangeNotifierProvider<LoanService>(create: (context) => LoanService()),
        ChangeNotifierProvider<SavingsService>(create: (context) => SavingsService()),
        ChangeNotifierProvider<AppPreference>(create: (context) => _preference),
      ],
      child: const MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint('app toured is ${_preference.seenAppTour}');
    return MaterialApp(
      title: 'Liquede',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: _preference.seenAppTour? const LoginScreen() :const OnboardingScreen(),
    );
  }
}

late AppPreference _preference;
late NetworkServiceState2 networkState;
startServices() async {
  // _setUpLogging();
  _preference = await AppPreference.getInstance();
  networkState = NetworkServiceState2();
}


// void _setUpLogging(){
//   Logger.root.level = Level.ALL;
//   Logger.root.onRecord.listen((event) {
//     '${event.level.name}: ${event.time} ${event.message}'.log;
//   });
// }
