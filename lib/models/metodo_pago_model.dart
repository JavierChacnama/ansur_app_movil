enum MetodoPagoModel {
  cash,
  credit,
  debit;

  factory MetodoPagoModel.byName(String name) {
    for (var value in MetodoPagoModel.values) {
      if (value.name == name) return value;
    }
    throw ArgumentError.value(name, "name", "No enum value with that name");
  }
}