import 'package:aifer_project/providers/picsum_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TaskProvider>(context, listen: false).getAllUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Picsum Images",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.white
          ),
        ),
        centerTitle: true,
      ),
backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: provider.pics.length,

        itemBuilder: (context, index) {
          final pics = provider.pics[index];

          return ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                pics.downloadUrl,
              ),
            ),

            title: Text(pics.author),

            subtitle: Text("ID : ${pics.id}"),

            trailing: IconButton(
              onPressed: () {
                provider.deleteUser(pics.id);
              },

              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}