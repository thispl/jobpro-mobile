import 'package:jobpro/presentation/job_details/controller/job_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:jobpro/core/app_export.dart';
import 'package:jobpro/utils/authentication_manager.dart';
import 'package:jobpro/widgets/app_bar/custom_app_bar.dart';
import 'package:jobpro/widgets/app_bar/appbar_image.dart';
import 'package:jobpro/widgets/app_bar/appbar_title.dart';
import 'package:jobpro/widgets/custom_elevated_button.dart';
import 'package:flutter_html/flutter_html.dart'; // Import flutter_html
import 'dart:io'; // Import dart:io for platform checking
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher

class JobDetailsTabContainerScreen extends StatefulWidget {
  const JobDetailsTabContainerScreen({Key? key}) : super(key: key);
  
  @override
  _JobDetailsTabContainerScreenState createState() => _JobDetailsTabContainerScreenState();
}

class _JobDetailsTabContainerScreenState extends State<JobDetailsTabContainerScreen> {
  late TextEditingController descriptionController;
  // final JobController recon = Get.put(JobController());
  // final AuthenticationManager _authManager = Get.put(AuthenticationManager());


  @override
  // Future<void> initState() async {
  //   super.initState();
  //   // final Map<String, dynamic> jobDetails = Get.arguments;
  //   String plainDescription = Get.arguments['description']; // Use raw description HTML
 
  //   // Initialize controller with plain text
  //   descriptionController = TextEditingController(text: plainDescription);
  // }

  // @override
  // void dispose() {
  //   descriptionController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> jobDetails = Get.arguments;

    final String subject = jobDetails['subject']!= null
        ? jobDetails['subject']
        : '';
    final String customer = jobDetails['customer']!= null
        ? jobDetails['customer']
        : '';
    final String currency = jobDetails['currency']!= null
        ? jobDetails['currency']
        : '';
    final double amount = jobDetails['amount']!= null
        ? jobDetails['amount']
        : 0.0;
    final String creation = jobDetails['creation']!= null
        ? jobDetails['creation']
        : '';
    // final String position = jobDetails['position']!= null
    //     ? jobDetails['position']
    //     : '';
    final String description = jobDetails['description']!= null
        ? jobDetails['description']
        : '';
    final String salary_type = jobDetails['salary_type'] != null
        ? jobDetails['salary_type']
        : '';
    final String territory = jobDetails['territory'] != null
        ? jobDetails['territory']
        : '';
    final String custom_country_flag = jobDetails['custom_country_flag'] != null
        ? jobDetails['custom_country_flag']
        : '';
    final int custom_is_customer_confidential = jobDetails['custom_is_customer_confidential'] != null
        ? jobDetails['custom_is_customer_confidential']
        : 0;
    // print(subject);
    // // Correct null check for custom_recruiter_contact
    // final String customRecruiterContact = jobDetails['custom_recruiter_contact'] != null
    //     ? jobDetails['custom_recruiter_contact']
    //     : '7305428777';
    final String qualification_type = jobDetails['qualification_type'] != null
        ? jobDetails['qualification_type']
        : '';
    final String specialization = jobDetails['specialization'] != null
        ? jobDetails['specialization']
        : '';
    final String category = jobDetails['category'] != null
        ? jobDetails['category']
        : '';
        final String mode_of_interview = jobDetails['mode_of_interview'] != null
        ? jobDetails['mode_of_interview']
        : '';
    final String working_days = jobDetails['working_days'] != null
        ? jobDetails['working_days']
        : '';
    final String transportation = jobDetails['transportation'] != null
        ? jobDetails['transportation']
        : '';
    final String contract_period_year = jobDetails['contract_period_year'] != null
        ? jobDetails['contract_period_year']
        : '';
    final String food = jobDetails['food'] != null
        ? jobDetails['food']
        : '';
    final String accommodation = jobDetails['accommodation'] != null
        ? jobDetails['accommodation']
        : '';
    final String over_time = jobDetails['over_time'] != null
        ? jobDetails['over_time']
        : '';
    final int maximum_experience = jobDetails['maximum_experience'] != null
        ? jobDetails['maximum_experience']
        : 0;
    final int minimum_experience = jobDetails['minimum_experience'] != null
        ? jobDetails['minimum_experience']
        : 0;
    final String food_allowance = jobDetails['food_allowance'] != null
        ? jobDetails['food_allowance']
        : '';
    final String transportation_allowance = jobDetails['transportation_allowance'] != null
        ? jobDetails['transportation_allowance']
        : '';
    // final String name = jobDetails['name'] != null
    //     ? jobDetails['name']
    //     : '';


    return SafeArea(
      
      child: Scaffold(
        backgroundColor: appTheme.whiteA70001,
        appBar: CustomAppBar(
          leadingWidth: getHorizontalSize(48),
          leading: AppbarImage(
            svgPath: ImageConstant.imgGroup162799,
            margin: getMargin(
              left: 24,
              top: 13,
              bottom: 13,
            ),
            onTap: () {
              Get.back();
            },
          ),
          centerTitle: true,
          title: AppbarTitle(
            text: "lbl_job_details".tr,
          ),
          // actions: [
            
          //   GestureDetector(
          //     onTap: () {
          //       recon.update_saved_jobs(
          //         name,
          //         _authManager.getToken()!,
          //         subject,
          //       );
          //     },
          //     child: Obx(() {
          //       bool isBookmarked = recon.isBookmarked.value;
          //       return CustomImageView(
          //         svgPath: isBookmarked?ImageConstant.imgBookmarkPrimary:ImageConstant.imgBookmark,
          //         height: getSize(24),
          //         width: getSize(24),
          //         margin: getMargin(bottom: 25),
          //       );
          //     }),
          //   ),
          //   // AppbarImage1(
          //   //   svgPath: ImageConstant.imgBookmark,
          //   //   margin: getMargin(
          //   //     left: 16,
          //   //     top: 13,
          //   //     right: 16,
          //   //     bottom: 13,
          //   //   ),
          //   // ),
          // ],
        ),
        body: SingleChildScrollView( 
           // Added the SingleChildScrollView here
          child: Padding(
            padding: getPadding(top: 10),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: getMargin(right: 14, left: 14),
                  padding: getPadding(top: 10, bottom: 24),
                  decoration: AppDecoration.outlineIndigo.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder16,
                  ),
                  child: Column(
                    children: [
                      Container(
                      height: getSize(99),
                      width: getSize(99),
                      padding: getPadding(all: 19),
                      // decoration: AppDecoration.fillGray.copyWith(
                      //   borderRadius: BorderRadiusStyle.roundedBorder39,
                      // ),
                      child: Image.network(
                        custom_country_flag,
                        errorBuilder: (context, error, stackTrace) => Icon(Icons.flag),
                        height: getSize(100),
                        width: getSize(100),
                        alignment: Alignment.center,
                      ),
                      ),
                      Padding(
                        padding: getPadding(left:12,top: 0),
                        child: Text(
                          subject,
                          style: CustomTextStyles.titleMediumMedium,
                          softWrap: true,
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: getPadding(left: 12, top: 12),
                        
                        child: Row(
                          children: [
                            
                            CustomElevatedButton(
                              height: getVerticalSize(28),
                              width: getHorizontalSize(89),
                              leftIcon: Icon(Icons.work),
                              text: "lbl_fulltime".tr,
                              buttonTextStyle: theme.textTheme.bodySmall!,
                            ),
                            CustomElevatedButton(
                              height: getVerticalSize(28),
                              width: getHorizontalSize(180),
                              leftIcon: Icon(Icons.watch_later),
                              text: creation,
                              margin: getMargin(left: 9),
                              buttonTextStyle: theme.textTheme.bodySmall!,
                            ),
                          ],
                        ),
                      ),
                      if(custom_is_customer_confidential=='0')
                      Padding(
                        padding: getPadding(top: 7,left:12),
                        
                        child: Text(
                          '${customer} (${territory})',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ),
                      
                    ],
                  ),
                ),

                  SizedBox(
                    width: getHorizontalSize(650),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          "Job Description",
                          style: CustomTextStyles.titleMediumBluegray900,
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                        ),
                        Container(
                          width: getHorizontalSize(450),
                          margin: getMargin(left: 14, top: 13, right: 14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: getPadding(all: 8),
                            child: Html(
                              data: description,
                              style: {
                                "body": Style(
                                  textAlign: TextAlign.left,
                                  color: Colors.black,
                                ),
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Job Requirements",
                          style: CustomTextStyles.titleMediumBluegray900,
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                        ),
                        Container(
                          width: getHorizontalSize(450),
                          margin: getMargin(left: 14, top: 13, right: 14),
                          // crossAxisAlignment:CrossAxisAlignment.start,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: getPadding(all: 8),
                            child:Align(
                              alignment:Alignment.centerLeft,
                              
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Qualification Type: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold, // Makes "Qualification Type:" bold
                                          color: Colors.black,
                                          
                                        ),
                                      ),
                                      TextSpan(
                                        text: qualification_type,
                                        style: TextStyle(
                                          color: Colors.black, // Normal style for the value
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Specialization: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold, // Makes "Qualification Type:" bold
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: specialization,
                                        style: TextStyle(
                                          color: Colors.black, // Normal style for the value
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Passport Category: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold, // Makes "Qualification Type:" bold
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: category,
                                        style: TextStyle(
                                          color: Colors.black, // Normal style for the value
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Experience: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold, // Makes "Qualification Type:" bold
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text:'$minimum_experience years to $maximum_experience years',
                                        style: TextStyle(
                                          color: Colors.black, // Normal style for the value
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                if(salary_type!='Confidential')
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Salary: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold, // Makes "Qualification Type:" bold
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '${amount}-${currency}',
                                        style: TextStyle(
                                          color: Colors.black, // Normal style for the value
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Salary Type: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold, // Makes "Qualification Type:" bold
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: salary_type,
                                        style: TextStyle(
                                          color: Colors.black, // Normal style for the value
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Mode of Interview: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold, // Makes "Qualification Type:" bold
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: mode_of_interview,
                                        style: TextStyle(
                                          color: Colors.black, // Normal style for the value
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.left,
                                ),

                                
                                
                              ],
                            )),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Allowances/Benefits",
                          style: CustomTextStyles.titleMediumBluegray900,
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                        ),
                        Container(
                          width: getHorizontalSize(450),
                          margin: getMargin(left: 14, top: 13, right: 14),
                          // crossAxisAlignment:CrossAxisAlignment.start,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.grey.shade300,
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: getPadding(all: 8),
                            child:Align(
                              alignment:Alignment.centerLeft,
                              
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Working Hours: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold, // Makes "Qualification Type:" bold
                                          color: Colors.black,
                                          
                                        ),
                                      ),
                                      TextSpan(
                                        text: working_days,
                                        style: TextStyle(
                                          color: Colors.black, // Normal style for the value
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Trasportation: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold, // Makes "Qualification Type:" bold
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: specialization,
                                        style: TextStyle(
                                          color: Colors.black, // Normal style for the value
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                if(transportation_allowance!='')
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Trasportation Allowance: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold, // Makes "Qualification Type:" bold
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: transportation_allowance,
                                        style: TextStyle(
                                          color: Colors.black, // Normal style for the value
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Passport Category: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold, // Makes "Qualification Type:" bold
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: transportation,
                                        style: TextStyle(
                                          color: Colors.black, // Normal style for the value
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Contract Period: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold, // Makes "Qualification Type:" bold
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text:'${contract_period_year} years',
                                        style: TextStyle(
                                          color: Colors.black, // Normal style for the value
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Food: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold, // Makes "Qualification Type:" bold
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: food,
                                        style: TextStyle(
                                          color: Colors.black, // Normal style for the value
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                if(food_allowance!='')
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Food Allowance: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold, // Makes "Qualification Type:" bold
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: food_allowance,
                                        style: TextStyle(
                                          color: Colors.black, // Normal style for the value
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Accommodation: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold, // Makes "Qualification Type:" bold
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: accommodation,
                                        style: TextStyle(
                                          color: Colors.black, // Normal style for the value
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Over Time: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold, // Makes "Qualification Type:" bold
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: over_time,
                                        style: TextStyle(
                                          color: Colors.black, // Normal style for the value
                                        ),
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.left,
                                ),

                                
                                
                              ],
                            )),
                          ),
                        ),

                      ],
                    ),
                  ),

                // SizedBox(height: 20),
                // Center(
                //   child: ElevatedButton(
                //     onPressed: () => whatsapp(position, customRecruiterContact),
                //     child: Text('Apply Now'),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // whatsapp(String position, String customRecruiterContact) async {
  //   String contact = (customRecruiterContact.length == 10)
  //       ? customRecruiterContact
  //       : "917305428777";

  //   String text = 'Hi, I am willing to apply for the Position: $position';
  //   final androidUrl = "whatsapp://send?phone=$contact&text=${Uri.encodeFull(text)}";
  //   String iosUrl = "https://wa.me/$contact?text=${Uri.encodeComponent(text)}";
  //   String webUrl = 'https://api.whatsapp.com/send/?phone=$contact&text=${Uri.encodeComponent(text)}';

  //   try {
  //     if (Platform.isIOS) {
  //       if (await canLaunchUrl(Uri.parse(iosUrl))) {
  //         await launchUrl(Uri.parse(iosUrl));
  //       }
  //     } else if (Platform.isAndroid) {
  //       if (await canLaunchUrl(Uri.parse(androidUrl))) {
  //         await launchUrl(Uri.parse(androidUrl));
  //       }
  //     } else {
  //       if (await canLaunchUrl(Uri.parse(webUrl))) {
  //         await launchUrl(Uri.parse(webUrl));
  //       }
  //     }
  //   } catch (e) {
  //     debugPrint("whatsapp error: $e");
  //   }
  // }
}
