import 'package:flutter/material.dart';
import 'package:recetao/core/theme/app_colors.dart';


class SkeletonCardFoodHorizontal extends StatelessWidget {
  const SkeletonCardFoodHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// IMAGE
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(22),
            ),
          ),

          const SizedBox(width: 16),

          /// CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                /// TITLE + DELETE
                Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          _skeleton(
                            width: double.infinity,
                            height: 16,
                          ),
                          const SizedBox(height: 8),
                          _skeleton(
                            width: 180,
                            height: 16,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 12),

                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                /// STATS
                Row(
                  children: [
                    _skeleton(
                      width: 50,
                      height: 14,
                    ),

                    const SizedBox(width: 12),

                    _skeleton(
                      width: 50,
                      height: 14,
                    ),

                    const SizedBox(width: 12),

                    _skeleton(
                      width: 90,
                      height: 14,
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                /// DESCRIPTION
                _skeleton(
                  width: double.infinity,
                  height: 14,
                ),

                const SizedBox(height: 8),

                _skeleton(
                  width: 220,
                  height: 14,
                ),
              ],
            ),
          ),
        ],
      ),
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
        borderRadius:
            BorderRadius.circular(radius),
      ),
    );
  }
}