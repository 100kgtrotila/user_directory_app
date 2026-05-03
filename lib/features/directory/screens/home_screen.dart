import 'package:flutter/material.dart';
import '../models/user.dart';
import '../widgets/user_list_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<User> _users;

  @override
  void initState() {
    super.initState();
    _users = List.from(sampleUsers);
  }

  void _onUserUpdated(User updatedUser) {
    setState(() {
      final index = _users.indexWhere((u) => u.id == updatedUser.id);
      if (index != -1) {
        _users[index] = updatedUser;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Directory'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final user = _users[index];

          return UserListTile(
            user: user,
            onTap: () => Navigator.of(context).pushNamed(
              '/profile',
              arguments: {'user': user, 'onUserUpdated': _onUserUpdated},
            ),
          );
        },
      ),
    );
  }
}
