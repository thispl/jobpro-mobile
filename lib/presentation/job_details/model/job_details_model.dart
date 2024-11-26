import 'dart:convert';

List<JobDetailsModel> jobDetailsModelFromJson(String str) =>
    List<JobDetailsModel>.from(json.decode(str).map((x) => JobDetailsModel.fromJson(x)));

String jobDetailsModelToJson(List<JobDetailsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JobDetailsModel {
  String name;
  String customer;
  String subject;
  String currency;
  double amount;
  String custom_job_category;
  int minimum_experience;
  DateTime creation;
  String description;
  String custom_recruiter_contact;
  String territory;
  String custom_country_flag;
  String salary_type;
  String working_days;
  String transportation;
  String contract_period_year;
  String food;
  String accommodation;
  String over_time;
  DateTime? exp_end_date;
  int custom_is_customer_confidential;
  String qualification_type;
  String specialization;
  String category;
  int maximum_experience;
  String mode_of_interview;
  String transportation_allowance;
  String food_allowance;
  String custom_allocated_on;
  String custom_allocated_to;  // Nullable Date field
  
  JobDetailsModel({
    required this.name,
    required this.customer,
    required this.subject,
    required this.currency,
    required this.amount,
    required this.custom_job_category,
    required this.minimum_experience,
    required this.creation,
    required this.description,
    required this.custom_recruiter_contact,
    required this.territory,
    required this.custom_country_flag,
    required this.salary_type,
    required this.working_days,
    required this.transportation,
    required this.contract_period_year,
    required this.food,
    required this.accommodation,
    required this.over_time,
    this.exp_end_date, 
    required this.custom_is_customer_confidential,
    required this.qualification_type,
    required this.specialization,
    required this.category,
    required this.maximum_experience,
    required this.mode_of_interview,
    required this.transportation_allowance,
    required this.food_allowance,

    required this.custom_allocated_on,
    required this.custom_allocated_to
  });

  // Factory method to convert from JSON
  factory JobDetailsModel.fromJson(Map<String, dynamic> json) => JobDetailsModel(
        name: json['name'],
        customer: (json["customer"] != null && json["customer"].isNotEmpty) ? json["customer"] : '',
        subject: json["subject"],
        currency: json["currency"].isNotEmpty ? json["currency"] : '',
        amount: json["amount"].toDouble(),
        custom_job_category: (json["custom_job_category"] != null && json["custom_job_category"].isNotEmpty) ? json["custom_job_category"] : '',
        minimum_experience: json["minimum_experience"],
        creation: DateTime.parse(json["creation"]),
        description: json["description"],
        custom_recruiter_contact: json['custom_recruiter_contact']?.isNotEmpty == true
            ? json['custom_recruiter_contact']
            : '7305428777', 
        territory: (json["territory"] != null && json["territory"].isNotEmpty) ? json["territory"] : '',
        custom_country_flag: (json["custom_country_flag"] != null && json["custom_country_flag"].isNotEmpty) ? json["custom_country_flag"] : '',
        salary_type: (json["salary_type"] != null && json["salary_type"].isNotEmpty) ? json["salary_type"] : '',
        working_days: (json["working_days"] != null && json["working_days"].isNotEmpty) ? json["working_days"] : '',
        transportation: (json["transportation"] != null && json["transportation"].isNotEmpty) ? json["transportation"] : '',
        contract_period_year: (json["contract_period_year"] != null && json["contract_period_year"].isNotEmpty) ? json["contract_period_year"] : '',
        food: (json["food"] != null && json["food"].isNotEmpty) ? json["food"] : '',
        accommodation: (json["accommodation"] != null && json["accommodation"].isNotEmpty) ? json["accommodation"] : '',
        over_time: (json["over_time"] != null && json["over_time"].isNotEmpty) ? json["over_time"] : '',
        exp_end_date: json['exp_end_date'] != null ? DateTime.parse(json['exp_end_date']) : null, // Handle null or empty date
        custom_is_customer_confidential:json["custom_is_customer_confidential"] ,
        // salary_type: (json["salary_type"] != null && json["salary_type"].isNotEmpty) ? json["salary_type"] : '',
        qualification_type: (json["qualification_type"] != null && json["qualification_type"].isNotEmpty) ? json["qualification_type"] : '',
        specialization: (json["specialization"] != null && json["specialization"].isNotEmpty) ? json["specialization"] : '',
        category: (json["category"] != null && json["category"].isNotEmpty) ? json["category"] : '',
        mode_of_interview: (json["mode_of_interview"] != null && json["mode_of_interview"].isNotEmpty) ? json["mode_of_interview"] : '',
        maximum_experience: json["maximum_experience"],
        transportation_allowance: (json["transportation_allowance"] != null && json["transportation_allowance"].isNotEmpty) ? json["transportation_allowance"] : '',
        food_allowance: (json["food_allowance"] != null && json["food_allowance"].isNotEmpty) ? json["food_allowance"] : '',
        // custom_allocated_on: (json["custom_allocated_on"] != null && json["custom_allocated_on"].isNotEmpty) ? json["custom_allocated_on"] : '',
        custom_allocated_on: (json["custom_allocated_on"] != null && json["custom_allocated_on"].isNotEmpty) ? json["custom_allocated_on"] : '',
        custom_allocated_to: (json["custom_allocated_to"] != null && json["custom_allocated_to"].isNotEmpty) ? json["custom_allocated_to"] : '',
      );

  // Method to convert to JSON
  Map<String, dynamic> toJson() => {
        "name": name,
        "customer": customer.isNotEmpty ? customer : '',
        "subject": subject,
        "currency": currency.isNotEmpty ? currency : '',
        "amount": amount,
        "custom_job_category": custom_job_category.isNotEmpty ? custom_job_category : '',
        "minimum_experience": minimum_experience,
        "creation": "${creation.year.toString().padLeft(4, '0')}-${creation.month.toString().padLeft(2, '0')}-${creation.day.toString().padLeft(2, '0')}",
        "description": description,
        "custom_recruiter_contact": custom_recruiter_contact.isNotEmpty ? custom_recruiter_contact : '7305428777',
        "territory": territory.isNotEmpty ? territory : '',
        "custom_country_flag": custom_country_flag.isNotEmpty ? custom_country_flag : '',
        "salary_type": salary_type.isNotEmpty ? salary_type : '',
        "working_days": working_days.isNotEmpty ? working_days : '',
        "transportation": transportation.isNotEmpty ? transportation : '',
        "contract_period_year": contract_period_year.isNotEmpty ? contract_period_year : '',
        "food": food.isNotEmpty ? food : '',
        "accommodation": accommodation.isNotEmpty ? accommodation : '',
        "over_time": over_time.isNotEmpty ? over_time : '',
        "exp_end_date": exp_end_date != null
            ? "${exp_end_date!.year.toString().padLeft(4, '0')}-${exp_end_date!.month.toString().padLeft(2, '0')}-${exp_end_date!.day.toString().padLeft(2, '0')}"
            : '', // Return empty string if null
        "custom_is_customer_confidential": custom_is_customer_confidential,
        "qualification_type": qualification_type.isNotEmpty ? qualification_type : '',
        "specialization": specialization.isNotEmpty ? specialization : '',
        "category": category.isNotEmpty ? category : '',
        "mode_of_interview": mode_of_interview.isNotEmpty ? mode_of_interview : '',
        "maximum_experience": maximum_experience,
        "transportation_allowance": transportation_allowance.isNotEmpty ? transportation_allowance : '',
        "food_allowance": food_allowance.isNotEmpty ? food_allowance : '',
        "custom_allocated_on": custom_allocated_on.isNotEmpty ? custom_allocated_on : '',
        "custom_allocated_to": custom_allocated_to.isNotEmpty ? custom_allocated_to : 'hr@groupteampro.com',
      };
}
