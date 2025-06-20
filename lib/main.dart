import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'Details.dart';

void main() {
  runApp(MaterialApp(home: JeweleryPage(), debugShowCheckedModeBanner: false));
}

class JeweleryPage extends StatefulWidget {
  @override
  State<JeweleryPage> createState() => _JewelryPageState();
}

class _JewelryPageState extends State<JeweleryPage> {
  late Future<List<dynamic>> jeweleryItems;

  Future<List<dynamic>> fetchJeweleryData() async {
    final response = await Dio().get(
      "https://fakestoreapi.com/products/category/jewelery",
    );
    return response.data;
  }

  @override
  void initState() {
    super.initState();
    jeweleryItems = fetchJeweleryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jewelry Store"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: jeweleryItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error loading data"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No jewelry found"));
          }

          final items = snapshot.data!;
          return ListView.builder(
            padding: EdgeInsets.all(12),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: EdgeInsets.only(bottom: 16),
                child: ListTile(
                  contentPadding: EdgeInsets.all(12),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(item["image"]),
                    backgroundColor: Colors.grey[100],
                  ),
                  title: Text(
                    item["title"],
                    style: TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    item["description"],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Text(
                    "\$${item["price"]}",
                    style: TextStyle(
                      color: Colors.green[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(item: item),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
