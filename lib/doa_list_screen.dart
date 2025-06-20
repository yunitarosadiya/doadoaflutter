import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Doa {
    final String id;
    final String doa;
    final String ayat;
    final String latin;
    final String artinya;

    Doa({
        required this.id,
        required this.doa,
        required this.ayat,
        required this.latin,
        required this.artinya,
    });

    factory Doa.fromJson(Map<String, dynamic> json) {
        return Doa(
            id: json['id'].toString(),
            doa: json['doa'],
            ayat: json['ayat'],
            latin: json['latin'],
            artinya: json['artinya'],
        );
    }
}

class DoaListScreen extends StatefulWidget {
    const DoaListScreen({super.key});

    @override
    State<DoaListScreen> createState() => _DoaListScreenState();
}

class _DoaListScreenState extends State<DoaListScreen> {
    List<Doa> _doaList = [];
    bool _isLoading = true;

    @override
    void initState() {
        super.initState();
        fetchDoa();
    }

    Future<void> fetchDoa() async {
        final response = await http.get(Uri.parse('https://open-api.my.id/api/doa'));

        if (response.statusCode == 200) {
            final List jsonData = json.decode(response.body);
            setState(() {
                _doaList = jsonData.map((e) => Doa.fromJson(e)).toList();
                _isLoading = false;
            });
        } else {
            throw Exception('Gagal memuat doa');
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
                child: Column(
                    children: [
                        Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                                children: [
                                    Image.asset(
                                        'assets/images/book.png',
                                        width: 60,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                        child: Container(
                                            padding: const EdgeInsets.symmetric(vertical: 12),
                                            decoration: BoxDecoration(
                                                color: const Color(0xFF4A2020),
                                                borderRadius: BorderRadius.circular(40),
                                            ),
                                            child: const Center(
                                                child: Text(
                                                    "Daftar Doa Harian",
                                                    style: TextStyle(color: Colors.white, fontSize: 18),
                                                ),
                                            ),
                                        ),
                                    ),
                                ],
                            ),
                        ),
                    
                        _isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : Expanded(
                                child: ListView.builder(
                                    itemCount: _doaList.length,
                                    padding: const EdgeInsets.symmetric(horizontal: 24),
                                    itemBuilder: (context, index) {
                                        final doa = _doaList[index];
                                        return Container(
                                            margin: const EdgeInsets.only(bottom: 12),
                                            padding: const EdgeInsets.symmetric(vertical: 16),
                                            decoration: BoxDecoration(
                                                color: const Color(0xFF9C4B4B),
                                                borderRadius: BorderRadius.circular(30),
                                            ),
                                            child: Center(
                                                child: Text(
                                                doa.doa,
                                                style: const TextStyle(color: Colors.white, fontSize: 16),
                                                ),
                                            ),
                                        );
                                    },
                                ),
                            ),
                    
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                                        decoration: BoxDecoration(
                                            color: const Color(0xFF4A2020),
                                            borderRadius: BorderRadius.circular(30),
                                        ),
                                        child: const Text(
                                            "notes",
                                            style: TextStyle(color: Colors.white, fontSize: 18),
                                        ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                            Navigator.pop(context);
                                        },
                                        icon: const Icon(Icons.home, size: 32),
                                        color: const Color(0xFF4A2020),
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