import 'dart:convert';

List<ProfilePageModel> profilePageModelFromJson(String str) =>
    List<ProfilePageModel>.from(json.decode(str).map((x) => ProfilePageModel.fromJson(x)));

String profilePageModelToJson(List<ProfilePageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProfilePageModel {
  String name;
  String interest;
  String full_name;
  String bio;

  
  ProfilePageModel({
    required this.name,
    required this.interest,
    required this.full_name,
    required this.bio,
  });

  // Factory method to convert from JSON
  factory ProfilePageModel.fromJson(Map<String, dynamic> json) => ProfilePageModel(
        name: json['name'],
        interest: (json["interest"]!= null && json["interest"].isNotEmpty) ? json["interest"] : '',
        full_name: (json["full_name"] != null && json["full_name"].isNotEmpty) ? json["full_name"] : '',
        bio: (json["bio"] != null && json["bio"].isNotEmpty) ? json["bio"] : '',
      );

  // Method to convert to JSON
  Map<String, dynamic> toJson() => {
        "name": name,
        "interest": interest.isNotEmpty ? interest : '',
        "full_name": full_name.isNotEmpty ? full_name : '',
        "bio": bio.isNotEmpty ? bio : '',
        
      };
}


List<CandModel> candModelFromJson(String str) =>
    List<CandModel>.from(json.decode(str).map((x) => CandModel.fromJson(x)));

String candModelToJson(List<CandModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CandModel {
  String highest_degree;
  int india_experience;
  int overseas_experience;
  int total_experience;
  String current_employer;
  String specialization;
  String year_of_passing;
  String position;
  // int minimum_experience;
  // DateTime creation;
  // 
  // String custom_recruiter_contact;
  
  String updated__masked_cv;
  
  // String working_days;
  // String transportation;
  // String contract_period_year;
  // String food;
  // String accommodation;
  // String over_time;
  // DateTime? exp_end_date;
  // int custom_is_customer_confidential;
  // String qualification_type;
  // String specialization;
  // String category;
  // int maximum_experience;
  // String mode_of_interview;
  // String transportation_allowance;
  // String food_allowance;
  // String salary_type;  // Nullable Date field
  
  CandModel({
    required this.highest_degree,
    required this.india_experience,
    required this.overseas_experience,
    required this.total_experience,
    required this.current_employer,
    required this.specialization,
    required this.year_of_passing,
    required this.position,
    required this.updated__masked_cv,
    // required this.creation,
    // required this.description,
    // required this.custom_recruiter_contact,
    
    // required this.custom_country_flag,
    
    // required this.working_days,
    // required this.transportation,
    // required this.contract_period_year,
    // required this.food,
    // required this.accommodation,
    // required this.over_time,
    // this.exp_end_date, 
    // required this.custom_is_customer_confidential,
    // required this.qualification_type,
    // required this.specialization,
    // required this.category,
    // required this.maximum_experience,
    // required this.mode_of_interview,
    // required this.transportation_allowance,
    // required this.food_allowance,

    // required this.salary_type,// Make it nullable
  });

  // Factory method to convert from JSON
  factory CandModel.fromJson(Map<String, dynamic> json) => CandModel(
        highest_degree: (json["highest_degree"] != null && json["highest_degree"].isNotEmpty) ? json["highest_degree"] : '',
        india_experience: json["india_experience"],
        overseas_experience: json['overseas_experience'],
        total_experience: json["total_experience"],
        current_employer: (json["current_employer"] != null && json["current_employer"].isNotEmpty) ? json["current_employer"] : '',
        specialization: (json["specialization"] != null && json["specialization"].isNotEmpty) ? json["specialization"] : '',
        year_of_passing: (json["year_of_passing"] != null && json["year_of_passing"].isNotEmpty) ? json["year_of_passing"] : '',
        position: (json["position"] != null && json["position"].isNotEmpty) ? json["position"] : '',
        
        // minimum_experience: json["minimum_experience"],
        // creation: DateTime.parse(json["creation"]),
        // description: json["description"],
        // custom_recruiter_contact: json['custom_recruiter_contact']?.isNotEmpty == true
        //     ? json['custom_recruiter_contact']
        //     : '7305428777', 
        // working_days: (json["working_days"] != null && json["working_days"].isNotEmpty) ? json["working_days"] : '',
        // transportation: (json["transportation"] != null && json["transportation"].isNotEmpty) ? json["transportation"] : '',
        // contract_period_year: (json["contract_period_year"] != null && json["contract_period_year"].isNotEmpty) ? json["contract_period_year"] : '',
        // food: (json["food"] != null && json["food"].isNotEmpty) ? json["food"] : '',
        // accommodation: (json["accommodation"] != null && json["accommodation"].isNotEmpty) ? json["accommodation"] : '',
        // over_time: (json["over_time"] != null && json["over_time"].isNotEmpty) ? json["over_time"] : '',
        // exp_end_date: json['exp_end_date'] != null ? DateTime.parse(json['exp_end_date']) : null, // Handle null or empty date
        // custom_is_customer_confidential:json["custom_is_customer_confidential"] ,
        // salary_type: (json["salary_type"] != null && json["salary_type"].isNotEmpty) ? json["salary_type"] : '',
        // qualification_type: (json["qualification_type"] != null && json["qualification_type"].isNotEmpty) ? json["qualification_type"] : '',
        // specialization: (json["specialization"] != null && json["specialization"].isNotEmpty) ? json["specialization"] : '',
        // category: (json["category"] != null && json["category"].isNotEmpty) ? json["category"] : '',
        updated__masked_cv: (json["updated__masked_cv"] != null && json["updated__masked_cv"].isNotEmpty) ? json["updated__masked_cv"] : '',
        // maximum_experience: json["maximum_experience"],
        // transportation_allowance: (json["transportation_allowance"] != null && json["transportation_allowance"].isNotEmpty) ? json["transportation_allowance"] : '',
        // food_allowance: (json["food_allowance"] != null && json["food_allowance"].isNotEmpty) ? json["food_allowance"] : '',
      );

  // Method to convert to JSON
  Map<String, dynamic> toJson() => {
        // "name": name,
        "current_employer": current_employer.isNotEmpty ? current_employer : '',
        "india_experience": india_experience,
        // "currency": currency.isNotEmpty ? currency : '',
        "overseas_experience": overseas_experience,
        "highest_degree": highest_degree.isNotEmpty ? highest_degree : '',
        "total_experience": total_experience,
        // "creation": "${creation.year.toString().padLeft(4, '0')}-${creation.month.toString().padLeft(2, '0')}-${creation.day.toString().padLeft(2, '0')}",
        // "description": description,
        // "custom_recruiter_contact": custom_recruiter_contact.isNotEmpty ? custom_recruiter_contact : '7305428777',
        "specialization": specialization.isNotEmpty ? specialization : '',
        "year_of_passing": year_of_passing.isNotEmpty ? year_of_passing : '',
        "position": position.isNotEmpty ? position : '',
        "updated__masked_cv": updated__masked_cv.isNotEmpty ? updated__masked_cv : '',
        // "transportation": transportation.isNotEmpty ? transportation : '',
        // "contract_period_year": contract_period_year.isNotEmpty ? contract_period_year : '',
        // "food": food.isNotEmpty ? food : '',
        // "accommodation": accommodation.isNotEmpty ? accommodation : '',
        // "over_time": over_time.isNotEmpty ? over_time : '',
        // "exp_end_date": exp_end_date != null
        //     ? "${exp_end_date!.year.toString().padLeft(4, '0')}-${exp_end_date!.month.toString().padLeft(2, '0')}-${exp_end_date!.day.toString().padLeft(2, '0')}"
            // : '', // Return empty string if null
        // "custom_is_customer_confidential": custom_is_customer_confidential,
        // "qualification_type": qualification_type.isNotEmpty ? qualification_type : '',
        // "specialization": specialization.isNotEmpty ? specialization : '',
        // "category": category.isNotEmpty ? category : '',
        // "mode_of_interview": mode_of_interview.isNotEmpty ? mode_of_interview : '',
        // "maximum_experience": maximum_experience,
        // "transportation_allowance": transportation_allowance.isNotEmpty ? transportation_allowance : '',
        // "food_allowance": food_allowance.isNotEmpty ? food_allowance : '',
        // // "salary_type": salary_type.isNotEmpty ? salary_type : '',
      };
}
List<CVModel> cvModelFromJson(String str) =>
List<CVModel>.from(json.decode(str).map((x) => CVModel.fromJson(x)));

String cvModelToJson(List<CVModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CVModel {
  String updated__masked_cv;
  

  
  CVModel({
    required this.updated__masked_cv,
    
  });

  factory CVModel.fromJson(Map<String, dynamic> json) => CVModel(
        updated__masked_cv: (json["updated__masked_cv"] != null && json["updated__masked_cv"].isNotEmpty) ? json["updated__masked_cv"] : '',
        
      );


  Map<String, dynamic> toJson() => {
        "updated__masked_cv": updated__masked_cv.isNotEmpty ? updated__masked_cv : '',
        
      };
}