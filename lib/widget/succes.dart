import 'package:flutter/material.dart';


class Succes {
  static void showSuccessDialog(BuildContext context, String title, String text) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: [
              Icon(Icons.info_outline, color: Colors.blue),
              SizedBox(width: 10),
              Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          content: Text(
            text,
            textAlign: TextAlign.right,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                print("تم التأكيد");
              },
              child: Text('موافق'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                print("تم الإلغاء");
              },
              child: Text('إلغاء'),
            ),
          ],
        );
      },
    );
  }
}
