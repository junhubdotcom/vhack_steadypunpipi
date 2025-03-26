# Overview

The Watcher is a real-time urban monitoring system that integrates IoT, crowdsourcing, and AI-driven analytics to enhance public administration and urban mobility. IoT sensors and CCTV continuously monitor city conditions, detecting issues like potholes, fallen trees, and broken streetlights, while AI-powered image recognition classifies and prioritizes citizen reports based on urgency and severity, verified through public voting and IoT data. This enables real-time risk assessment and swift responses to critical incidents. Integrated with navigation apps, The Watcher delivers dynamic hazard alerts, while a structured report list with live status updates ensures transparency and community engagement. Governments can monitor city-wide trends via a dashboard that provides insights on issue types, report volumes, graphical analysis, and heatmaps. By automating issue detection and response, The Watcher strengthens urban resilience, optimizes resource allocation, and improves traffic flow.

## Showcases
| Key Features  | Demonstration |
| :---:  | :---: |
| Homepage | <img src="https://github.com/user-attachments/assets/06a0db44-fb09-4de7-a748-7de8d93e915e" height="300"> |
| Multi-Source Data Collection and AI-Powered Urban Monitoring | <img src="https://github.com/user-attachments/assets/71898064-93d9-4f12-ab54-ed41d2733455" height="300"> <img src="https://github.com/user-attachments/assets/66d0b8ee-8a53-4cc6-9d34-cb32b6304539" height="300"> <img src="https://github.com/user-attachments/assets/4877a147-b68c-473e-9757-c84bf767a8c1" height="300"> |
| Real-Time Alerts | <img src="https://github.com/user-attachments/assets/b07ed53d-f0f0-42ff-a7ba-40667fc6dd11" height="300"> <img src="https://github.com/user-attachments/assets/f2f9e95f-b253-4252-b0e8-7e0dfaad42fa" height="300"> |
| AI-Driven Risk Assessment and Crowdsourcing Prioritization | <img src="https://github.com/user-attachments/assets/4877a147-b68c-473e-9757-c84bf767a8c1" height="300"> <img src="https://github.com/user-attachments/assets/0807e95f-1443-4292-a662-ad5d6703f541" height="300"> |
| Issue Tracking and Community Engagement | <img src="https://github.com/user-attachments/assets/0807e95f-1443-4292-a662-ad5d6703f541" height="300"> <img src="https://github.com/user-attachments/assets/caa39ca5-6eb9-48f9-a844-d5df0ff70efa" height="300"> <img src="https://github.com/user-attachments/assets/d9697aa0-bb7e-47ff-b0d5-5734a588de10" height="300"> |
| Dashboard | <img src="https://github.com/user-attachments/assets/2e7f1ff6-37d1-442a-ba00-97b1792b8014" height="300"> <img src="https://github.com/user-attachments/assets/83b06522-cba1-40f1-9864-6fe8fa747380" height="300"> |

## Features

### 1. Multi-Source Data Collection and AI-Powered Urban Monitoring
The Watcher integrates data from citizen reports, CCTV, and IoT sensors to monitor city conditions in real time. AI-powered image recognition automatically categorizes reported issues, while traffic slowdown detection prompts users to submit reports for better accuracy. Government-owned CCTV footage is also analyzed for comprehensive infrastructure monitoring. The system provides real-time updates, enabling authorities to take proactive maintenance actions.

### 2. Real-Time Alerts
The Watcher provides hands-free voice alerts for drivers about road hazards such as potholes, fallen trees, and blocked street signs in Driving Mode, while Walking Mode alerts pedestrians to safety risks like broken streetlights and damaged sidewalks. By seamlessly integrating with Google Maps and Waze, it ensures that users receive timely, context-aware notifications without disrupting their activity.

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

