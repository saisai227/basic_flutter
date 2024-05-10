import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart' show kTransparentImage;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';

class ImageExample extends StatelessWidget {
  const ImageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          const ListTile(
            title: Text("Image From Asset:"),
          ),
          Card(
            child: Image.asset("images/zerotwo.jpg"),
          ),

          // cosnt Divider is a widget that separate each other with line
          const Divider(),
          
          const ListTile(
            title: Text("Images from URL"),
          ),
          Card(
            child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: "https://images.unsplash.com/photo-1713427607338-8edc529eeaa4?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
          ),

          const Divider(),
          const ListTile(
            title: Text("Cached Network Image"),
          ),
          CachedNetworkImage(
              imageUrl: "https://images.unsplash.com/photo-1427805371062-cacdd21273f1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDd8fHxlbnwwfHx8fHw%3D",
              placeholder: (context,url){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              errorWidget: (context,url,error){
                return const Icon(Icons.error);
              },
          ),
          const Divider(),
          const ListTile(
            title: Text("Extended Image"),
            subtitle: Text("provides more functionalities like image caching and shape and border radius and editing"),
          ),
          ExtendedImage.network(
            "https://images.unsplash.com/3/man-fishing.JPG?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
        ],
      ),
    );
  }
}
