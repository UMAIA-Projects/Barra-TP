enum TrainType { ap, ic, ir, r }

extension TrainTypeExtension on TrainType {
  String get label {
    switch (this) {
      case TrainType.ap:
        return 'AP';
      case TrainType.ic:
        return 'IC';
      case TrainType.ir:
        return 'IR';
      case TrainType.r:
        return 'R';
    }
  }
}

class TrainLine {
  final String id;
  final TrainType type;
  final String name;
  final String color;

  TrainLine({
    required this.id,
    required this.type,
    required this.name,
    required this.color,
  });
}
