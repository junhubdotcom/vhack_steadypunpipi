import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GovernmentDashboardApp());
}

class GovernmentDashboardApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Government Dashboard',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: GovernmentDashboard(),
    );
  }
}

class GovernmentDashboard extends StatefulWidget {
  const GovernmentDashboard({super.key});

  @override
  State<GovernmentDashboard> createState() => _GovernmentDashboardState();
}

class _GovernmentDashboardState extends State<GovernmentDashboard> {
    List<Map<String, dynamic>> incidents = [];
    List<int> weeklyReportData = List.generate(7, (index)=>Random().nextInt(20)+5);
    List<Map<String, dynamic>> alerts = [];
  @override
  void initState() {
    super.initState();
    _generateData();
  }

  void _generateData(){
    incidents = List.generate(5, (index){
      final random=Random();
      return{
        'id':index+1,
        'location':'Location ${index+1}',
        'type': ['Pothole','Fallen Tree','Accident','Broken Streetlight','Road Construction','Road Obstruction'][random.nextInt(6)],
        'severity': ['Low', 'Medium','High'][random.nextInt(3)],
        'urgency':['Low','Medium','High'][random.nextInt(3)],
        'votes': random.nextInt(100),
        'status': ['Reported','Under Review','In Progress','Completed'][random.nextInt(4)],
        // 'sensorVerified': random.nextBool(),
        'sensorVerified' : true,
      };
    });
    alerts = List.generate(5, (index) {
      return {
        'id': index,
        'message': 'Reports in Location ${index + 1}',
        'time': DateTime.now().subtract(Duration(hours: index)),
        'type': ['Emergency', 'Warning'][Random().nextInt(2)],
      };
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildSidebar(),
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              childAspectRatio: 2.0,
              children: [
                _buildSummaryCards(title: 'Total Cases', value: '200'),
                _buildSummaryCards(title: 'Pending Cases', value: '90'),
                _buildSummaryCards(title: 'In Progress', value: '70'),
                _buildSummaryCards(title: 'Resolved Cases', value: '40'),
              ],),
            SizedBox(height: 5),
            Expanded(
              child: GridView.count(
                // shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 1.5,
                children: [
              Expanded(
              child: Row(
                children: [
                  Expanded(flex:1, child: _buildIncidentMapCard()),
                  Expanded(flex:1, child: _buildWeeklyReportsChart()),
                ],
              ),
            ),
                  _buildAlertsCard(),
                  _buildIncidentManagementCard(),
                  _buildAnalysisCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  _buildSummaryCards({required String title, required String value}) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Icon(Icons.more_vert_rounded, color: Colors.grey),
              ],
            ),
            SizedBox(height: 10),
            Text(value, style: TextStyle(fontSize: 50,fontWeight: FontWeight.w900)),
          ],
        ),),
    );
  }

  Widget _buildCard(String title, Widget content, IconData icon, Color color) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 30, color: color),
                SizedBox(width: 8),
                Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            Expanded(child: content),
          ],
        ),
      ),
    );
  }

Widget _buildWeeklyReportsChart() {
  return _buildCard(
    'Weekly Reports',
    SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: weeklyReportData.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value.toDouble())).toList(),
              isCurved: true,
              barWidth: 2,
              color: Colors.blue,
              dotData: FlDotData(show: true),
              belowBarData: BarAreaData(show: true, color: Colors.blue[100]),
            ),
          ],
          titlesData: FlTitlesData(
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  const style = TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  );
                  Widget text;
                  switch (value.toInt()) {
                    case 0:
                      text = const Text('Mon', style: style);
                      break;
                    case 1:
                      text = const Text('Tue', style: style);
                      break;
                    case 2:
                      text = const Text('Wed', style: style);
                      break;
                    case 3:
                      text = const Text('Thu', style: style);
                      break;
                    case 4:
                      text = const Text('Fri', style: style);
                      break;
                    case 5:
                      text = const Text('Sat', style: style);
                      break;
                    case 6:
                      text = const Text('Sun', style: style);
                      break;
                    default:
                      text = const Text('', style: style);
                      break;
                  }
                  return SideTitleWidget(axisSide: meta.axisSide, space: 8.0,child: text,);
                },
              ),
            ),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true,reservedSize: 30,
            getTitlesWidget: (value, meta) {
                  const style = TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  );
                  return Text('${value.toInt()}', style: style);
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          gridData: FlGridData(show: true),
        ),
      ),
    ),
    Icons.library_books_rounded,
    Colors.brown,
  );
}

  Widget _buildIncidentMapCard() {
    return _buildCard(
      'Incident Map', 
      Expanded(
        child: Container(
          height: 150,
          color: Colors.grey[200],
          child: Image.asset('assets/images/heatmap.jpg',fit: BoxFit.cover,height: double.infinity,width: double.infinity,),
          ),
        ),
      Icons.map_rounded,
      Colors.teal);
  }
  Widget _buildAlertsCard() {
    return _buildCard(
      "Alerts",
      ListView.builder(
        itemCount: alerts.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            color: alerts[index]['type']== 'Emergency'? Colors.red[100]:Colors.yellow,
            child: ListTile(
              leading: Icon(alerts[index]['type']=='Emergency'? Icons.error: Icons.warning),
              title: Text(alerts[index]['message']),
              subtitle: Text('Time: ${alerts[index]['time']}'),
              trailing: Text(alerts[index]['type']),
            ),
          );
        },
      ),
      Icons.notifications,
      Colors.orange,
    );
  }

Widget _buildIncidentManagementCard() {
      // Filter and sort incidents
    List<Map<String, dynamic>> sortedIncidents = List.from(incidents);
    sortedIncidents.sort((a, b) => b['votes'].compareTo(a['votes'])); // Sort by votes (descending)
  return _buildCard(
    "Cases",
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: const [
          // DataColumn(label: Text('ID', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('Location', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('Type', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('Severity', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('Urgency', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('Votes', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('Status', style: TextStyle(fontWeight: FontWeight.bold))),
          DataColumn(label: Text('Verified', style: TextStyle(fontWeight: FontWeight.bold))),
        ],
        rows: sortedIncidents.map((incident) {
          return DataRow(cells: [
            DataCell(
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(incident['location'], style: TextStyle(fontWeight: FontWeight.w500)),
              ),
            ),
            // DataCell(
            //   Text(incident['location'], style: TextStyle(color: Colors.blueGrey[800])),
            // ),
            DataCell(
              Text(incident['type'], style: TextStyle(color: Colors.blueGrey[800])),
            ),
            DataCell(
              _buildSeverityUrgencyChip(incident['severity'], _getSeverityColor(incident['severity'])),
            ),
            DataCell(
              _buildSeverityUrgencyChip(incident['urgency'], _getUrgencyColor(incident['urgency'])),
            ),
            DataCell(
              Text(incident['votes'].toString(), style: TextStyle(fontWeight: FontWeight.w600, color: Colors.deepPurple)),
            ),
            DataCell(
              _buildStatusChip(incident['status']),
            ),
            DataCell(
              Icon(
                incident['sensorVerified'] ? Icons.check_circle : Icons.cancel,
                color: incident['sensorVerified'] ? Colors.green : Colors.red,
              ),
            ),
          ]);
        }).toList(),
      ),
    ),
    Icons.list_rounded,
    Colors.grey,
  );
}

Widget _buildAnalysisCard() {
  // Count incident types
  Map<String, int> incidentTypeCounts = {};
  incidents.forEach((incident) {
    String type = incident['type'];
    incidentTypeCounts[type] = (incidentTypeCounts[type] ?? 0) + 1;
  });

  // Prepare data for PieChart
  List<PieChartSectionData> pieChartData = [];
  List<Widget> indicators = [];
  List<Color> colors = [
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.red,
    Colors.purple,
    Colors.yellow[700]!,
    Colors.teal,
    Colors.brown,
  ];

  int colorIndex = 0;
  incidentTypeCounts.forEach((type, count) {
    pieChartData.add(PieChartSectionData(
      color: colors[colorIndex % colors.length],
      value: count.toDouble(),
      title: '${(count / incidents.length * 100).toStringAsFixed(1)}%',
      radius: 100,
      showTitle: true,
      titleStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
    ));

    indicators.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors[colorIndex % colors.length],
              ),
            ),
            SizedBox(width: 8),
            Text(type),
          ],
        ),
      ),
    );
    colorIndex++;
  });

  return _buildCard(
    "Analysis - Issue Type",
    Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: PieChart(
                  PieChartData(
                    sections: pieChartData,
                    sectionsSpace: 5,
                    centerSpaceRadius: 40,
                    borderData: FlBorderData(show: false),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: indicators,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    Icons.analytics,
    Colors.green,
  );
}

Widget _buildSeverityUrgencyChip(String text, Color color) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
    decoration: BoxDecoration(
      color: color.withOpacity(0.2),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Text(text, style: TextStyle(color: color, fontWeight: FontWeight.w500)),
  );
}

Widget _buildStatusChip(String status) {
  Color color;
  switch (status) {
    case 'Reported':
      color = Colors.blue;
      break;
    case 'Under Review':
      color = Colors.orange;
      break;
    case 'In Progress':
      color = Colors.yellow[700]!;
      break;
    case 'Completed':
      color = Colors.green;
      break;
    default:
      color = Colors.grey;
  }
  return Container(
    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
    decoration: BoxDecoration(
      color: color.withOpacity(0.2),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Text(status, style: TextStyle(color: color, fontWeight: FontWeight.w500)),
  );
}

Color _getSeverityColor(String severity) {
  switch (severity) {
    case 'Low':
      return Colors.green;
    case 'Medium':
      return Colors.orange;
    case 'High':
      return Colors.red;
    default:
      return Colors.grey;
  }
}

Color _getUrgencyColor(String urgency) {
  switch (urgency) {
    case 'Low':
      return Colors.blue;
    case 'Medium':
      return Colors.yellow[700]!;
    case 'High':
      return Colors.red;
    default:
      return Colors.grey;
  }
}

  Widget _buildSidebar() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blueGrey[900]),
            child: Text("Panel", style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text("Dashboard"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.report),
            title: Text("Reports"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text("User Management"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}