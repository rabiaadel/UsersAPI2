import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/Details.dart';

void main() {
  runApp(
    MaterialApp(
      home: JeweleryPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey,
        fontFamily: 'Roboto',
      ),
    ),
  );
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
        title: Text(
          "Rabia's Jewelry Store",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black12,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: jeweleryItems,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.deepPurple),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Error loading data"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No jewelry found"));
          }

          final items = snapshot.data!;
          return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Container(
                margin: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(item["image"]),
                    backgroundColor: Colors.grey.shade100,
                  ),
                  title: Text(
                    item["title"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    item["description"],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13, color: Colors.black54),
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
