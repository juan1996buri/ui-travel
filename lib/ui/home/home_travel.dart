import 'package:flutter/material.dart';
import 'package:ui_travel/models/activity.dart';
import 'package:ui_travel/models/destination.dart';
import 'package:ui_travel/models/hotel_model.dart';
import 'package:ui_travel/ui/home/destination_card.dart';
import 'package:ui_travel/ui/home/hotel_card.dart';
import 'package:ui_travel/widget/section_title.dart';

import '../../widget/top_navigationTravel.dart';

class HomeTravel extends StatefulWidget {
  const HomeTravel({super.key});

  @override
  State<HomeTravel> createState() => _HomeTravelState();
}

class _HomeTravelState extends State<HomeTravel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'What would you like to find?',
          ),
        ),
        body: Column(
          children: [
            TopNavigationTravel(),
            SectionTitle(
              title: 'Top Destinations',
              onTap: () {},
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: destinations.length,
                itemBuilder: (context, index) {
                  final destination = destinations[index];
                  return DestinationCard(
                    destination: destination,
                  );
                },
              ),
            ),
            SectionTitle(
              title: 'Exclusive Hotels',
              onTap: () {},
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  final hotel = hotels[index];
                  return HotelCard(
                    hotel: hotel,
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: TravelBottomNavigation(
          iconDataList: [
            Icons.search,
            Icons.menu,
          ],
        ));
  }
}

class TravelBottomNavigation extends StatelessWidget {
  const TravelBottomNavigation({super.key, required this.iconDataList});
  final List<IconData> iconDataList;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: kToolbarHeight,
      child: Row(
        children: List.generate(
          iconDataList.length,
          (index) {
            final icon = iconDataList[index];
            return Expanded(child: Icon(icon));
          },
        )..insert(
            2,
            const Expanded(
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/avatar.jpg',
                ),
              ),
            ),
          ),
      ),
    );
  }
}
