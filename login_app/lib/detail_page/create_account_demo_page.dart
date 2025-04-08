import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_app/providers/user_provider.dart';

class UserListScreen extends ConsumerWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Fetch users using the Riverpod provider
    final userState = ref.watch(userProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body:
          userState.users == null
              ? userState.error != null
                  ? Center(child: Text('Error: ${userState.error}'))
                  : const Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: userState.users!.length,
                itemBuilder: (context, index) {
                  final user = userState.users![index];
                  return ListTile(
                    title: Text(user.userName),
                    subtitle: Text(user.phoneNo ?? ''),
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(userProvider.notifier).getUsers();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
