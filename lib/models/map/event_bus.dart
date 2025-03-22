// event_bus.dart
import 'dart:async';

class EventBus {
  // Singleton instance
  static final EventBus _instance = EventBus._internal();
  factory EventBus() => _instance;
  EventBus._internal();

  // StreamController to manage the stream
  final StreamController<int> _controller = StreamController<int>.broadcast();

  // Getter for the stream
  Stream<int> get stream => _controller.stream;

  // Method to add a prompt to the stream
  void sendPrompt(int prompt) {
    _controller.add(prompt);
  }

  // Close the stream when done
  void dispose() {
    _controller.close();
  }
}