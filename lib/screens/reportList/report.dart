import 'package:flutter/material.dart';
import 'package:steadypunpipi_vhack/widget/reportList/report_item.dart';
import 'package:steadypunpipi_vhack/models/report_data.dart';

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  bool _isSearching = false;
  String _searchQuery = "";

  void _startSearch() {
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearch() {
    setState(() {
      _isSearching = false;
      _searchQuery = "";
    });
  }

  void _updateSearchQuery(String newQuery) {
    setState(() {
      _searchQuery = newQuery;
    });
  }

  List<Map<String, dynamic>> _filterReports(String statusFilter) {
    return reportData.where((item) {
      if (statusFilter.isNotEmpty && item["status"] != statusFilter) { // Change null check to isNotEmpty
        return false;
      }
      if (_searchQuery.isNotEmpty && !item["title"].toLowerCase().contains(_searchQuery.toLowerCase())) {
        return false;
      }
      return true;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: _isSearching
              ? TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    border: InputBorder.none,
                  ),
                  onChanged: _updateSearchQuery,
                )
              : Text(
                  "Road Hole Reports",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.menu),
            onPressed: _isSearching ? _stopSearch : () {
              // Handle drawer icon press
              Scaffold.of(context).openDrawer();
            },
          ),
          actions: [
            if (!_isSearching)
              IconButton(
                icon: Icon(Icons.search),
                onPressed: _startSearch,
              ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(child: Text("Recent", style: TextStyle(fontWeight: FontWeight.normal))),
              Tab(child: Text("In Progress", style: TextStyle(fontWeight: FontWeight.normal))),
              Tab(child: Text("Resolved", style: TextStyle(fontWeight: FontWeight.normal))),
            ],
          ),
        ),
        backgroundColor: Color(0xFFE5E5E5),
        body: TabBarView(
          children: [
            // Recent tab - fetch all
            ListView.builder(
              itemCount: _filterReports('').length,
              itemBuilder: (context, index) {
                final item = _filterReports('')[index];
                return ReportItem(
                  image: item["image"],
                  title: item["title"],
                  time: item["time"],
                  status: item["status"],
                  isIoTVerified: item["isIoTVerified"],
                );
              },
            ),
            // In Progress tab - filter by status "In Progress"
            ListView.builder(
              itemCount: _filterReports("In Progress").length,
              itemBuilder: (context, index) {
                final item = _filterReports("In Progress")[index];
                return ReportItem(
                  image: item["image"],
                  title: item["title"],
                  time: item["time"],
                  status: item["status"],
                  isIoTVerified: item["isIoTVerified"],
                );
              },
            ),
            // Resolved tab - filter by status "Resolved"
            ListView.builder(
              itemCount: _filterReports("Resolved").length,
              itemBuilder: (context, index) {
                final item = _filterReports("Resolved")[index];
                return ReportItem(
                  image: item["image"],
                  title: item["title"],
                  time: item["time"],
                  status: item["status"],
                  isIoTVerified: item["isIoTVerified"],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}