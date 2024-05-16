import 'package:hive/hive.dart';

import 'package:pp_14_copy/common/models/balance.dart';

class BalanceAdapter extends TypeAdapter<Balance> {
  @override
  final int typeId = 0; // Unique id for the adapter

  @override
  Balance read(BinaryReader reader) {
    return Balance(
      id: reader.readInt(),
      price: reader.readDouble(),
      currency: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, Balance obj) {
    writer.writeInt(obj.id ?? 0);
    writer.writeDouble(obj.price);
    writer.writeString(obj.currency);
  }
}
