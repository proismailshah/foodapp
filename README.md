# foodapp
first repo


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
     home: MyHomePage(),
     debugShowCheckedModeBanner: false,
    );
    
  }

}
var bannerItems = ["Burger","Pizza","Noodles","Smoothie"];
var bannerImage = [
  "assets/burger.jpg"
  "assets/pizza.jpg"
  "assets/noodles.jpg"
  "assets/smoothie.jpg"
];
class MyHomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
    'Fooderlich',
    style: TextStyle(color: Colors.black),
  ),
        backgroundColor: Colors.white,
        
      ),
      
    body: Container(
      height: screenHeight,
      width: screenWidth,
      child:  SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5) ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget> [
                      Text(
              "Recipes of the Day",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
               textAlign: TextAlign.center,
            ),
                     IconButton(icon: Icon(Icons.search), onPressed: (){})
                   ],
                 ),
                 BannerWidgetArea()
          ],
      ),
    
        

    ),
    ),
    
    );
  }
}
 
class BannerWidgetArea extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
   PageController controller =   PageController(viewportFraction: 0.8, initialPage: 1);

    // ignore: deprecated_member_use
    List<Widget> banners = <Widget>[];
    for (int i = 0; i < bannerItems.length; i++) {
 var bannerView = Padding(
        padding: EdgeInsets.all(10.0),
            child: Container(
         child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
              Container(
                decoration: BoxDecoration(
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
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                child: Image.asset(
                  bannerImage[i],
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black])),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      bannerItems[i],
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                    Text(
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
      banners.add(bannerView);
    }

  return Container(
    width: screenWidth,
    height: screenWidth*9/16,
    child: PageView(
      controller: controller,
      scrollDirection: Axis.horizontal,
      children: banners,
    ),
  );
}
}
