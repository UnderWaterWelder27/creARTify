import 'package:creartify/network/pixabay_api.dart';
import 'package:creartify/presentation/boards_page/bloc/boards_bloc.dart';
import 'package:creartify/presentation/navigation_page/bloc/navigation_bloc.dart';
import 'package:creartify/presentation/navigation_page/navigation_view.dart';
import 'package:creartify/presentation/gallery_page/bloc/gallery_bloc.dart';
import 'package:creartify/theme/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CreArtifyApp());
}


class CreArtifyApp extends StatelessWidget {
  const CreArtifyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.light,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => NavigationBloc(),),
          BlocProvider(create: (context) => GalleryBloc(PixabayApi()),),
          BlocProvider(create: (context) => BoardsBloc(PixabayApi()),),
        ],
        child: NavigationView(),
      ),
    );
  }
}
