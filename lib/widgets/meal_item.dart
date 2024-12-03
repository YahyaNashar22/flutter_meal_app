import 'package:flutter/material.dart';
import "package:transparent_image/transparent_image.dart";
import 'package:meal_app/data/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});

  final Meal meal;

  final void Function(Meal meal) onSelectMeal;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: Column(
        children: [
          InkWell(
            onTap: () => onSelectMeal(meal),
            borderRadius: BorderRadius.circular(8),
            splashColor: Theme.of(context).primaryColor,
            child: Stack(
              children: [
                Hero(
                  tag: meal.id,
                  child: FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(meal.imageUrl),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                    color: Colors.black54,
                    child: Column(
                      children: [
                        Text(
                          meal.title,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.schedule),
                                const SizedBox(width: 5),
                                Text("${meal.duration} min",
                                    style:
                                        const TextStyle(color: Colors.white)),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.cases_rounded),
                                const SizedBox(width: 5),
                                Text(meal.complexityText,
                                    style:
                                        const TextStyle(color: Colors.white)),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.attach_money),
                                const SizedBox(width: 5),
                                Text(meal.affordabilityText,
                                    style:
                                        const TextStyle(color: Colors.white)),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
