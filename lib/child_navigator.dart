import 'package:flutter/material.dart';

class ChildNavigator extends StatelessWidget {
  const ChildNavigator({
    Key? key,
    required this.home,
  }) : super(key: key);

  final Widget home;

  Route<dynamic>? _onGenerateRoute(RouteSettings settings) {
    if (settings.name == Navigator.defaultRouteName) {
      return MaterialPageRoute(builder: (_) => home);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      restorationScopeId: 'childNav',
      initialRoute: Navigator.defaultRouteName,
      onGenerateRoute: _onGenerateRoute,
    );
  }
}
