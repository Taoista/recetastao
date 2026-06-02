import 'package:flutter/material.dart';
import 'package:recetao/core/theme/app_colors.dart';

class SkeletonPrepartion extends StatelessWidget {
  const SkeletonPrepartion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _skeleton(width: 220, height: 20),
            const SizedBox(height: 8),
            _skeleton(width: 180, height: 20),
          ],
        ),
        actions: [
          _circleSkeleton(),
          const SizedBox(width: 8),
          _circleSkeleton(),
          const SizedBox(width: 12),
        ],
      ),
      body: Column(
        children: [
          /// Indicador superior
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 20,
              right: 20,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  _skeleton(
                    width: 120,
                    height: 12,
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: List.generate(
                      5,
                      (index) => Padding(
                        padding:
                            const EdgeInsets.only(
                          right: 8,
                        ),
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color:
                                Colors.grey.shade300,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Card principal
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(0.04),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    /// Imagen
                    Container(
                      height: 280,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius:
                            const BorderRadius.only(
                          topLeft:
                              Radius.circular(28),
                          topRight:
                              Radius.circular(28),
                        ),
                      ),
                    ),

                    Padding(
                      padding:
                          const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          _skeleton(
                            width: 180,
                            height: 28,
                          ),

                          const SizedBox(
                            height: 24,
                          ),

                          _skeleton(
                            width: double.infinity,
                            height: 14,
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          _skeleton(
                            width: double.infinity,
                            height: 14,
                          ),

                          const SizedBox(
                            height: 10,
                          ),

                          _skeleton(
                            width: 250,
                            height: 14,
                          ),

                          const SizedBox(
                            height: 40,
                          ),

                          _skeleton(
                            width: 140,
                            height: 48,
                            radius: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleSkeleton() {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        shape: BoxShape.circle,
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