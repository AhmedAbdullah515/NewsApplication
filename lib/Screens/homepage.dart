import 'package:flutter/material.dart';
import 'package:full_application/CustomWedgets/newsitem.dart';
import 'package:full_application/Providers/articleprovider.dart';
import 'package:provider/provider.dart';
class Homepage extends StatelessWidget {
  Homepage({super.key});
  @override
  Widget build(BuildContext context)
   {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Home Screen",
            style: TextStyle(fontSize: 30, fontWeight: .bold),
          ),
        ),
      ),
      body: Consumer<Articleprovider>
      (
        builder: (context, value, child) {
          final data = value.datamodel?.articles;
          if (data == null) {
            value.getnews();
            return Center
            (
              child: CircularProgressIndicator(color: Colors.black),
            );
          } 
          else
           {
            return ListView.builder
            (
              itemBuilder: (context, index) => Newsitem(article: data[index]),
              itemCount: data.length,
            );
          }
        },
      ),
    );
  }
}