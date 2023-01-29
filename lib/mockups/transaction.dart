import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class Transaction {
  final num amount;
  final String? category;
  final String currency;
  final String id;
  final String name;
  final String? note;
  final String? repeatId;
  final Timestamp time;
  final Timestamp? formerTime;

  Transaction({
    required this.amount,
    this.category,
    required this.currency,
    String? id,
    required this.name,
    this.note,
    this.repeatId,
    required this.time,
    this.formerTime,
  }) : id = id ?? const Uuid().v4();
}
