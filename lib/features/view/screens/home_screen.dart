import 'package:flutter/material.dart';
import 'package:news_app/core/routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff202020),

      appBar: AppBar(
        backgroundColor: const Color(0xff1877F2),
        title: const Text(
          'News',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),

        child: Column(
          children: [
            // First News
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.details,
                  arguments: {
                    'image': image,
                    'title': 'Russian warship: Moskva sinks in Black Sea',
                    'category': 'Europe',
                  },
                );
              },

              child: Container(
                padding: const EdgeInsets.all(8),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),

                      child: Image.network(
                        image,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Europe',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffB0B3B8),
                      ),
                    ),

                    const SizedBox(height: 4),

                    const Text(
                      'Russian warship: Moskva sinks in Black Sea',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color(0xffE4E6EB),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Second News
            Container(
              padding: const EdgeInsets.all(8),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),

                    child: Image.network(
                      image,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Europe',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffB0B3B8),
                    ),
                  ),

                  const SizedBox(height: 4),

                  const Text(
                    'Russian warship: Moskva sinks in Black Sea',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffE4E6EB),
                    ),
                  ),
                ],
              ),
            ),

            // Third News
            Container(
              padding: const EdgeInsets.all(8),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),

                    child: Image.network(
                      image,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Europe',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffB0B3B8),
                    ),
                  ),

                  const SizedBox(height: 4),

                  const Text(
                    'Russian warship: Moskva sinks in Black Sea',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffE4E6EB),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const String image =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxKgwVzXl7QEsU3LAYnLzkSrEMaqiiMnjqWSQbg8vII78VkPCYDQV8K_o&s';
