

# **Work-Life Tracker Documentation**

## **Overview**

The **Work Life Tracker** app is designed to help users monitor their work hours and break times. It includes features for tracking time, managing work and pause periods, and providing productivity suggestions based on usage patterns. The application uses a clear and structured file hierarchy to keep the code modular, making it easy to maintain and scale.

---

## **File Structure**

The file structure of the **Work Life Tracker** app is organized as follows:

```
features/
│
├── suggestion/
│   ├── services/
│   │   └── suggestionsList.dart      # Handles predefined suggestions and helper functions for productivity advice.
│   └── ui/
│       └── suggestion.dart           # UI component for displaying work suggestions.
│
├── tracker/
│   ├── functions/
│   │   └── formatTimer.dart          # Helper function to format time for the timer display.
│   └── ui/
│       ├── _StatusSnackBar.dart      # Custom SnackBar for status messages.
│       ├── ActionButton.dart         # Reusable button widget for timer actions.
│       └── Tracker.dart              # Main tracker UI with timer and control buttons.
│
└── main.dart                         # Entry point of the app, initializing the UI and navigation.
```

---

## **Core Components and Flow**

### **1. TrackerPage (Main Time-Tracking Interface)**

Located in: `features/tracker/ui/Tracker.dart`

The **TrackerPage** is the core of the app and the main interface for time tracking. It provides users with options to:
- **Start**, **Pause**, **Reset**, and **Restart** the timer.
- Input work hours to initialize a countdown timer.
- Display the current time remaining with color-coded statuses:
  - **Black**: Initial status.
  - **Green**: Timer is running.
  - **Gray**: Timer is paused.
  - **Red**: Timer has finished.

The `TrackerPage` uses a `TimerController` to manage and listen to timer status updates, and it displays visual feedback through a `StatusSnackBar` to notify the user of changes in timer status.

#### **Interaction Flow**:
- **User inputs** the desired work hours and presses "Start."
- The **timer countdown** begins, with options to pause, reset, or restart.
- User actions and changes in the timer status trigger visual feedback through the `StatusSnackBar` and color-coded display.

### **2. SuggestionPage (Productivity Suggestions Interface)**

Located in: `features/suggestion/ui/suggestion.dart`

The **SuggestionPage** offers work-life balance tips based on user behavior:
- Displays a **suggestion** for productivity, such as taking breaks or maintaining a focus period, chosen from a predefined list.
- Shows **summary cards** that track:
  - **Total hours worked** (tracked by `WorkerHours`).
  - **Total pauses taken** (tracked by `PauseNumber`).
  
Each card is color-coded and designed to give quick insights into the user’s work patterns. Suggestions are dynamically generated based on work hours and the number of pauses, providing customized advice to promote healthy work habits.

#### **Interaction Flow**:
- When the **SuggestionPage** is opened, it selects an appropriate suggestion based on the `WorkerHours` and `PauseNumber`.
- Displays relevant productivity advice and highlights the user’s work and pause statistics in well-styled info cards.

### **3. Supporting Components**

- **ActionButton** (`features/tracker/ui/ActionButton.dart`): A reusable button component used throughout the app, especially in `TrackerPage`, to perform actions like Start, Pause, Reset, and Restart.
  
- **StatusSnackBar** (`features/tracker/ui/_StatusSnackBar.dart`): A custom `SnackBar` widget used in `TrackerPage` to show brief status updates, such as "Timer Started" or "Timer Paused."

- **suggestionsList** (`features/suggestion/services/suggestionsList.dart`): Stores a map of predefined suggestions and utility methods like `PauseNumberMethod` and `WorkerHoursMethod` to determine which suggestion to show based on the user's activity data.

- **formatTimer** (`features/tracker/functions/formatTimer.dart`): A helper function that formats time for display, ensuring that remaining time is shown in a readable format on the `TrackerPage`.

---

## **Application Flow**

1. **Initialization**: The app launches from `main.dart`, which sets up the initial UI.
2. **Tracking Work Hours**:
   - Users navigate to `TrackerPage` to input work hours and start the timer.
   - As users interact with the timer, real-time feedback is displayed on-screen with changing colors, and `StatusSnackBar` messages appear for status updates.
   - Work hours and pauses are tracked with global counters, `WorkerHours` and `PauseNumber`.
3. **Viewing Suggestions**:
   - On `SuggestionPage`, the app generates suggestions based on usage data.
   - Info cards display accumulated work hours and pauses, offering personalized productivity advice to promote balanced work habits.
4. **User Feedback and Guidance**:
   - The app provides dynamic suggestions and feedback, helping users maintain productive yet healthy work routines.

---

## Images Design 

![image](https://github.com/user-attachments/assets/fdf31a44-6e35-44ce-b436-528fcb76d570)

![image](https://github.com/user-attachments/assets/96c53483-47f5-42c7-ad4a-a5ee7fb8e1c1)




## **Summary**

The **Work Life Tracker** app is a tool for monitoring productivity and promoting balanced work habits. With features like the `TrackerPage` for time tracking and `SuggestionPage` for personalized productivity tips, the app combines utility with insights to encourage users toward a healthier work-life balance. The modular structure, use of reusable components, and focus on user experience make it a well-organized and maintainable application.
