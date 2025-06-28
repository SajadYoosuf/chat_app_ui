class CallModel {
  final String name;
  final String type; // Incoming, Outgoing, Missed
  final String callType; // audio, video
  final String time;

  CallModel(this.name, this.type, this.callType, this.time);
}
