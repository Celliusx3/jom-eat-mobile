import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jomeat/data/sources/jomeat/models/responses/place_response.dart';

class HomeItem extends StatelessWidget {
  final PlaceResponse _place;
  final VoidCallback? _onTap;

  const HomeItem(PlaceResponse place, {VoidCallback? onTap, Key? key}) :
        _place = place,
        _onTap = onTap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: _place.uploads[0],
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin:Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0x00ffffff),
                          Color(0xaa000000)
                        ]
                    ),
                  ),
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _place.name,
                        style: const TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    )
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        _place.description,
                        style: const TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    )
                ),
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: _onTap,
                    ),
                  ),
                ),
              ],
            )
        );
      },
    );
  }
}