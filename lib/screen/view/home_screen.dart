import 'package:flutter/material.dart';
import 'package:product_image/screen/model/product_model.dart';
import 'package:product_image/screen/provider/product_provider.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  ProductProvider? productProvider;

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text("Product List",
              style: TextStyle(color: Colors.black, letterSpacing: 2)),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'cart');
                },
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                )),
          ],
        ),
        body: Card(
          child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                ProductModel p1 = ProductModel(
                    productname:
                        productProvider!.productData[index].productname,
                    image: productProvider!.productData[index].image,
                    price: productProvider!.productData[index].price);
                Navigator.pushNamed(context, 'product', arguments: p1);
              },
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text("${productProvider!.productData[index].image}",
                        style: TextStyle(fontSize: 50)),
                    Text("${productProvider!.productData[index].productname}",
                        style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w700)),
                    Text("${productProvider!.productData[index].price}",
                        style: TextStyle(
                            fontSize: 18,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w400)),
                  ],
                ),
              ),
            ),
            itemCount: productProvider!.productData.length,
          ),
        ),
      ),
    );
  }
}
