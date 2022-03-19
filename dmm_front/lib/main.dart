import 'package:flutter/material.dart';
import 'package:dmm_front/constants/color_constant.dart';
import 'package:dmm_front/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: kMainColor)),
      home: const HomeScreen(),
      routes: {"/homeScreen": (_) => const HomeScreen()},
    );
  }
}

/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ImagePicker _picker = ImagePicker();

  // SliverGridDelegate getGridDelegate() {
  //   return const SliverGridDelegateWithFixedCrossAxisCount(
  //     crossAxisCount: 2,
  //     childAspectRatio: 1 / 1,
  //     mainAxisSpacing: 10,
  //     crossAxisSpacing: 10,
  //   );
  // }

  Future getImageFromGallery(MainController controller) async {
    var image =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);

    if (image == null || image.path == null) return null;

    controller.Upload(image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<MainController>(
          builder: (controller) {
            print("Build!!");
            return CardLayoutGrid(crossAxisCount: 2, items: controller.list);
          },
        ),
      ),
      //   Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Image.network(
      //         "http://localhost:8080/api/v1/object?pid=01e529a8-d3fd-4f67-95ef-e326f475c159.jpg",
      //         headers: const {"uid": "tmpuid"},
      //       )
      //     ],
      //   ),
      // ),
      floatingActionButton: GetBuilder(
        builder: (MainController controller) {
          return FloatingActionButton(
            onPressed: () => {getImageFromGallery(controller)},
            tooltip: 'upload',
            child: const Icon(Icons.add),
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/