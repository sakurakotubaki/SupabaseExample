import 'package:page_builder_ui/domain/entity/category.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'category_provider.g.dart';

/// TODO: Providerが使えない?
final supabaseInstance = Supabase.instance.client;

/// [全てのデータを取得する]
// final categoryStreamProvider =
//     StreamProvider.autoDispose<List<Map<String, dynamic>>>((ref) {
//   final supabase = Supabase.instance.client;
//   return supabase.from('categories').stream(primaryKey: ['id']);
// });

/// [モデルクラスを使用してデータを取得する]
// final categoryListStreamProvider =
//     StreamProvider.autoDispose<List<Category>>((ref) {
//   final supabase = Supabase.instance.client;
//   return supabase.from('categories').stream(primaryKey: ['id']).map((event) => event.map((e) => Category.fromJson(e)).toList());
// });

// 自動生成するコマンド
// flutter pub run build_runner watch --delete-conflicting-outputs

/// [ジェネレーターを使用してデータを取得する]
@riverpod
Stream<List<Map<String, dynamic>>> categoryStream(CategoryStreamRef ref) {
  return supabaseInstance.from('categories').stream(primaryKey: ['id']);
}

/// [モデルクラスを使用して、ジェネレーターでデータを取得する]
@riverpod
Stream<List<CategoryModel>> categoryListStream(CategoryListStreamRef ref) {
      return supabaseInstance.from('categories').stream(primaryKey: ['id']).map(
          (event) => event.map((e) => CategoryModel.fromJson(e)).toList());
}
