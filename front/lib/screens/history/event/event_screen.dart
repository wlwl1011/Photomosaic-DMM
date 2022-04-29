import 'package:flutter/material.dart';

class eventScreen extends StatelessWidget {
  const eventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('EVENT',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 17,
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'PHOTOMOSAIC WITH TOO COLL FOR SCHOOL',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '22SUMMER COLLECTION',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                ],
              ),
              color: Colors.black12,
              alignment: Alignment.centerLeft,
            ),
            Container(
              // constraints: BoxConstraints(maxHeight: 180, maxWidth: 180),
              child: Image.asset(
                'assets/images/too_cool.jpeg',
                fit: BoxFit.contain,
              ),
            ),
            Container(
              // constraints: BoxConstraints(maxHeight: 180, maxWidth: 180),
              child: Image.asset(
                'assets/images/too_cool_logo.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              // constraints: BoxConstraints(maxHeight: 180, maxWidth: 180),
              child: Image.asset(
                'assets/images/banner_image_3.png',
                fit: BoxFit.contain,
              ),
            ),
            Container(
              // constraints: BoxConstraints(maxHeight: 180, maxWidth: 180),
              child: Image.asset(
                'assets/images/too_for_school.jpg',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
