import 'package:flutter/material.dart';
import 'package:product_image/screen/model/product_model.dart';
import 'package:product_image/screen/provider/product_provider.dart';
import 'package:provider/provider.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({Key? key}) : super(key: key);

  @override
  State<Cartscreen> createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  ProductProvider? productProvider;
  @override
  Widget build(BuildContext context) {

    productProvider = Provider.of<ProductProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Cart List",
              style: TextStyle(color: Colors.black, letterSpacing: 2)),
        ),
        body: Consumer<ProductProvider>(
          builder: (context, value, child) => ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                leading: Text("${productProvider!.productData[index].image}",style: TextStyle(fontSize: 30)),
                title: Text("${productProvider!.productData[index].productname}",style: TextStyle(fontSize: 15,letterSpacing: 1,fontWeight: FontWeight.w700)),
                subtitle: Text("${productProvider!.productData[index].price}",style: TextStyle(fontSize: 18,letterSpacing: 1,fontWeight: FontWeight.w400)),
                trailing: Row(
                  mainAxisSize:MainAxisSize.min ,
                  children: [

                    IconButton(onPressed: () {
                      ProductModel p1 = ProductModel(image: productProvider!.productData[index].image,price: productProvider!.productData[index].price!*2,productname: productProvider!.productData[index].productname,qa: productProvider!.productData[index].qa!+1);
                      productProvider!.updateQa(index, p1);
                    }, icon: Icon(Icons.add)),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${productProvider!.productData[index].qa}"),
                    ),
                    IconButton(onPressed: () {

                      ProductModel p1 = ProductModel(image: productProvider!.productData[index].image,price: productProvider!.productData[index].price!/2,productname: productProvider!.productData[index].productname,qa: productProvider!.productData[index].qa!-1);
                      productProvider!.updateQa(index, p1);

                    }, icon: Icon(Icons.remove)),


                  ],
                ),
              ),itemCount: productProvider!.cartData.length ),
        ),
      ),
    );
  }
}