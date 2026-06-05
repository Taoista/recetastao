import 'package:flutter/material.dart';




class FeaturedCardSkeleton extends StatelessWidget {
  const FeaturedCardSkeleton({super.key});

  @override
   Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// HEADER
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _skeleton(width: 120, height: 28),
            _skeleton(width: 80, height: 20),
          ],
        ),

        const SizedBox(height: 16),

        /// CARD
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.05),
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// IMAGE
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(22),
                ),
                child: _skeleton(
                  width: double.infinity,
                  height: 190,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _skeleton(width: 180, height: 24),
                          const SizedBox(height: 12),
                          _skeleton(width: 140, height: 18),
                        ],
                      ),
                    ),

                    const SizedBox(width: 12),

                    _skeleton(
                      width: 40,
                      height: 40,
                      radius: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _skeleton({
    required double width,
    required double height,
    double radius = 8,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}