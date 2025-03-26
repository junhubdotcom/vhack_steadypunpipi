# Overview

The Watcher leverages IoT, crowdsourcing, and AI-powered real-time data analytics to enhance public administration and urban mobility. IoT sensors and CCTV continuously monitor city conditions, detecting issues such as potholes, fallen trees, and broken streetlights. AI-powered image recognition enables quick reporting by classifying and prioritizing citizen reports based on urgency and severity, which are further verified through public voting and IoT data. This combined approach supports real-time risk assessment, ensuring swift responses to critical incidents. Integrated with navigation apps, the system delivers dynamic hazard alerts, while a structured report list with status updates promotes transparency and community engagement. Governments can track city-wide data through a dashboard that provides insights on issue types, report volumes, graphical analysis, and heatmaps. By automating issue detection and response, The Watcher strengthens urban resilience, optimizes resource allocation, and improves traffic flow.

## Showcases
| Key Features  | Demonstration |
| :---:  | :---: |
| Homepage | <img src="https://github.com/user-attachments/assets/06a0db44-fb09-4de7-a748-7de8d93e915e" height="300"> |
| Multi-Source Data Collection and AI-Powered Urban Monitoring ||
| Real-Time Alerts ||
| AI-Driven Risk Assessment and Crowdsourcing Prioritization ||
| Issue Tracking and Community Engagement ||
| Dashboard ||

## Features

### 1. Multi-Source Data Collection and AI-Powered Urban Monitoring
The Watcher integrates data from citizen reports, CCTV, and IoT sensors to monitor city conditions in real time. AI-powered image recognition automatically categorizes reported issues, while traffic slowdown detection prompts users to submit reports for better accuracy. Government-owned CCTV footage is also analyzed for comprehensive infrastructure monitoring. The system provides real-time updates, enabling authorities to take proactive maintenance actions.

### 2. Real-Time Alerts
The Watcher provides hands-free voice alerts for drivers about road hazards such as potholes, fallen trees, and blocked street signs in Driving Mode, while Walking Mode alerts pedestrians to safety risks like broken streetlights and damaged sidewalks. By seamlessly integrating with Google Maps and Waze, it ensures that users receive timely, context-aware notifications without disrupting their activity.
![Screenshot_1742965530](https://github.com/user-attachments/assets/5f53a582-da7d-469a-b10a-426c7a7cf731)

### 3. AI-Driven Risk Assessment and Crowdsourcing Prioritization
By using AI, reported issues are classified and prioritized based on severity, urgency, and potential hazards. A public voting system allows users to validate reports by upvoting, downvoting, or adding details, ensuring more accurate assessments. This approach helps authorities allocate resources efficiently, address critical problems first, and transition from reactive to proactive urban management.

### 4. Issue Tracking and Community Engagement
A transparent tracking system updates issue statuses like "Reported," "In Progress," and "Completed," ensuring visibility and accountability. Citizens verify resolutions through public voting, improving accuracy and trust. To boost engagement, a reward system allows users to earn points redeemable for vouchers, encouraging active participation. Meanwhile, the government dashboard tracks total, pending, and resolved cases, highlights frequent issues on a heat map, analyzes daily trends in a weekly report, and sends instant alerts for critical incidents, enabling better decision-making.

## Get Started
Follow these steps to set up and run The Watcher.

### 1. Prerequisites
Before proceeding, ensure you have the following installed:  
✅ Flutter   
✅ Firebase CLI   
✅ Visual Studio Code/ Android Studio  

### 2. Clone the Repository
Clone the project from your GitHub.
```
git clone https://github.com/yourusername/yourrepository.git](https://github.com/junhubdotcom/vhack_steadypunpipi.git
cd vhack_steadypunpipi
```

### 3. Set Up the Flutter Frontend
#### Install dependencies
```
flutter pub get
```

### 4. Running the Full System
Once everything is set up:

#### Run the Mobile App (User Application)
To launch the mobile app on an emulator or physical device:
```
flutter run -t lib/main.dart
```
#### Run the Web Dashboard (Government Dashboard)
To launch the web dashboard in Chrome:
```
flutter run -t lib/govDashboard.dart -d chrome
```
🔹 Note: If you want to run both at the same time, open two separate terminals and run each command in a different terminal.

