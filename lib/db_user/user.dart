import 'package:floor/floor.dart';
import 'package:flutter/material.dart';

@entity
class User {
  @primaryKey
  final int? id;

  final String nama;

  final String email;

  final String password;

  User({
    this.id,
    required this.nama,
    required this.email,
    required this.password,
  });
}
