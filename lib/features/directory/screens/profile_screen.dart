import 'package:flutter/material.dart';
import '../models/user.dart';
import '../widgets/info_row.dart';
import 'edit_screen.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  final void Function(User updatedUser) onUserUpdated;

  const ProfileScreen({
    super.key,
    required this.user,
    required this.onUserUpdated,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late User _currentUser;

  @override
  void initState() {
    super.initState();
    _currentUser = widget.user;
  }

  Future<void> _editProfile() async {
    final updatedUser = await Navigator.of(context).push<User>(
      MaterialPageRoute(builder: (_) => EditScreen(user: _currentUser)),
    );

    if (!mounted) return;

    if (updatedUser != null) {
      setState(() {
        _currentUser = updatedUser;
      });
      widget.onUserUpdated(updatedUser);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('✅ Profile updated!'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(_currentUser.name),
        backgroundColor: colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                children: [
                  Hero(
                    tag: 'avatar-${_currentUser.id}',
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: colorScheme.primary,
                      child: Text(
                        _currentUser.name[0],
                        style: const TextStyle(
                          fontSize: 48,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _currentUser.name,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _currentUser.job,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 24),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InfoRow(label: 'Name:', value: _currentUser.name),
                          const Divider(),
                          InfoRow(label: 'Job:', value: _currentUser.job),
                          const Divider(),
                          InfoRow(label: 'Email:', value: _currentUser.email),
                          const Divider(),
                          InfoRow(label: 'Phone:', value: _currentUser.phone),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _editProfile,
                      icon: const Icon(Icons.edit),
                      label: const Text('Edit Profile'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
