import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_builder_ui/common/router_path.dart';
import 'package:page_builder_ui/view/category.dart';
import 'package:page_builder_ui/view/detail_page.dart';
import 'package:page_builder_ui/view/parameter_test.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/entity/category.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  return GoRouter(
      routes: [
        GoRoute(
          path: RouterPath.HOME,
          name: RouterPath.HOME,
          builder: (context, state) => const CategoryPage(),
          routes: [
            // 詳細ページへのルーティング
            GoRoute(
              path: RouterPath.DETAIL,
              name: RouterPath.DETAIL,
              builder: (context, state) {
                final category = state.extra as CategoryModel;
                return DetailPage(category);
              },
            ),
            // パスパラメーターのテスト
            GoRoute(
              path: '${RouterPath.PATH_PARAM}/:id',
              name: RouterPath.PATH_PARAM,
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                return ParameterTest(id: id);
              },
            ),
          ]
        ),
      ],
      // 404ページを指定
      errorPageBuilder: (context, state) {
        return const MaterialPage(
            child: Scaffold(
          body: Center(
            child: Text('Page not found'),
          ),
        ));
      });
}
