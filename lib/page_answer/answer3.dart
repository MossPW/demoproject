import 'package:flutter/material.dart';

class Answer3 extends StatelessWidget {
  const Answer3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Product Layout"),
          backgroundColor: Colors.orange,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.grey[300],
              padding: const EdgeInsets.all(15),
              child: const Text("Category : Electronics"),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProductDetail(
                  imgUrl: 'assets/labtop.png',
                  name: 'Laptop',
                  price: '999',
                ),
                ProductDetail(
                  imgUrl: 'assets/smartphone.png',
                  name: 'Smartphone',
                  price: '699',
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProductDetail(
                  imgUrl: 'assets/tablet.png',
                  name: 'Tablet',
                  price: '499',
                ),
                ProductDetail(
                  imgUrl: 'assets/camera.png',
                  name: 'Camera',
                  price: '299',
                )
              ],
            )
          ],
        ));
  }
}

class ProductDetail extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String price;
  const ProductDetail(
      {super.key,
      required this.name,
      required this.price,
      required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imgUrl,
          height: 150,
          width: 150,
        ),
        Text(name),
        Text(
          "$price THB",
          style: const TextStyle(color: Colors.green),
        )
      ],
    );
  }
}
