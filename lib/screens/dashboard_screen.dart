//final dashboard_screen.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'call_model.dart';
import 'left_drawer_screen.dart'; // import your left drawer screen

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Future<CallList> futureCallList;

  @override
  void initState() {
    super.initState();
    futureCallList = fetchCallList();
  }

  Future<CallList> fetchCallList() async {
    try {
      final response = await http.post(
        Uri.parse(
            'https://mock-api.calleyacd.com/api/list?userId=68626f9497757cb741f449b0'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({"email": "dhrubo@yopmail.com"}),
      );

      if (response.statusCode == 200) {
        return CallList.fromJson(json.decode(response.body));
      } else {
        return CallList.fromJson({}); // fallback
      }
    } catch (e) {
      return CallList.fromJson({}); // fallback
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      // Connect drawer here
      drawer: const LeftDrawerScreen(),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),

        // Menu icon opens drawer
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),

        title: const Text(
          "Dashboard",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.headset), onPressed: () {}),
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
        ],
      ),
      body: FutureBuilder<CallList>(
        future: futureCallList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching data: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final callList = snapshot.data!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Big Test List box
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2)),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Test List',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${callList.calls.length} Calls',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            'S',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Large asset icon in the center
                  Center(
                    child: Image.asset(
                      'assets/pie_chart_1.png',
                      height: 180,
                      width: 180,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Three counters/buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _coloredCounter('Pending', callList.pending, Colors.orange),
                      _coloredCounter('Done', callList.called, Colors.green),
                      _coloredCounter('Schedule', callList.rescheduled, Colors.blue),
                    ],
                  ),
                  const SizedBox(height: 80), // space before bottom button

                  // Star Calling Now button at the bottom with gradient
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: const LinearGradient(
                        colors: [Colors.blue, Colors.green],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Star Calling Now',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Calls List Section
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: callList.calls.length,
                    itemBuilder: (context, index) {
                      final call = callList.calls[index];
                      return Card(
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.green[400],
                                child: Text(
                                  call.firstName.isNotEmpty
                                      ? call.firstName[0]
                                      : '?',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Call No ${index + 1}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: const Text('Star Calling Now'),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text('${call.title} ${call.firstName} ${call.lastName}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 2),
                                    Text(
                                        'Email: ${call.firstName.toLowerCase()}@example.com'),
                                    Text('Phone: ${call.phone}'),
                                    Text('Other Phone 1: ${call.otherPhone1}'),
                                    Text('Other Phone 2: ${call.otherPhone2}'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }

  Widget _coloredCounter(String title, int count, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text('$count',
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: color)),
            const SizedBox(height: 4),
            Text(title, style: TextStyle(fontSize: 14, color: color)),
          ],
        ),
      ),
    );
  }
}


