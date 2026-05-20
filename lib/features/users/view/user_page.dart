import 'package:flutter/material.dart';
import 'package:practicetask/features/users/service/user_service.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: UserService().getRequest(),
          builder: (BuildContext ctx, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(child: CircularProgressIndicator()),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (ctx, index) {
                  final data = snapshot.data[index];
                  return ListTile(
                    title: Text(data['name'].toString()),
                    subtitle: Column(
                      children: [Text(data['email']), Text(data['phone'])],
                    ),
                    contentPadding: EdgeInsets.only(bottom: 20.0),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
