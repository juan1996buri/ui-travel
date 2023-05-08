import 'package:flutter/material.dart';
import 'package:ui_travel/models/activity.dart';
import 'package:ui_travel/models/destination.dart';
import 'package:ui_travel/models/hotel_model.dart';
import 'package:ui_travel/ui/home/travel-details/hotel_detail.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({
    super.key,
    required this.hotel,
  });
  final Hotel hotel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return HotelDetail(
                hotel: hotel,
              );
            },
          ),
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Hero(
                  tag: 'destination_${hotel.name}',
                  child: Image.asset(
                    hotel.imageUrl,
                    height: MediaQuery.of(context).size.height * .2,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hotel.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(hotel.address),
                    Text(hotel.price.toStringAsFixed(2)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
