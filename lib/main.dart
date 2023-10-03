import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:poke_api/PokeApi/conf/go_router.riverpod.dart';
import 'package:poke_api/PokeApi/conf/theme.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
     final appRouter= ref.watch(appRouterProvider);
    return  MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routerConfig:appRouter ,
      theme: ThemeApp().theme(),
    );
  }
}
