
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:http/http.dart';
import 'package:jobpro/presentation/job_details/model/job_details_model.dart';
import 'package:jobpro/presentation/profile_page/profile_page.dart';
import 'package:jobpro/utils/user_controller.dart';
import 'package:jobpro/widgets/app_bar/appbar_image_1.dart';

import 'package:jobpro/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart'; 
import 'package:get/get.dart';
import 'package:jobpro/presentation/job_details/controller/job_details_controller.dart'; 
import 'package:jobpro/core/app_export.dart';
import 'package:jobpro/widgets/app_bar/appbar_circleimage.dart';
// import 'package:jobpro/widgets/app_bar/appbar_image_1.dart';
import 'package:jobpro/widgets/app_bar/appbar_subtitle.dart';
import 'package:jobpro/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:jobpro/widgets/app_bar/custom_app_bar.dart';
import 'package:jobpro/widgets/custom_icon_button.dart';

import 'package:jobpro/presentation/saved_page/saved_page.dart';

import 'package:intl/intl.dart';
import 'package:jobpro/widgets/custom_search_view.dart';


import 'dart:io'; // Import dart:io for platform checking
import 'package:url_launcher/url_launcher.dart'; 
import 'package:timeago/timeago.dart' as timeago;
 
// import "package:jobpro/presentation/saved_page/controller/saved_controller.dart";
// import 'package:jobpro/presentation/saved_page/models/saved_item_model.dart';
// import 'package:jobpro/presentation/saved_page/models/saved_model.dart';

// class JobDetailsPage extends StatelessWidget {
//   final JobController recon = Get.put(JobController());
//   // final SavedController savedController = Get.put(SavedController(SavedModel().obs)); // Initialize SavedController
//   final int _pageIndex = 0; // Default page index
  
//   // final String userEmail = Get.arguments['userEmail'] ?? 'No email passed';

// @override
// Widget build(BuildContext context) {
//   return SafeArea(
//     child: Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: appTheme.whiteA70001,
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 255, 255, 255),
//         leadingWidth: getHorizontalSize(149),
//         leading: Padding(
//           padding: getPadding(left: 10),
//           child: Image.asset(
//             "assets/images/TEAMPRO_STROKE_2.png",
//             height: getSize(190),
//             width: getSize(100),
//             fit: BoxFit.contain,
//           ),
//         ),
//         title: Padding(
//           padding: getPadding(),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               AppbarSubtitle(
//                 text: "msg_hi_welcome_back".tr,
//               ),
//             ],
//           ),
//         ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 14),
//             child: AppbarCircleimage(
//               imagePath: ImageConstant.imgImage50x50,
//               margin: getMargin(),
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Align(
//               alignment: Alignment.center,
//               child: CustomSearchView(
//                 margin: getMargin(left: 24, top: 30, right: 24),
//                 hintText: "lbl_search".tr,
//                 hintStyle: CustomTextStyles.titleMediumBluegray400,
//                 alignment: Alignment.center,
//                 prefix: Container(
//                   margin: getMargin(
//                     left: 16,
//                     top: 17,
//                     right: 8,
//                     bottom: 17,
//                   ),
//                   child: CustomImageView(
//                     svgPath: ImageConstant.imgSearch,
//                   ),
//                 ),
//                 prefixConstraints: BoxConstraints(
//                   maxHeight: getVerticalSize(52),
//                 ),
//                 suffix: Container(
//                   margin: getMargin(
//                     left: 30,
//                     top: 17,
//                     right: 16,
//                     bottom: 17,
//                   ),
//                   child: CustomImageView(
//                     svgPath: ImageConstant.imgFilterPrimary,
//                   ),
//                 ),
//                 suffixConstraints: BoxConstraints(
//                   maxHeight: getVerticalSize(52),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: getPadding(left: 24, top: 22),
//               child: Text(
//                 "lbl_recent_jobs".tr,
//                 style: CustomTextStyles.titleMediumInter,
//               ),
//             ),
//             Obx(() {
//               if (recon.isLoading.value) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (recon.reconList.isEmpty) {
//                 return const Center(child: Text('No job details available.'));
//               } else {
//                 return RefreshIndicator(
//                   onRefresh: () async {
//                     await recon.fetchJobDetails();
//                   },
//                   child: ListView.separated(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(), // Disable scrolling
//                     separatorBuilder: (context, index) {
//                       return SizedBox(height: getVerticalSize(16));
//                     },
//                     itemCount: recon.reconList.length,
//                     itemBuilder: (context, index) {
//                       DateTime creationDate = DateFormat("yyyy-MM-dd").parse('${recon.reconList[index].creation}');
//                       DateTime nowDate = DateTime.now();
//                       int differenceInDays = nowDate.difference(creationDate).inDays;

//                       return GestureDetector(
//                         onTap: () {
//                           Get.toNamed(AppRoutes.jobDetailsTabContainerScreen, arguments: {
//                             'subject': recon.reconList[index].subject,
//                             'customer': recon.reconList[index].customer,
//                             'currency': recon.reconList[index].currency,
//                             'amount': recon.reconList[index].amount,
//                             'creation': '$differenceInDays days ago',
//                             'jobType': recon.reconList[index].subject,
//                             'position': recon.reconList[index].subject,
//                             'description': recon.reconList[index].description,
//                             'custom_recruiter_contact': recon.reconList[index].custom_recruiter_contact ?? '7305428777',
//                           });
//                         },
//                         child: Container(
//                           padding: getPadding(all: 16),
//                           decoration: AppDecoration.outlineIndigo.copyWith(
//                             borderRadius: BorderRadiusStyle.roundedBorder16,
//                           ),
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   CustomIconButton(
//                                     height: getSize(48),
//                                     width: getSize(48),
//                                     padding: getPadding(all: 8),
//                                     child: CustomImageView(svgPath: ImageConstant.imgGroupPrimary),
//                                   ),
//                                   SizedBox(width: 12),
//                                   Expanded(
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         GestureDetector(
//                                           onTap: () {
//                                             Get.toNamed(AppRoutes.jobDetailsTabContainerScreen, arguments: {
//                                               'subject': recon.reconList[index].subject,
//                                               'customer': recon.reconList[index].customer,
//                                               'currency': recon.reconList[index].currency,
//                                               'amount': recon.reconList[index].amount,
//                                               'creation': '$differenceInDays days ago',
//                                               'jobType': recon.reconList[index].subject,
//                                               'position': recon.reconList[index].subject,
//                                               'description': recon.reconList[index].description,
//                                               'custom_recruiter_contact': recon.reconList[index].custom_recruiter_contact ?? '7305428777',
//                                             });
//                                           },
//                                           child: Text(
//                                             recon.reconList[index].subject,
//                                             style: CustomTextStyles.titleMediumBold_1,
//                                             softWrap: true,
//                                             maxLines: 3,
//                                             overflow: TextOverflow.ellipsis,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: getPadding(top: 5),
//                                           child: Text(
//                                             recon.reconList[index].customer,
//                                             softWrap: true,
//                                             style: CustomTextStyles.labelLargeBluegray300SemiBold,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   GestureDetector(
//                                     onTap: () {
//                                       recon.update_saved_jobs(
//                                         recon.reconList[index].name,
//                                         "divya1234@gmail.com",
//                                         recon.reconList[index].subject,
//                                       );
//                                     },
//                                     child: Obx(() {
//                                       bool isBookmarked = recon.isBookmarked.value;
//                                       return CustomImageView(
//                                         svgPath: ImageConstant.imgBookmark,
//                                         height: getSize(24),
//                                         width: getSize(24),
//                                         margin: getMargin(bottom: 25),
//                                       );
//                                     }),
//                                   ),
//                                 ],
//                               ),
//                               Padding(
//                                 padding: getPadding(left: 60, top: 9),
//                                 child: Text(
//                                   '${recon.reconList[index].currency} - ${recon.reconList[index].amount}',
//                                   style: CustomTextStyles.labelLargeGray600_1,
//                                 ),
//                               ),
//                               Align(
//                                 alignment: Alignment.center,
//                                 child: Padding(
//                                   padding: getPadding(top: 13),
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       CustomElevatedButton(
//                                         height: getVerticalSize(28),
//                                         width: getHorizontalSize(70),
//                                         text: "lbl_fulltime".tr,
//                                         buttonTextStyle: theme.textTheme.labelLarge!,
//                                       ),
//                                       CustomElevatedButton(
//                                         height: getVerticalSize(28),
//                                         width: getHorizontalSize(103),
//                                         text: '$differenceInDays days ago',
//                                         margin: getMargin(left: 8),
//                                         buttonTextStyle: theme.textTheme.labelLarge!,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               }
//             }),
//           ],
//         ),
//       ),
//         bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.bookmark),
//               label: 'Saved',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: 'Profile',
//             ),
//           ],
//           currentIndex: _pageIndex,
//           onTap: (int index) {
//             switch (index) {
//               case 0: // Home
//                 Get.off(() => JobDetailsPage());
//                 break;
//               case 1: // Saved
//                 Get.off(() => SavedPage()); // Replace with your Saved page route
//                 break;
//               case 2: // Profile
//                 Get.off(() => ProfilePage()); // Replace with your Profile page route
//                 break;
//             }
//           },
//         ),
//       ),
//     );
//   }

// }

class JobDetailsPage extends StatefulWidget {
  @override
  _JobDetailsPageState createState() => _JobDetailsPageState();
}

class _JobDetailsPageState extends State<JobDetailsPage> {
  final JobController recon = Get.put(JobController());
  final TextEditingController searchController = TextEditingController();
  List<JobDetailsModel> filteredList = [];
  List<String> jobCategories = []; // List to display
  final int _pageIndex = 0; // Default page index
  bool isSearchActive = false; 
  // final String userEmail = Get.arguments['userEmail'] ?? 'No email passed';
  // Control the visibility of the search box

  @override
  void initState() {
    super.initState();
    // Initially display all jobs
    filteredList = List.from(recon.reconList); // Ensure you get a copy of the list
    searchController.addListener(_onSearchChanged);
    fetchJobCategories(); // Listen for search input changes
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<void> fetchJobCategories() async {
    String joburl = 'https://erp.teamproit.com/api/resource/Task?filters=[[%22service%22,%22in%22,[%22REC-I%22,%22REC-D%22]],["custom_job_category","!=",""],[%22status%22,%22in%22,[%22Open%22,%22Working%22,%22Pending%20Review%22,%22Overdue%22]]]&fields=[%22custom_job_category%22]&group_by=custom_job_category&order_by=creation%20desc&limit=500';
    try {
      print('Recon URL: $joburl'); 
      String apiKey = '4aedf12d2330fbe';
      String apiSecret = '2d72f01e8e1a60a';
      String token = 'token $apiKey:$apiSecret';
      var response = await get(
        Uri.parse(joburl),
        headers: {
          'Authorization': token,
        },
      );
      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == HttpStatus.ok) {
        // Assuming response body is in JSON format and contains 'data' key
        var data = json.decode(response.body);
      // Check if 'data' key exists and extract categories properly
      if (data is Map<String, dynamic> && data['data'] != null) {
        setState(() {
          jobCategories = List<String>.from(data['data'].map((item) => item['custom_job_category'] as String));
        });
        print(jobCategories);
      } else {
        print("Unexpected response format: ${data}");
      }
      } else {
      print("Unexpected response: ${response.statusCode}");
    }
    } catch (e) {
      print('Exception: $e');
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }

  // Method to filter job list based on search input
  void _onSearchChanged() {
    String query = searchController.text.toLowerCase();

    setState(() {
      print('query $query');
      if (query.isNotEmpty) {
       filteredList = recon.reconList.where((job) {
          return job.subject.toLowerCase().contains(query);
        }).toList();
        
      } else {
        filteredList = recon.reconList;
        // Filter the list based on the search query
        
      }
    });
  }
  void _showFilterDialog() async {
  List<String> selectedCategories = []; // Store selected categories

  await showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text(
              'Select Job Categories',
              style: TextStyle(
                fontSize: 20, // Set the font size
                fontWeight: FontWeight.bold, // Set the font weight
                color: Colors.black, // Set the text color
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: jobCategories.map((category) {
                  final isSelected = selectedCategories.contains(category);
                  
                  return CheckboxListTile(
                    tileColor: isSelected ? const Color.fromARGB(255, 117, 118, 119).withOpacity(0.2) : null, // Highlight selected category with background
                    title: GestureDetector(
                      onTap: () {
                        // Toggle checkbox on tapping the text
                        setState(() {
                          if (isSelected) {
                            selectedCategories.remove(category);
                          } else {
                            selectedCategories.add(category);
                          }
                        });
                      },
                      child: Text(
                        category,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black, // Highlight selected category text color
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, // Bold for selected categories
                        ),
                      ),
                    ),
                    value: isSelected,
                    onChanged: (bool? value) {
                      setState(() {
                        if (value == true) {
                          selectedCategories.add(category);
                        } else {
                          selectedCategories.remove(category);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  // Close the dialog and filter the job list based on selected categories
                  Navigator.of(context).pop();
                  _filterJobList(selectedCategories);
                },
                child: Text(
                  'Apply',
                  style: TextStyle(
                    fontSize: 16, // Customize button text style
                    color: Color.fromARGB(255, 32, 153, 21), // Customize button text color
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog without filtering
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 16, // Customize button text style
                    color: Colors.red, // Customize button text color
                  ),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}


  void _filterJobList(List<String> selectedCategories) {
    setState(() {
      // Reset the filtered list to all jobs first
      filteredList = List.from(recon.reconList);
      
      // Apply the filter if any category is selected
      if (selectedCategories.isNotEmpty) {
        filteredList = filteredList.where((job) {
          // Ensure that job.custom_job_category is not null before checking
          return job.custom_job_category != null && selectedCategories.contains(job.custom_job_category);
        }).toList();
      }
    });
  }
    

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: appTheme.whiteA70001,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          leadingWidth: getHorizontalSize(149),
          leading: Padding(
            padding: getPadding(left: 10),
            child: Image.asset(
              "assets/images/TEAMPRO_STROKE_2.png",
              height: getSize(190),
              width: getSize(100),
              fit: BoxFit.contain,
            ),
          ),
          title: Padding(
            padding: getPadding(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppbarSubtitle(
                  text: "msg_hi_welcome_back".tr,
                ),
              ],
            ),
          ),
          actions: [

            
            Padding(
              padding: const EdgeInsets.only(right: 14),
              child: AppbarCircleimage(
                imagePath: ImageConstant.imgImage50x50,
                margin: getMargin(),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Container(
                  // alignment: Alignment.center,
                  child: CustomSearchView(
                    controller: searchController,
                    margin: getMargin(left: 24, top: 30, right: 24),
                    hintText: "lbl_search".tr,
                    hintStyle: CustomTextStyles.titleMediumBluegray400,
                    alignment: Alignment.center,
                    prefix: Container(
                      margin: getMargin(left: 16, top: 17, right: 8, bottom: 17),
                      child: CustomImageView(svgPath: ImageConstant.imgSearch),
                    ),
                    prefixConstraints: BoxConstraints(maxHeight: getVerticalSize(52)),
                    // suffix: Container(
                    //   margin: getMargin(left: 30, top: 17, right: 16, bottom: 17),
                      suffix: IconButton(
                        icon: CustomImageView(svgPath: ImageConstant.imgFilterPrimary),
                        onPressed: _showFilterDialog,
                      ),
                    // ),
                    suffixConstraints: BoxConstraints(maxHeight: getVerticalSize(52)),
                  ),
                ),
              Padding(
                padding: getPadding(left: 24, top: 22),
                child: Text(
                  "lbl_recent_jobs".tr,
                  style: CustomTextStyles.titleMediumInter,
                ),
              ),
              Obx(() {
                if (recon.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (filteredList.isEmpty) {
                  return const Center(child: Text('No job details available.'));
                } else {
                  return RefreshIndicator(
                    onRefresh: () async {
                      await recon.fetchJobDetails();
                    },
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(), // Disable scrolling
                      separatorBuilder: (context, index) {
                        return SizedBox(height: getVerticalSize(16),width: getHorizontalSize(16),);
                      },
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        DateTime creationDate = DateTime.parse('${filteredList[index].creation}');
                        String timeAgoText = timeAgo(creationDate);

                        // DateTime creationDate = DateFormat('yyyy-MM-dd').parse(creationDateString);
                        
                        DateTime end_date= DateFormat('yyyy-MM-dd').parse('${filteredList[index].exp_end_date}');
                        DateTime nowDate = DateTime.now();

                        // Calculate the difference in days
                        int differenceInDays = end_date.difference(nowDate).inDays;
                        int creation = nowDate.difference(creationDate).inDays;
                        // if (differenceInDays>0){
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.jobDetailsTabContainerScreen, arguments: {
                              'subject': filteredList[index].subject,
                              'customer': filteredList[index].customer,
                              'currency': filteredList[index].currency,
                              'amount': filteredList[index].amount,
                              'creation': timeAgoText,
                              'jobType': filteredList[index].subject,
                              'position': filteredList[index].subject,
                              'description': filteredList[index].description,
                              'custom_recruiter_contact': filteredList[index].custom_recruiter_contact ?? '7305428777',
                            });
                          },
                          child: Container(
                            padding: getPadding(all: 15),
                            decoration: AppDecoration.outlineIndigo.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder44, // Keep the border radius
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    
                                    // CustomIconButton(
                                    //   height: getSize(48),
                                    //   width: getSize(48),
                                    //   padding: getPadding(all: 8),
                                    //   child: CustomImageView(svgPath: ImageConstant.imgGroupPrimary),
                                    // ),
                                    // SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          
                                          Padding(
                                            padding: getPadding(top: 5),
                                          // GestureDetector(
                                          //   onTap: () {
                                          //     Get.toNamed(AppRoutes.jobDetailsTabContainerScreen, arguments: {
                                          //       'subject': filteredList[index].subject,
                                          //       'customer': filteredList[index].customer,
                                          //       'currency': filteredList[index].currency,
                                          //       'amount': filteredList[index].amount,
                                          //       'creation': timeAgoText,
                                          //       'jobType': filteredList[index].subject,
                                          //       'position': filteredList[index].subject,
                                          //       'description': filteredList[index].description,
                                          //       'custom_recruiter_contact': filteredList[index].custom_recruiter_contact ?? '7305428777',
                                          //     });
                                          //   },
                                            child: Text(
                                              filteredList[index].subject,
                                              style: CustomTextStyles.titleMediumMedium,
                                              softWrap: true,
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Padding(
                                            padding: getPadding(top: 5),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center, // Aligns the image and text vertically centered
                                              children: [
                                                Image.network(
                                                  filteredList[index].custom_country_flag,
                                                  errorBuilder: (context, error, stackTrace) => Icon(Icons.flag), // Handles image load failure
                                                  height: 30, // Adjust image height if necessary
                                                  width: 30,  // Adjust image width if necessary
                                                ),
                                                SizedBox(width: 8), // Adds spacing between the image and the text
                                                Expanded(
                                                  child: Text(
                                                    filteredList[index].territory , 
                                                    softWrap: true,
                                                    style: CustomTextStyles.labelLargeBluegray300SemiBold, // Custom style for text
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    differenceInDays > 0 
                                                    ? "Closing in $differenceInDays days" 
                                                    : "Expired", 
                                                     
                                                    softWrap: true,
                                                    style: CustomTextStyles.labelLargeBluegray300SemiBold, // Custom style for text
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // GestureDetector(
                                    //   onTap: () {
                                    //     recon.update_saved_jobs(
                                    //       filteredList[index].name,
                                    //       "divya1234@gmail.com",
                                    //       filteredList[index].subject,
                                    //     );
                                    //   },
                                    //   child: Obx(() {
                                    //     bool isBookmarked = recon.isBookmarked.value;
                                    //     return CustomImageView(
                                    //       svgPath: ImageConstant.imgBookmark,
                                    //       height: getSize(24),
                                    //       width: getSize(24),
                                    //       margin: getMargin(bottom: 25),
                                    //     );
                                    //   }),
                                    // ),
                                    if (differenceInDays < 5 && differenceInDays > 0)
            Transform.rotate(
              angle: 0.2,
              alignment: Alignment.topRight,
              
              child: Container(
                height: 50,
                width: 50,
                child: Center(
                  child: Text(
                    'Closing Soon ⏳',
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            if (creation < 5)
              Transform.rotate(
              angle: 0.3,
              alignment: Alignment.topRight,
              
              child: Container(
                height: 50,
                width: 50,
                child: Center(
                  child: Text(
                    'New 💥',
                    style: TextStyle(
                      color: Color.fromARGB(255, 53, 151, 50),
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
                                  ],
                                ),
                                
                                Padding(
                                    padding: getPadding(top: 13),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        CustomElevatedButton(
                                          height: getVerticalSize(28),
                                          width: getHorizontalSize(70),
                                          text: "lbl_fulltime".tr,
                                          buttonTextStyle: theme.textTheme.labelLarge!,
                                        ),
                                        CustomElevatedButton(
                                          height: getVerticalSize(28),
                                          width: getHorizontalSize(110),
                                          text: timeAgoText,
                                          margin: getMargin(left: 8),
                                          buttonTextStyle: theme.textTheme.labelLarge!,
                                        ),
                                        CustomElevatedButton(
                                          height: getVerticalSize(28),
                                          width: getHorizontalSize(103),
                                          text: "Exp: ${filteredList[index].minimum_experience} years",
                                          margin: getMargin(left: 8),
                                          buttonTextStyle: theme.textTheme.labelLarge!,
                                        ),
                                        // CustomElevatedButton(
                                        //   height: getVerticalSize(28),
                                        //   width: getHorizontalSize(103),
                                        //   text: timeAgoText,
                                        //   margin: getMargin(left: 8),
                                        //   buttonTextStyle: theme.textTheme.labelLarge!,
                                        // ),
                                      ],
                                    ),
                                  ),
                                
                                Padding(
                                    padding: getPadding(top: 13),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                  if(filteredList[index].salary_type!='Confidential')    
                                  Text(
                                    '${filteredList[index].currency} - ${filteredList[index].amount}',
                                    style: TextStyle(fontSize: 10,fontWeight:FontWeight.normal),
                                  ),
                              
                                        IconButton(icon: new Icon(Icons.phone,color: const Color.fromARGB(255, 0, 0, 0),),
                                          onPressed: () 
                                          {
                                            setState(() {
                                                 _makePhoneCall('tel:${filteredList[index].custom_recruiter_contact ?? '7305428777'}');
                                            });
                                          },
                                        ),
                                        CustomElevatedButton(
                                          height: getVerticalSize(28),
                                          width: getHorizontalSize(100),
                                          text: "Apply",
                                          buttonTextStyle: theme.textTheme.labelLarge!.copyWith(
                                            color: Colors.white, // Sets text color
                                            fontWeight: FontWeight.bold, // Custom font weight
                                            fontSize: 11.0, // Custom font size
                                          ),
                                          buttonStyle: ElevatedButton.styleFrom(
                                            primary: Color.fromARGB(255, 16, 63, 102), // Background color of the button
                                            onPrimary: Colors.white, // Text color when the button is pressed
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12), // Rounded corners
                                            ),
                                            elevation: 5, // Adds shadow effect to the button
                                          ),
                                          // buttonTextStyle: theme.textTheme.labelLarge!,
                                          onTap: () =>{
                                            whatsapp(filteredList[index].subject, filteredList[index].custom_recruiter_contact)
                                          },
                                        ),
                                        CustomElevatedButton(
                                          height: getVerticalSize(28),
                                          width: getHorizontalSize(103),
                                          text: "Job Details",
                                          margin: getMargin(left: 8),
                                          buttonTextStyle: theme.textTheme.labelLarge!.copyWith(
                                            color: Colors.white, // Sets text color
                                            fontWeight: FontWeight.bold, // Custom font weight
                                            fontSize: 11.0, // Custom font size
                                          ),
                                          buttonStyle: ElevatedButton.styleFrom(
                                            primary: Color.fromARGB(255, 16, 63, 102), // Background color of the button
                                            onPrimary: Colors.white, // Text color when the button is pressed
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12), // Rounded corners
                                            ),
                                            elevation: 5, // Adds shadow effect to the button
                                          ),
                                          onTap: () => {
                                              Get.toNamed(AppRoutes.jobDetailsTabContainerScreen, arguments: {
                                                'subject': filteredList[index].subject,
                                                'customer': filteredList[index].customer,
                                                'currency': filteredList[index].currency,
                                                'amount': filteredList[index].amount,
                                                'creation': timeAgoText,
                                                'jobType': filteredList[index].subject,
                                                'position': filteredList[index].subject,
                                                'description': filteredList[index].description,
                                                'territory': filteredList[index].territory,
                                                'custom_country_flag': filteredList[index].custom_country_flag,
                                                'custom_recruiter_contact': filteredList[index].custom_recruiter_contact ?? '7305428777',
                                                'custom_is_customer_confidential': filteredList[index].custom_is_customer_confidential,
                                                'salary_type': filteredList[index].salary_type,
                                                'qualification_type': filteredList[index].qualification_type,
                                                'specialization': filteredList[index].specialization,
                                                'category': filteredList[index].category,
                                                'mode_of_interview': filteredList[index].mode_of_interview,
                                                'maximum_experience': filteredList[index].maximum_experience,
                                                'minimum_experience': filteredList[index].minimum_experience,
                                                'working_days':filteredList[index].working_days,
                                                'transportation':filteredList[index].transportation,
                                                'food':filteredList[index].food,
                                                'accommodation':filteredList[index].accommodation,
                                                'over_time':filteredList[index].over_time,
                                                'transportation_allowance':filteredList[index].transportation_allowance,
                                                'food_allowance':filteredList[index].food_allowance,
                                                'name':filteredList[index].name,
                                                // "userEmail":userEmail,
                                                
                                                

                                              })
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                // Align(
                                //   alignment: Alignment.center,
                                //   child: Padding(
                                //     padding: getPadding(top: 13),
                                //     child: Row(
                                //       mainAxisAlignment: MainAxisAlignment.center,
                                //       children: [
                                //         CustomElevatedButton(
                                //           height: getVerticalSize(28),
                                //           width: getHorizontalSize(70),
                                //           text: "lbl_fulltime".tr,
                                //           buttonTextStyle: theme.textTheme.labelLarge!,
                                //         ),
                                //         CustomElevatedButton(
                                //           height: getVerticalSize(28),
                                //           width: getHorizontalSize(103),
                                //           text: '$differenceInDays days ago',
                                //           margin: getMargin(left: 8),
                                //           buttonTextStyle: theme.textTheme.labelLarge!,
                                //         ),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                // if (differenceInDays < 5 && differenceInDays > 0)
                                //   Positioned(
                                //     top: 0,
                                //     right: 0,
                                //     child: Image.asset(
                                //       'assets/images/20c5ae46-6ee6-413a-9285-550830dfadb4.png',
                                //       height: 50, // Adjust the size according to your design
                                //       width: 50,
                                //     ),
                                //   ),
                              ],
                            ),
                          ),
                        );
                        // }
                      },
                    ),
                  );
                }
              }),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark),
              label: 'Saved',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _pageIndex,
          onTap: (int index) {
            switch (index) {
              case 0: // Home
                Get.off(() => JobDetailsPage());
                break;
              case 1: // Saved
                Get.off(() => SavedPage()); // Replace with your Saved page route
                break;
              case 2: // Profile
                Get.off(() => ProfilePage()); // Replace with your Profile page route
                break;
            }
          },
        ),
      ),
    );
  }
    whatsapp(String position,String custom_recruiter_contact) async {
    String contact = (custom_recruiter_contact.length == 10) 
        ? custom_recruiter_contact 
        : "917305428777"; 

    String text = 'Hi, I am willing to apply for the Position: $position';
    // var whatsappURl_android = "whatsapp://send?phone="+whatsapp+"&text=hello"; // Corrected the string interpolation
    final androidUrl = "whatsapp://send?phone=$contact&text=${Uri.encodeFull(text)}"; // Encode the message
    String iosUrl = "https://wa.me/$contact?text=${Uri.encodeComponent(text)}"; // Encode the message
    String webUrl = 'https://api.whatsapp.com/send/?phone=$contact&text=${Uri.encodeComponent(text)}'; // Encode the message

    try {
      if (Platform.isIOS) {
        if (await canLaunchUrl(Uri.parse(iosUrl))) {
          await launchUrl(Uri.parse(iosUrl));
        }
      } else {
        if (await canLaunchUrl(androidUrl as Uri)) {
          await launchUrl(androidUrl as Uri);
        }
      }
    } catch (e) {
      print('Error launching WhatsApp: $e');
      await launchUrl(Uri.parse(webUrl), mode: LaunchMode.externalApplication);
    }
  }
  String timeAgo(DateTime date) {
  // Format the date relative to now with a suffix (e.g., "5 days ago")
  String timeAgo = timeago.format(date, allowFromNow: true);

  // Return the time ago string
  return timeAgo;
}
Future<void> _makePhoneCall(String url) async {
 if (await canLaunch(url)) {
   await launch(url);
 } else {
   throw 'Could not launch $url';
 }
}
}