import 'package:flutter/material.dart';
import './bloc/bloc_auth/auth_bloc.dart';
import './data/repositories/auth_repository.dart';
import './data/repositories/stream_repository.dart';
import './screens/DashBoard/dashboard.dart';
import './screens/Splash/splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: StreamBuilder(
              stream: getToken(),
              builder: (context, snapshot) {
                // Se o snapshot tiver dados do utilizador, então este já tem sessão iniciada. Então, navegando para o Painel de Controle.
                if (snapshot.hasData) {
                  return const Dashboard();
                }
                // Caso contrário, não estão registados. Mostrar a página de início de sessão.
                return const Splash();
              }),
        ),
      ),
    );
  }
}
