import 'package:flutter/material.dart';
import 'package:ui_travel/models/hotel_model.dart';

class HotelDetail extends StatelessWidget {
  const HotelDetail({super.key, required this.hotel});
  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
                child: Hero(
                  tag: 'destination_${hotel.name}',
                  child: ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                        Colors.black26, BlendMode.darken),
                    child: Image.asset(
                      hotel.imageUrl,
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).padding.top,
                left: 0,
                right: 0,
                child: Row(
                  children: [
                    const BackButton(),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.menu))
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          hotel.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            hotel.address,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
