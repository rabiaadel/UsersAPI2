import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final Map<String, dynamic> item;

  const DetailsPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  item["image"],
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 20),
              Text(
                item["title"],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "\$${item["price"]}",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green[700],
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              Text(item["description"], style: TextStyle(fontSize: 16)),
              SizedBox(height: 20),
              if (item["rating"] != null)
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber),
                    SizedBox(width: 4),
                    Text(
                      "${item["rating"]["rate"]} (${item["rating"]["count"]} reviews)",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
