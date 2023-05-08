import 'package:flutter/material.dart';
import 'package:ui_travel/models/destination.dart';

class DestinationDetail extends StatelessWidget {
  const DestinationDetail({super.key, required this.destination});
  final Destination destination;

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
                  tag: 'destination_${destination.city}',
                  child: ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                        Colors.black12, BlendMode.darken),
                    child: Image.asset(
                      destination.imageUrl,
                      height: MediaQuery.of(context).size.height * .4,
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
                          destination.city,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            destination.country,
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
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: destination.activities.length,
              itemBuilder: (context, index) {
                final activity = destination.activities[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Image.asset(
                            activity.imageUrl,
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.width * 0.3,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(activity.name),
                              Text(activity.type),
                              Row(
                                children: List.generate(
                                  activity.rating,
                                  (index) => Icon(
                                    Icons.star,
                                    color: Colors.yellow.shade400,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  activity.startTimes.first,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  activity.startTimes.last,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text('\$ ${activity.price.toStringAsFixed(2)}')
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
