import 'dart:convert';

import 'package:flutter/material.dart';

List<JobDetailsModel> jobDetailsModelFromJson(String str) =>
    List<JobDetailsModel>.from(json.decode(str).map((x) => JobDetailsModel.fromJson(x)));

String jobDetailsModelToJson(List<JobDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobDetailsModel {
  String customer;
  String subject;
  String currency;
  double amount;
  int total_experience;
  DateTime creation;
  String description;
  String custom_recruiter_contact;

  JobDetailsModel({
    required this.customer,
    required this.subject,
    required this.currency,
    required this.amount,
    required this.total_experience,
    required this.creation,
    required this.description,
    required this.custom_recruiter_contact,

  });

  factory JobDetailsModel.fromJson(Map<String, dynamic> json) => JobDetailsModel(
        customer: json["customer"],
        subject: json["subject"],
        currency: json["currency"],
        amount: json["amount"],
        total_experience: json["total_experience"],
        creation: DateTime.parse(json["creation"]),
        description:json['description'],
        custom_recruiter_contact: json['custom_recruiter_contact'] ?? ''

      );

  Map<String, dynamic> toJson() => {
        "customer": customer,
        "subject": subject,
        "currency": currency,
        "amount": amount,
        "total_experience": total_experience,
        "creation":"${creation.year.toString().padLeft(4, '0')}-${creation.month.toString().padLeft(2, '0')}-${creation.day.toString().padLeft(2, '0')}",
        "description":description,
        "custom_recruiter_contact": custom_recruiter_contact.isNotEmpty ? custom_recruiter_contact : '',
      };
}
