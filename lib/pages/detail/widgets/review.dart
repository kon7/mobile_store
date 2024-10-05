import 'package:flutter/material.dart';
import 'package:gamestore/models/game.dart';

class ReviewSection extends StatelessWidget {
  final Game game;
  const ReviewSection(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Wrap the entire column with SingleChildScrollView
      child: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ratings and review',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Flexible( // Added Flexible here
                  child: Text(
                    'View',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                    overflow: TextOverflow.ellipsis, // To avoid overflow
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  game.score.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 48,
                  ),
                ),
                const SizedBox(width: 15),
                Flexible( // Added Flexible to this column
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            size: 25,
                            color: index < game.score.round()
                                ? Colors.amber
                                : Colors.grey.withOpacity(0.3),
                          );
                        }),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${game.review} ${game.review == 1 ? "review" : "reviews"}',
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                        overflow: TextOverflow.ellipsis, // Avoids overflow here too
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: double.maxFinite,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xFF5F67EA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Install',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
