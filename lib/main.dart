import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController controller =
      PageController(viewportFraction: 0.8, keepPage: true);

  List<String> images = [
    "https://images.unsplash.com/photo-1589779677460-a15b5b5790ce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80",
    "https://images.unsplash.com/photo-1520301255226-bf5f144451c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=873&q=80",
    "https://images.unsplash.com/photo-1504472478235-9bc48ba4d60f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80",
    "https://images.unsplash.com/photo-1535591273668-578e31182c4f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    "https://images.unsplash.com/photo-1624964562918-0b8cf87deee6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
    "https://images.unsplash.com/photo-1597499216184-b56bf75f84c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"
  ];

  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
        6,
        (index) => Container(
              height: 280,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Image.network(
                images[index],
                fit: BoxFit.cover,
              ),
            ));
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Animated Page Indicator Example",
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(children: [
        SizedBox(
          height: 240,
          child: PageView.builder(
            controller: controller,
            // itemCount: pages.length,
            itemBuilder: (_, index) {
              return pages[index % pages.length];
            },
          ),
        ),
        SmoothPageIndicator(
            controller: controller, // PageController
            count: 6,
            effect: SwapEffect(
                spacing: 8.0,
                radius: 4.0,
                dotWidth: 24.0,
                dotHeight: 16.0,
                paintStyle: PaintingStyle.stroke,
                strokeWidth: 1.5,
                dotColor: Colors.grey,
                activeDotColor: Colors.indigo), // your preferred effect
            onDotClicked: (index) {}),
      ]),
    );
  }
}
