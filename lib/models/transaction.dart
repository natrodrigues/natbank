import 'package:natbank/models/contact.dart';

class Transaction {
  final double value;
  final Contact contact;
  final String id;

  Transaction(
    this.id,
    this.value,
    this.contact,
  ) : assert(value > 0);

  Transaction.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        value = json['value'],
        contact = Contact.fromJson(json['contact']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'value': value,
        'contact': contact.toJson(),
      };

  @override
  String toString() {
    return 'Transaction{id: $id, value: $value, contact: $contact}';
  }

  @override
  int get hashCode => value.hashCode ^ contact.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Transaction &&
          runtimeType == other.runtimeType &&
          value == other.value &&
          contact == other.contact;
}
