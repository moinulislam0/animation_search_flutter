import 'package:animation_widgets/controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 // Update this path

class SearchPage extends StatelessWidget {
  final ProductSearchController controller = Get.put(ProductSearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search (Name, Email, Product)')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: controller.filterSearch,
              decoration: InputDecoration(
                labelText: 'Search...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                return controller.filteredProducts.isEmpty
                    ? Center(child: Text('No results found'))
                    : ListView.builder(
                        itemCount: controller.filteredProducts.length,
                        itemBuilder: (context, index) {
                          final item = controller.filteredProducts[index];
                          return Card(
                            child: ListTile(
                              title: Text(item.name),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Email: ${item.email}'),
                                  Text('Product: ${item.product}'),
                                ],
                              ),
                            ),
                          );
                        },
                      );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
