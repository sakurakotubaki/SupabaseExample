import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_builder_ui/domain/entity/category.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage(this.category, {super.key});

  final CategoryModel category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.id.toString()),
      ),
      body: Center(
        child: Text(category.name),
      ),
    );
  }
}
