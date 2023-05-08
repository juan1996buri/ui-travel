import 'package:flutter/material.dart';

List<IconData> iconList = [
  Icons.card_travel,
  Icons.run_circle_outlined,
  Icons.bed,
  Icons.bike_scooter,
  Icons.travel_explore,
  Icons.swipe,
  Icons.trending_down,
  Icons.vaccines,
  Icons.bike_scooter,
  Icons.travel_explore,
];

class TopNavigationTravel extends StatefulWidget {
  const TopNavigationTravel({
    super.key,
  });

  @override
  State<TopNavigationTravel> createState() => _TopNavigationTravelState();
}

class _TopNavigationTravelState extends State<TopNavigationTravel> {
  int selectedIcon = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            iconList.length,
            (index) {
              final currentIcon = selectedIcon == index;
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedIcon = index;
                    });
                  },
                  child: CircleAvatar(
                    foregroundColor:
                        !currentIcon ? Colors.black45 : Colors.white,
                    backgroundColor:
                        !currentIcon ? Colors.grey.shade200 : Colors.cyan,
                    child: Icon(iconList[index]),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
