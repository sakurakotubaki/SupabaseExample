import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_builder_ui/view/apikey.dart';
import 'package:page_builder_ui/view/myapp.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // URLとanon keyの設定をする
  await Supabase.initialize(
    url: URL,
    anonKey: ANON_KEY,

  );

  runApp(const ProviderScope(child: MyApp()));
}
