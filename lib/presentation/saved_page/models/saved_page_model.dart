import 'dart:convert';
import 'package:get/get.dart';

List<SavedPageModel> savedPageModelFromJson(String str) =>
    List<SavedPageModel>.from(json.decode(str).map((x) => SavedPageModel.fromJson(x)));

String savedPageModelToJson(List<SavedPageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SavedPageModel {
  // String name;
  String customer;
  String subject;
  String currency;
  double amount;
  // int total_experience;
  // DateTime creation;
  // String description;
  // String custom_recruiter_contact;
  // final String id;
  

  SavedPageModel({
    // required this.name,
    required this.customer,
    required this.subject,
    required this.currency,
    required this.amount,
    // required this.total_experience,
    // required this.creation,
    // required this.description,
    // required this.custom_recruiter_contact,
    // required this.id
  });

  factory SavedPageModel.fromJson(Map<String, dynamic> json) => SavedPageModel(
        // name: json['name'],
        customer: json["customer"].isNotEmpty == true ? json["customer"]:'',
        subject: json["subject"],
        currency: json["currency"].isNotEmpty == true ? json["currency"]:'',
        amount: json["amount"].toDouble(),
        // total_experience: json["total_experience"],
        // creation: DateTime.parse(json["creation"]),
        // description: json["description"],
        // custom_recruiter_contact: json['custom_recruiter_contact']?.isNotEmpty == true
        //     ? json['custom_recruiter_contact']
        //     : '7305428777', 
        // id: json['name'],// Default if null or empty
      );

  Map<String, dynamic> toJson() => {
        // "name":name,
        "customer": customer.isNotEmpty? currency:'',
        "subject": subject,
        "currency": currency.isNotEmpty? currency:'',
        "amount": amount,
        // "total_experience": total_experience,
        // "creation": "${creation.year.toString().padLeft(4, '0')}-${creation.month.toString().padLeft(2, '0')}-${creation.day.toString().padLeft(2, '0')}",
        // "description": description,
        // "custom_recruiter_contact": custom_recruiter_contact.isNotEmpty
        //     ? custom_recruiter_contact
        //     : '7305428777', 
        // 'id':id, // Ensure default if empty
      };
}
