
class PrinterFlags {
  bool cancelling;
  bool closedOrError;
  bool error;
  bool finishing;
  bool operational;
  bool paused;
  bool pausing;
  bool printing;
  bool ready;
  bool resuming;
  bool sdReady;

  PrinterFlags(
      {this.cancelling,
      this.closedOrError,
      this.error,
      this.finishing,
      this.operational,
      this.paused,
      this.pausing,
      this.printing,
      this.ready,
      this.resuming,
      this.sdReady});

  PrinterFlags.fromJson(Map<String, dynamic> json) {
    cancelling = json['state']['flags']['cancelling'];
    closedOrError = json['state']['flags']['closedOrError'];
    error = json['state']['flags']['error'];
    finishing = json['state']['flags']['finishing'];
    operational = json['state']['flags']['operational'];
    paused = json['state']['flags']['paused'];
    pausing = json['state']['flags']['pausing'];
    printing = json['state']['flags']['printing'];
    ready = json['state']['flags']['ready'];
    resuming = json['state']['flags']['resuming'];
    sdReady = json['state']['flags']['sdReady'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cancelling'] = this.cancelling;
    data['closedOrError'] = this.closedOrError;
    data['error'] = this.error;
    data['finishing'] = this.finishing;
    data['operational'] = this.operational;
    data['paused'] = this.paused;
    data['pausing'] = this.pausing;
    data['printing'] = this.printing;
    data['ready'] = this.ready;
    data['resuming'] = this.resuming;
    data['sdReady'] = this.sdReady;
    return data;
  }
}

