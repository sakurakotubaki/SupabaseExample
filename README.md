# Supabase Riverpod

## generatorなしの例
```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_builder_ui/domain/entity/category.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'category_provider.g.dart';

/// [全てのデータを取得する]
final categoryStreamProvider =
    StreamProvider.autoDispose<List<Map<String, dynamic>>>((ref) {
  final supabase = Supabase.instance.client;
  return supabase.from('categories').stream(primaryKey: ['id']);
});

/// [モデルクラスを使用してデータを取得する]
final categoryListStreamProvider =
    StreamProvider.autoDispose<List<Category>>((ref) {
  final supabase = Supabase.instance.client;
  return supabase.from('categories').stream(primaryKey: ['id']).map((event) => event.map((e) => Category.fromJson(e)).toList());
});
```

### 👻Viewに全てのデータを表示する
StreamProviderを使用して、全てのデータを取得する方法

```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_builder_ui/provider/category_provider.dart';

class CategoryPage extends ConsumerWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryStreamProvider);
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
                  title: Text(data[index]['name']),
                );
              },
            );
          },
          error: (e, s) => Center(child: Text(e.toString())),
          loading: () => const Center(child: CircularProgressIndicator())),
    );
  }
}
```

### 💾モデルクラスを使用して、取得する方法
Freezedを使用して、モデルクラスを定義する。

```dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    @Default(0) int id,
    @Default('') String name,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
```

ファイルを自動生成するコマンドを実行する
```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

View側のコードを修正する
```dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
```

## generatorありの例
先ほど書いたプロバイダーを使用したコードを関数に書き換えるだけです。

```dart
import 'package:page_builder_ui/domain/entity/category.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'category_provider.g.dart';

/// [ジェネレーターを使用してデータを取得する]
@riverpod
Stream<List<Map<String, dynamic>>> categoryStream(CategoryStreamRef ref) {
  final supabase = Supabase.instance.client;
  return supabase.from('categories').stream(primaryKey: ['id']);
}

/// [モデルクラスを使用して、ジェネレーターでデータを取得する]
@riverpod
Stream<List<Category>> categoryListStream(CategoryListStreamRef ref) {
  final supabase = Supabase.instance.client;
      return supabase.from('categories').stream(primaryKey: ['id']).map(
          (event) => event.map((e) => Category.fromJson(e)).toList());
}
```

```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```
