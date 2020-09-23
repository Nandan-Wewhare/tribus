import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tribus/constants.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        image: NetworkImage(
            'https://image.freepik.com/free-photo/blue-product-background_53876-89506.jpg'),
      )),
      child: Center(child: ProductCard()),
    );
  }
}

class ProductCard extends StatefulWidget {
  const ProductCard({Key key}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          _isHover = false;
        });
      },
      child: Container(
        width: size.width / 5,
        height: size.height / 3,
        padding: const EdgeInsets.all(8),
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            border: Border.all(
              color: kWhiteColor,
              width: 8,
            ),
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                  'https://image.freepik.com/free-photo/blue-product-background_53876-89506.jpg'),
            )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MaterialButton(
              onPressed: () {},
              hoverElevation: 0,
              mouseCursor: SystemMouseCursors.basic,
              elevation: 0,
              highlightElevation: 0,
              color: kWhiteColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
              child: Text('RTU Notes App',
                  style: TextStyle(
                    color: kBlueColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            MaterialButton(
              onPressed: () {},
              elevation: _isHover ? 4 : 0,
              color: _isHover ? kBlueColor : kWhiteColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
              child: Text('Follow Link',
                  style: TextStyle(
                    color: _isHover ? kWhiteColor : kBlueColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
