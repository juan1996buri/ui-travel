import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_travel/models/destination.dart';
import 'package:ui_travel/ui/home/travel-details/destination-detail.dart';

class DestinationCard extends StatelessWidget {
  const DestinationCard({super.key, required this.destination});
  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return DestinationDetail(
                destination: destination,
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
                  tag: 'destination_${destination.city}',
                  child: Image.asset(
                    destination.imageUrl,
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
                      destination.city,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(destination.description)
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
