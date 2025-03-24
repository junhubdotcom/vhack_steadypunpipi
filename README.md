# Overview

Road Protector leverages IoT, crowdsourcing, and AI-powered real-time data analytics to enhance public administration and urban mobility. IoT sensors, CCTV, and dashcams continuously monitor city conditions, detecting issues such as potholes, fallen trees, road obstructions, and accidents. AI-powered image recognition enables quick reporting by classifying and prioritizing citizen reports based on urgency and severity, which are further verified through public voting and IoT data. This combined approach supports real-time risk assessment, ensuring swift responses to critical incidents. Integrated with navigation apps, the system delivers dynamic hazard alerts, while a structured report list with status updates promotes transparency and community engagement. Governments can track city-wide data through a dashboard that provides insights on issue types, report volumes, graphical analysis, and heatmaps. By automating issue detection and response, Road Protector strengthens urban resilience, optimizes resource allocation, and improves traffic flow.

## Features

### 1. Multi-Source Data Collection and AI-Powered Urban Monitoring
Road Protector integrates data from citizen reports, CCTV, dashcams, and IoT sensors to monitor city conditions in real-time. AI-powered image recognition automatically categorizes reported issues, while traffic slowdown detection prompts users to submit reports for better accuracy. Government-owned CCTV footage is also analyzed for comprehensive infrastructure monitoring. The system provides real-time updates, predictive analytics, and heatmaps, enabling authorities to take proactive maintenance actions.

### 2. AI-Driven Risk Assessment and Crowdsourcing Prioritization
By using AI, reported issues are classified and prioritized based on severity, urgency, and potential hazards. A public voting system allows users to validate reports by upvoting, downvoting, or adding details, ensuring more accurate assessments. This approach helps authorities allocate resources efficiently, address critical problems first, and transition from reactive to proactive urban management.

### 3. Real-Time Alerts
The system provides hands-free voice alerts for drivers about road hazards such as potholes, road closures, and accidents in Driving Mode, while Walking Mode alerts pedestrians to safety risks like crime-prone areas and environmental hazards. By seamlessly integrating with Google Maps and Waze, it ensures users receive timely, context-aware notifications without disrupting their activity.

### 4. Issue Tracking and Community Engagement
A transparent issue tracking system updates statuses, including "Reported," "Under Review," "In Progress," and "Completed," ensuring accountability and visibility. The public voting system enables users to verify resolutions, enhancing trust and accuracy. To drive engagement, the platform incorporates gamification elements like badges and rewards, encouraging citizens to actively report issues and contribute to a safer, more efficient, and sustainable urban environment.

## Get Started
Follow these steps to set up and run the Road Protector system for development and testing.

### 1. Prerequisites
Before proceeding, ensure you have the following installed:
✅ Flutter   
✅ Firebase CLI   
✅ Visual Studio Code/ Android Studio  

### 2. Clone the Repository
Clone the project from your GitHub.
```
git clone https://github.com/yourusername/yourrepository.git
cd yourrepository
```

### 3. Set Up the Flutter Frontend
#### Install dependencies
```
flutter pub get
```
#### Run the app
```
flutter run
```

### 4. Configure Firebase
1. Create a Firebase Project in Firebase Console.
2. Enable Firebase Authentication and Cloud Firestore.
3. Download the google-services.json (Android) or GoogleService-Info.plist (iOS) and place them in the mobile_app/android/app/ or mobile_app/ios/Runner/ directory.
4. Run Firebase setup command:
```
firebase login
firebase init
```

### 5. Backend API and AI Integration
### Google Cloud Vision API, Gemini AI & Google Maps Setup
1. Enable APIs in Google Cloud Console
2. Generate API Keys and Add to Configuration File
```
GOOGLE_VISION_API_KEY=your_api_key
GEMINI_AI_KEY=your_api_key
GOOGLE_MAPS_API_KEY=your_api_key
```

