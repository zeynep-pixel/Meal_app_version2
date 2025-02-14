import 'package:flutter/material.dart';

class BuildListTile extends StatelessWidget {  @override


  
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
    onTap: () {
      Navigator.pop(context); // Drawer'ı kapat
     
    },
    child: ListTile(
      leading: Icon(Icons.add_chart, color: Theme.of(context).colorScheme.primary),
      title: Text('kATEGORİ'),
      tileColor: Colors.grey[200], // Arka plan rengi
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
  }
}

