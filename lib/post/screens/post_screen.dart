import 'package:flutter/material.dart';
import 'package:inter/post/provider/post_provider.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PostProvider>(context, listen: false).handleFetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts", style: TextStyle(fontWeight: FontWeight.bold)),
      ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          height: double.infinity,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 78, 85, 219),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListView.builder(
            itemCount: context.watch<PostProvider>().list.length,
            itemBuilder: (context, index) {
              return Consumer<PostProvider>(
                builder: (context, value, child) {
                  return Column(
                    mainAxisSize: .min,
                    mainAxisAlignment: .start,
                    crossAxisAlignment: .start,
                    children: [
                      Text(
                        value.list[index].title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        value.list[index].id.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        value.list[index].body,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
