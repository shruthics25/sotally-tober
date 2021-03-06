
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sotally_tober/model/app_state.dart';
import 'package:sotally_tober/pages/login.dart';
import 'package:sotally_tober/pages/register.dart';
import 'package:sotally_tober/pages/landing.dart';
import 'package:sotally_tober/pages/dashboard.dart';
import 'package:sotally_tober/pages/alertpage.dart';
import 'package:sotally_tober/pages/complex.dart';
import 'package:sotally_tober/pages/difficult.dart';
import 'package:sotally_tober/pages/soberpage.dart';


class App extends StatelessWidget {
  final Store<AppState> store;

  const App({Key key, this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
      title: 'Sotally Tober',
      initialRoute: '/landing',
      theme: ThemeData.dark(),
      onGenerateRoute: _getRoute
    )
    );
  }
}

Route<dynamic> _getRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/landing':
      return MaterialPageRoute(builder: (_) => LandingPage());
    case '/login':
      return MaterialPageRoute(builder: (_) => LoginPage());
    case '/register':
      return MaterialPageRoute(builder: (_) => RegisterPage());
    case '/dashboard':
      return MaterialPageRoute(builder: (_) => DashboardPage());
    case '/complex':
      return MaterialPageRoute(builder: (_) => ComplexPage());
    case '/difficult':
      return MaterialPageRoute(builder: (_) => DifficultPage());
    case '/alert':
      return MaterialPageRoute(builder: (_) => AlertPagePage());
    case '/sober':
      return MaterialPageRoute(builder: (_) => SoberPagePage());
    default:
      return null;
  }
}
