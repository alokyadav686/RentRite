import 'package:flutter/material.dart';
import 'package:rentrite/contants/colors.dart';
import 'package:rentrite/screens/home/widget/custom_header.dart';
// ignore: library_prefixes
import 'package:rentrite/services/api/api_services.dart' as ApiService;

class Lawyers extends StatefulWidget {
  const Lawyers({super.key});

  @override
  State<Lawyers> createState() => _LawyersState();
}

class _LawyersState extends State<Lawyers> {
  List<dynamic> lawyersList = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchLawyers(); // Call the separate method
  }

  void fetchLawyers() async {
    try {
      List<dynamic> data = await ApiService.getLawyers();
      setState(() {
        lawyersList = data;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        errorMessage = "Failed to load lawyers";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        title: CustomHeader(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SearchBarWidget(),
            SizedBox(height: 10),
            Expanded(
              child:
                  isLoading
                      ? Center(child: CircularProgressIndicator())
                      : errorMessage != null
                      ? Center(child: Text(errorMessage!))
                      : lawyersList.isEmpty
                      ? Center(child: Text("No Lawyers Found"))
                      : ListView.builder(
                        itemCount: lawyersList.length,
                        itemBuilder: (context, index) {
                          return LawyerCard(lawyerData: lawyersList[index]);
                        },
                      ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              // Add menu functionality
            },
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search Lawyers...",
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Add search functionality
            },
          ),
        ],
      ),
    );
  }
}

class LawyerCard extends StatelessWidget {
  final Map<String, dynamic> lawyerData;

  const LawyerCard({Key? key, required this.lawyerData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              lawyerData['name'] ?? "Unknown",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
            SizedBox(height: 5),
            Text(lawyerData['designation'] ?? "N/A"),
            Text(lawyerData['district'] ?? "N/A"),
            Divider(),
            Text("Qualifications: ${lawyerData['qualification'] ?? "N/A"}"),
            Text("Age: ${lawyerData['age'] ?? "N/A"}"),
            Text("Gender: ${lawyerData['gender'] ?? "N/A"}"),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Video Call functionality
                },
                child: Text(
                  "Video Call",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
