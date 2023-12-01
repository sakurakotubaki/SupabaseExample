import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ParameterTest extends ConsumerWidget {
  const ParameterTest({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('パスパラメーターのテスト'),
      ),
      body: Center(
        child: Text('idは: $id'),
      ),
    );
  }
}
