import 'package:flutter/material.dart';
import 'package:tribus/constants.dart';

class ServicePageMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var padding = MediaQuery.of(context).padding;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('images/services_background.jpg'),
        ),
      ),
      padding: EdgeInsets.only(
          top: padding.top, left: padding.left + 10, right: padding.right + 10),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text(
          'Services',
          style: TextStyle(
              decoration: TextDecoration.underline,
              color: kBlueColor,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
        Service(
          url: 'images/web_service.jpg',
          title: kWebTitle,
          desc:
              kWebDesc,
          left: false,
        ),
        Service(
          url: 'images/mobile_service.jpg',
          title: kMobileTitle,
          desc:
              kMobileDesc,
          left: true,
        ),
        Service(
          url: 'images/iot_service.jpg',
          title: kIotTitle,
          desc:
              kIotDesc,
          left: false,
        ),
      ]),
    );
  }
}

class Service extends StatelessWidget {
  final bool left;
  final String title;
  final String url;
  final String desc;

  Service({this.desc, this.left, this.title, this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14), bottomRight: Radius.circular(14)),
        boxShadow: [
          BoxShadow(offset: Offset(8, 8), color: Colors.grey, blurRadius: 8)
        ],
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('images/product_background.jpg'),
        ),
      ),
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 3.8,
      child: Row(children: [
        left
            ? Flexible(flex: 1, child: buildImage(left))
            : Flexible(flex: 2, child: buildColumn()),
        left
            ? Flexible(flex: 2, child: buildColumn())
            : Flexible(flex: 1, child: buildImage(left))
      ]),
    );
  }

  Column buildColumn() {
    return Column(children: [
      Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: kBlueColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          desc,
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: kBlackColor,
            fontSize: 16,
          ),
        ),
      )
    ]);
  }

  Container buildImage(bool left) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: left
            ? BorderRadius.only(topLeft: Radius.circular(14))
            : BorderRadius.only(bottomRight: Radius.circular(14)),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(url),
        ),
      ),
    );
  }
}
