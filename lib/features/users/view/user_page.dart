import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:practicetask/features/users/provider/user_provider.dart';
import 'package:practicetask/features/auth/provider/auth_provider.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserProvider>(context, listen: false).fetchUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        bottom: auth.loggedTime != null
            ? PreferredSize(
                preferredSize: const Size.fromHeight(24.0),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text('Logged at: ${auth.loggedTime}', style: const TextStyle(color: Colors.black)),
                ),
              )
            : null,
      ),
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.all(16.0),
        child: Consumer<UserProvider>(
          builder: (context, usersProv, _) {
            if (usersProv.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (usersProv.users.isEmpty) {
              return const Center(child: Text('No users found'));
            }
            return RefreshIndicator(
              onRefresh: usersProv.fetchUsers,
              child: ListView.builder(
                itemCount: usersProv.users.length,
                itemBuilder: (ctx, index) {
                  final data = usersProv.users[index] as Map<String, dynamic>;
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12.0),
                    child: ListTile(
                      leading: CircleAvatar(child: Text(data['name'][0] ?? '?')),
                      title: Text(data['name'].toString()),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(data['email'].toString()), Text(data['phone'].toString())],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
