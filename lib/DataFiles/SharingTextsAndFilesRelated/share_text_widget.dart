import 'package:flutter/material.dart';

import 'package:share/share.dart';

class ShareTextWidget extends StatefulWidget {
  @override
  _ShareTextWidgetState createState() => _ShareTextWidgetState();
}

class _ShareTextWidgetState extends State<ShareTextWidget> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 32),
              ElevatedButton(onPressed: () async {
                if (false) {
                } else {
                  Share.share("");
                }
              },
                child: Text("Click To Share"),
              ),
            ],
          ),
        ),
      );
}
