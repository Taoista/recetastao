import 'package:flutter/material.dart';

class FoodSkeleton extends StatelessWidget {
  const FoodSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5F0),
      body: Stack(
        children: [
          /// Imagen superior
          Container(
            height: 420,
            width: double.infinity,
            color: Colors.grey.shade300,
          ),

          /// Contenido
          DraggableScrollableSheet(
            initialChildSize: 0.58,
            minChildSize: 0.58,
            maxChildSize: 0.95,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40),
                  ),
                ),
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.fromLTRB(
                    24,
                    24,
                    24,
                    120,
                  ),
                  children: [
                    Center(
                      child: _skeleton(
                        width: 50,
                        height: 5,
                        radius: 20,
                      ),
                    ),

                    const SizedBox(height: 24),

                    _skeleton(
                      width: 260,
                      height: 45,
                    ),

                    const SizedBox(height: 12),

                    _skeleton(
                      width: double.infinity,
                      height: 16,
                    ),

                    const SizedBox(height: 8),

                    _skeleton(
                      width: 250,
                      height: 16,
                    ),

                    const SizedBox(height: 30),

                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                      children: List.generate(
                        4,
                        (index) => Column(
                          children: [
                            _skeleton(
                              width: 55,
                              height: 55,
                              radius: 30,
                            ),
                            const SizedBox(height: 8),
                            _skeleton(
                              width: 50,
                              height: 14,
                            ),
                            const SizedBox(height: 6),
                            _skeleton(
                              width: 70,
                              height: 12,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    _skeleton(
                      width: 180,
                      height: 36,
                    ),

                    const SizedBox(height: 20),

                    ...List.generate(
                      6,
                      (index) => Padding(
                        padding:
                            const EdgeInsets.only(bottom: 16),
                        child: Row(
                          children: [
                            _skeleton(
                              width: 20,
                              height: 20,
                              radius: 10,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _skeleton(
                                width: double.infinity,
                                height: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    _skeleton(
                      width: 180,
                      height: 36,
                    ),

                    const SizedBox(height: 20),

                    ...List.generate(
                      5,
                      (index) => Padding(
                        padding:
                            const EdgeInsets.only(bottom: 20),
                        child: Row(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            _skeleton(
                              width: 35,
                              height: 35,
                              radius: 18,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                children: [
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
                      ),
                    ),

                    const SizedBox(height: 40),

                    _skeleton(
                      width: double.infinity,
                      height: 62,
                      radius: 30,
                    ),
                  ],
                ),
              );
            },
          ),

          /// Botones superiores
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  _skeleton(
                    width: 56,
                    height: 56,
                    radius: 28,
                  ),
                  Row(
                    children: [
                      _skeleton(
                        width: 56,
                        height: 56,
                        radius: 28,
                      ),
                      const SizedBox(width: 12),
                      _skeleton(
                        width: 56,
                        height: 56,
                        radius: 28,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _skeleton({
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