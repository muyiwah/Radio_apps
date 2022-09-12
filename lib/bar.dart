import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  final String img;
  final String title;
  final String subTitle;
  const Bar(
      {Key? key,
      required this.img,
      required this.title,
      required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        height: 82,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 86, 92, 132),
              blurRadius: 20,
              spreadRadius: 10,
              offset: Offset(5, 5),
            ),
            // BoxShadow(
            //   color: Colors.grey,
            //   blurRadius: 20,
            //   spreadRadius: 10,
            //   offset: Offset(-5, -5),
            // ),
          ],
          // color: Colors.white,
          borderRadius: BorderRadius.circular(1),
          border: Border.all(color: Colors.white),
          color: Colors.grey[200],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                child: Image.asset(img, height: 50),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      subTitle,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(2),
                color: Colors.green[400],
                child: Text(
                  'Connect',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
