import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:page_builder_ui/common/router_path.dart';
import 'package:page_builder_ui/provider/category_provider.dart';

class CategoryPage extends ConsumerWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryListStreamProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('categories'),
      ),
      body: categories.when(
          data: (data) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    // context.goNamed(RouterPath.DETAIL, extra: data[index]);
                    context.goNamed(RouterPath.PATH_PARAM,
                        pathParameters: {'id': data[index].id.toString()});
                  },
                  title: Text(data[index].name),
                );
              },
            );
          },
          error: (e, s) => Center(child: Text(e.toString())),
          loading: () => const Center(child: CircularProgressIndicator())),
    );
  }
}
