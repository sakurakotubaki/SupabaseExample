// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$categoryStreamHash() => r'b411646cf66ce755932d5e728bead5aa5be9cb5b';

/// [全てのデータを取得する]
/// [モデルクラスを使用してデータを取得する]
/// [ジェネレーターを使用してデータを取得する]
///
/// Copied from [categoryStream].
@ProviderFor(categoryStream)
final categoryStreamProvider =
    AutoDisposeStreamProvider<List<Map<String, dynamic>>>.internal(
  categoryStream,
  name: r'categoryStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$categoryStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CategoryStreamRef
    = AutoDisposeStreamProviderRef<List<Map<String, dynamic>>>;
String _$categoryListStreamHash() =>
    r'af9e40c18df8ab5ce47b58f168b9ba38c174f50e';

/// [モデルクラスを使用して、ジェネレーターでデータを取得する]
///
/// Copied from [categoryListStream].
@ProviderFor(categoryListStream)
final categoryListStreamProvider =
    AutoDisposeStreamProvider<List<CategoryModel>>.internal(
  categoryListStream,
  name: r'categoryListStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$categoryListStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CategoryListStreamRef
    = AutoDisposeStreamProviderRef<List<CategoryModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
