import 'package:alfamon/common/models/expence.dart';
import 'package:hive/hive.dart';

// class ExpenceDatabaseHelper {
//   static Future<void> initDatabase() async {
//     final box = await Hive.openBox('expenceBox');
//     if (box.isEmpty) {
//       await box.put(
//           'expence',
//           Expence(
//             price: '',
//             currency: '',
//             date: '',
//             icon: '',
//             color: '',
//             title: '',
//             type: TypeBalance.expence,
//           ));
//     }
//   }
// }

class ExpenceAdapter extends TypeAdapter<Expence> {
  @override
  final int typeId = 1; // Unique id for the adapter

  @override
  Expence read(BinaryReader reader) {
    return Expence(
      id: reader.readInt(),
      price: reader.readString(),
      currency: reader.readString(),
      date: reader.readString(),
      icon: reader.readString(),
      color: reader.readString(),
      title: reader.readString(),
      type: reader.readString() == 'TypeBalance.income'
          ? TypeBalance.income
          : TypeBalance.expence,
    );
  }

  @override
  void write(BinaryWriter writer, Expence obj) {
    writer.writeInt(obj.id ?? 0);
    writer.writeString(obj.price);
    writer.writeString(obj.currency);
    writer.writeString(obj.date);
    writer.writeString(obj.icon);
    writer.writeString(obj.color);
    writer.writeString(obj.title);
    writer.writeString(obj.type.toString());
  }
}
