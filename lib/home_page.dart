import 'package:flutter/material.dart';
import 'doa_list_screen.dart';

class HomePage extends StatelessWidget {
    const HomePage({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                    Image.asset(
                                        'assets/images/book.png',
                                        width: 60,
                                    ),

                                    const SizedBox(width: 8),
                                    Expanded(
                                        child: Container(
                                            padding: const EdgeInsets.symmetric(vertical: 16),
                                            decoration: BoxDecoration(
                                                color: const Color(0xFF4A2020),
                                                borderRadius: BorderRadius.circular(50),
                                            ),
                                            child: const Center(
                                                child: Text(
                                                    "Hafalan Doa Hari Ini",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.w500,
                                                    ),
                                                ),
                                            ),
                                        ),
                                    ),
                                ],
                            ),
                        ),

                        const SizedBox(height: 30),
                        Container(
                            margin: const EdgeInsets.symmetric(horizontal: 24),
                            padding: const EdgeInsets.all(16),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: const Color(0xFF9C4B4B),
                                borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Text("Judul : Nama Doa", style: TextStyle(color: Colors.white, fontSize: 16)),
                                    SizedBox(height: 8),
                                    Text("Arab : Doa Arab", style: TextStyle(color: Colors.white, fontSize: 16)),
                                    SizedBox(height: 8),
                                    Text("Latin : Doa Latin", style: TextStyle(color: Colors.white, fontSize: 16)),
                                    SizedBox(height: 8),
                                    Text("Terjemah : Terjemahan Doanya", style: TextStyle(color: Colors.white,fontSize: 16)),
                                ],
                            ),
                        ),

                        const SizedBox(height: 30),

                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: ElevatedButton(
                                onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const DoaListScreen()),
                                    );
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF4A2020),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                    ),
                                    padding: const EdgeInsets.symmetric(vertical: 12),
                                ),
                                child: const Center(
                                    child: Text(
                                        "SEMUA DOA",
                                        style: TextStyle(color: Colors.white),
                                    ),
                                ),
                            ),
                        ),

                        const SizedBox(height: 10),

                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF4A2020),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                    ),
                                    padding: const EdgeInsets.symmetric(vertical: 12),
                                ),
                                child: const Center(
                                    child: Text(
                                        "MOTIVASI",
                                        style: TextStyle(color: Colors.white),
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