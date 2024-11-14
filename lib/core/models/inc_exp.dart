import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 0)
class IncExp {
  IncExp({
    required this.id,
    required this.amount,
    required this.title,
    required this.category,
    required this.isIncome,
  });

  @HiveField(0)
  final int id;
  @HiveField(1)
  int amount;
  @HiveField(2)
  String title;
  @HiveField(3)
  String category;
  @HiveField(3)
  bool isIncome;
}

class IncExpAdapter extends TypeAdapter<IncExp> {
  @override
  final typeId = 0;

  @override
  IncExp read(BinaryReader reader) {
    return IncExp(
      id: reader.read(),
      amount: reader.read(),
      title: reader.read(),
      category: reader.read(),
      isIncome: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, IncExp obj) {
    writer.write(obj.id);
    writer.write(obj.amount);
    writer.write(obj.title);
    writer.write(obj.category);
    writer.write(obj.isIncome);
  }
}
