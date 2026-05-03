import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'features/directory/screens/home_screen.dart';
import 'features/directory/screens/profile_screen.dart';
import 'features/directory/models/user.dart';

void main() {
  runApp(const UserDirectoryApp());
}

class UserDirectoryApp extends StatelessWidget {
  const UserDirectoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Directory',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: '/',
      routes: {'/': (context) => const HomeScreen()},
      onGenerateRoute: (settings) {
        if (settings.name == '/profile') {
          final args = settings.arguments as Map<String, dynamic>;
          final user = args['user'] as User;
          final onUserUpdated = args['onUserUpdated'] as void Function(User);

          return PageRouteBuilder(
            settings: settings,
            pageBuilder: (_, _, _) =>
                ProfileScreen(user: user, onUserUpdated: onUserUpdated),
            transitionsBuilder: (_, animation, _, child) {
              final tween = Tween(
                begin: const Offset(0.0, 1.0),
                end: Offset.zero,
              ).chain(CurveTween(curve: Curves.easeOut));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 400),
          );
        }
        return null;
      },
    );
  }
}
