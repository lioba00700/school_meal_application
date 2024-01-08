import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Expanded(
              child: TextField(),
              ),
              IconButton(
                onPressed: (){},
                icon: const Icon(Icons.search),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemBuilder: (context, index) => ListTile(
              title: Text('$index'),
            ),
            itemCount: 10,
          ),
        ),
      );
    }
}