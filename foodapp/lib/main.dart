import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// var bannerItems = ["Burger", "Pizza", "Noodles", "Smoothie"];
// var bannerImage = [
//   "assets/burger.jfif"
//       "assets/pizza.jfif"
//       "assets/noodles.jfif"
//       "assets/smoothie.jpg"
// ];
var bannerItemsAndImages = [
  {'image': "assets/burger.jfif", 'item': "Burger"},
  {'image': "assets/pizza.jfif", 'item': "Pizza"},
  {'image': "assets/noodles.jfif", 'item': "Noodles"},
  {'image': "assets/smothie.jpg", 'item': "Smoothie"},
];

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fooderlich',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(padding: EdgeInsets.fromLTRB(10, 5, 10, 5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  "Recipes of the Day",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                  textAlign: TextAlign.center,
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                )
              ],
            ),
            const BannerWidgetArea()
          ],
        ),
      ),
    );
  }
}

class BannerWidgetArea extends StatelessWidget {
  const BannerWidgetArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var screenWidth = MediaQuery.of(context).size.width;
    // PageController controller =
    //     PageController(viewportFraction: 0.8, initialPage: 1);

    // // ignore: deprecated_member_use
    // List<Widget> banners = <Widget>[];
    // for (int i = 0; i < bannerItems.length; i++) {
    // var bannerView = Padding(
    //   padding: const EdgeInsets.all(10.0),
    //   child: Stack(
    //     fit: StackFit.expand,
    //     children: <Widget>[
    //       Container(
    //         decoration: const BoxDecoration(
    //             borderRadius: BorderRadius.all(Radius.circular(20.0)),
    //             boxShadow: [
    //               BoxShadow(
    //                   color: Colors.black38,
    //                   offset: Offset(2.0, 2.0),
    //                   blurRadius: 5.0,
    //                   spreadRadius: 1.0)
    //             ]),
    //       ),
    //       ClipRRect(
    //         borderRadius: const BorderRadius.all(Radius.circular(20.0)),
    //         child: Image.asset(
    //           bannerImage[i],
    //           fit: BoxFit.cover,
    //         ),
    //       ),
    //       Container(
    //         decoration: const BoxDecoration(
    //             borderRadius: BorderRadius.all(Radius.circular(20.0)),
    //             gradient: LinearGradient(
    //                 begin: Alignment.topCenter,
    //                 end: Alignment.bottomCenter,
    //                 colors: [Colors.transparent, Colors.black])),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(10.0),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.end,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: <Widget>[
    //             Text(
    //               bannerItems[i],
    //               style: const TextStyle(fontSize: 25.0, color: Colors.white),
    //             ),
    //             const Text(
    //               "More than 40% Off",
    //               style: TextStyle(fontSize: 12.0, color: Colors.white),
    //             )
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // );
    //   banners.add(bannerView);
    // }

    // return SizedBox(
    // width: screenWidth,
    // height: screenWidth * 9 / 16,
    //   child: PageView(
    //     controller: controller,
    //     scrollDirection: Axis.horizontal,
    //     children: banners,
    //   ),
    // );
    return SizedBox(
      height: 300,
      // color: Colors.amber,
      child: ListView.builder(
        itemCount: bannerItemsAndImages.length,
// shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: 300,
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                // fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black38,
                              offset: Offset(2.0, 2.0),
                              blurRadius: 5.0,
                              spreadRadius: 1.0)
                        ]),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                    child: Image.asset(
                      bannerItemsAndImages[index]['image'].toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black])),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          bannerItemsAndImages[index]['items'].toString(),
                          style: const TextStyle(
                              fontSize: 25.0, color: Colors.white),
                        ),
                        const Text(
                          "More than 40% Off",
                          style: TextStyle(fontSize: 12.0, color: Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
