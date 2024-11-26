import 'dart:convert';
import 'dart:io';
import 'package:jobpro/presentation/job_details/job_details_page.dart';
import 'package:jobpro/presentation/login_screen/login_screen.dart';
import 'package:jobpro/presentation/login_screen_otp/login_screen_otp.dart';
import 'package:jobpro/presentation/profile_page/controller/profile_page_controller.dart';
import 'package:jobpro/utils/authentication_manager.dart';
import 'package:jobpro/utils/file_controller.dart';
import 'package:jobpro/utils/globals.dart';
import 'package:jobpro/utils/user_controller.dart';
import 'package:jobpro/widgets/custom_elevated_button.dart';
import 'package:jobpro/widgets/custom_text_form_field.dart';
import 'package:url_launcher/url_launcher.dart';
import 'controller/profile_controller.dart';
import 'models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:jobpro/core/app_export.dart';
import 'package:jobpro/widgets/app_bar/appbar_image.dart';
import 'package:jobpro/widgets/app_bar/appbar_image_1.dart';
import 'package:jobpro/widgets/app_bar/appbar_title.dart';
import 'package:jobpro/widgets/app_bar/custom_app_bar.dart';
import 'package:jobpro/widgets/custom_checkbox_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  final ProfilePageController recon = Get.put(ProfilePageController());
final AuthenticationManager _authManager = Get.put(AuthenticationManager());
  ProfileController controller = Get.put(ProfileController(ProfileModel().obs));
  final UserController userController = Get.find();
    
  final FileController fileController = Get.put(FileController());
  late final String userEmail;
  
  String? attachedCvUrl;
  bool isFirstLoad = true;
  static const IconData customIcon = IconData(0xe491, fontFamily: 'MaterialIcons');

  // late final String userEmail;
  late final String token;
  Future<void> refreshData() async {
    // Call the methods to fetch profile and experience data
    await recon.profileDetails();
    await recon.exp_edu_Details();
    setState(() {
      isFirstLoad = false;  // After data loads, set this to false
    });
  }

  @override
  Future<void> initState() async {
    // super.initState();
    
    if (isFirstLoad) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        // Trigger a refresh automatically on the very first load
        await refreshData();
         attachedCvUrl = fileController.getfileurl();
      });
    }
  }
  
  @override
  void onInit() {
    userEmail = _authManager.getToken()!;
    // userEmail = userController.fetchUserName() as String;
   
  }


  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    
    // final String userEmail = "siva.m@groupteampro.com";
    // print('Email from controllerpp: $userEmail');
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA70001,
                appBar: CustomAppBar(
          leadingWidth: getHorizontalSize(48),
          leading: AppbarImage(
            svgPath: ImageConstant.imgGroup162799,
            margin: getMargin(left: 24, top: 13, bottom: 13),
            onTap: () {
              onTapArrowbackone();
            },
          ),
          centerTitle: true,
          title: AppbarTitle(
            text: "lbl_profile".tr,
          ),
        ),
        body: 
        
           SizedBox(
  width: mediaQueryData.size.width,
  child: RefreshIndicator(
    onRefresh: () async {
      await recon.profileDetails();
      await recon.exp_edu_Details();
    },
    child: SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: getPadding(top: 30),
      child: Padding(
        padding: getPadding(bottom: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Profile Banner
            SizedBox(
              height: getVerticalSize(225),
              width: getHorizontalSize(327),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgBg,
                    height: getVerticalSize(120),
                    width: getHorizontalSize(327),
                    radius: BorderRadius.circular(getHorizontalSize(8)),
                    alignment: Alignment.topCenter,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: getPadding(left: 87, right: 87),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(getHorizontalSize(44)),
                            child: Icon(
                              customIcon,
                              size: getSize(44),
                            ),
                          ),
                          Padding(
                            padding: getPadding(top: 9),
                            child: Obx(() {
                              if (recon.isLoading.value) {
                                return const Center(child: CircularProgressIndicator());
                              } else if (recon.reconList.isEmpty) {
                                return const Center(child: Text(''));
                              } else {
                                return Text(
                                  recon.reconList.first.full_name,
                                  style: CustomTextStyles.titleMediumErrorContainer,
                                );
                              }
                            }),
                          ),
                          Obx(() => CustomCheckboxButton(
                                text: "lbl_open_to_work".tr,
                                value: controller.opentowork.value,
                                margin: getMargin(top: 5),
                                textStyle: CustomTextStyles.titleSmallPoppinsBluegray300,
                                onChange: (value) {
                                  controller.opentowork.value = value;
                                },
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Job Title
            Container(
              width: getHorizontalSize(272),
              margin: getMargin(left: 52, top: 15, right: 50),
              child: Obx(() {
                if (recon.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (recon.candlist.isEmpty) {
                  return const Center(child: Text(''));
                } else {
                  return Text(
                    recon.candlist.first.position,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium!.copyWith(height: 1.57),
                  );
                }
              }),
            ),
            // Applied and Reviewed Stats
            Padding(
              padding: getPadding(left: 24, top: 17, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildStatisticContainer("lbl_25".tr, "lbl_applied".tr),
                  buildStatisticContainer("lbl_10".tr, "lbl_reviewed".tr, marginLeft: 19),
                ],
              ),
            ),
            // Divider
            Padding(
              padding: getPadding(top: 24),
              child: Divider(color: appTheme.indigo50),
            ),
            // Attach CV Button and View Attached CV
            Container(
              margin: getMargin(left: 24, top: 24, right: 24),
              padding: getPadding(left: 16, top: 15, right: 16, bottom: 15),
              decoration: AppDecoration.outlineIndigo.copyWith(borderRadius: BorderRadiusStyle.circleBorder12),
              child: Center(
                child: Column(
                  children: [
                    CustomElevatedButton(
                      height: getVerticalSize(28),
                      width: getHorizontalSize(100),
                      text: "Attach CV",
                      buttonTextStyle: theme.textTheme.labelLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 11.0,
                      ),
                      buttonStyle: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 16, 63, 102),
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 5,
                      ),
                      onTap: () async {
                        FilePickerResult? result = await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['pdf'],
                        );

                        if (result != null) {
                          PlatformFile file = result.files.first;
                          if (file.path != null) {
                            String? message = await uploadFileToServer(file.path!, file.name);
                            Get.snackbar('Upload Status', message ?? 'An error occurred while uploading the file.');
                          }
                        } else {
                          print("File path is null");
                        }
                      },
                    ),
                    const SizedBox(height: 10), // Add some spacing
                    Obx(() {
                      if (recon.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (recon.candlist.isEmpty) {
                        return const Center(child: Text(''));
                      } else {
                        if (recon.candlist.first.updated__masked_cv != null && recon.candlist.first.updated__masked_cv.isNotEmpty) {
                          return CustomElevatedButton(
                            height: getVerticalSize(28),
                            width: getHorizontalSize(120),
                            text: "View Attached CV",
                            buttonTextStyle: theme.textTheme.labelLarge!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 11.0,
                            ),
                            buttonStyle: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 16, 63, 102),
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 5,
                            ),
                            onTap: () {
                              print("View CV tapped");
                              Get.to(() => UploadedPage(fileUrl: recon.candlist.first.updated__masked_cv));
                            },
                          );
                        } else {
                          return const Center(child: Text('No CV available'));
                        }
                      }
                    })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ),
)

    //       SizedBox(
        
    //       width: mediaQueryData.size.width,
    //       child: RefreshIndicator(
    //         // onRefresh: refreshData,
    //       onRefresh: () async {
    //         // Refresh data by calling the profile details fetch function
    //         await recon.profileDetails();
    //         await recon.exp_edu_Details();
    //       },
    //       child: SingleChildScrollView(
            
    //         padding: getPadding(top: 30),
    //         child: Padding(
    //           padding: getPadding(bottom: 5),
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             children: [
    //               // Profile Banner
    //               SizedBox(
    //                 height: getVerticalSize(225),
    //                 width: getHorizontalSize(327),
    //                 child: Stack(
    //                   alignment: Alignment.bottomCenter,
    //                   children: [
    //                     CustomImageView(
    //                       imagePath: ImageConstant.imgBg,
    //                       height: getVerticalSize(120),
    //                       width: getHorizontalSize(327),
    //                       radius: BorderRadius.circular(getHorizontalSize(8)),
    //                       alignment: Alignment.topCenter,
    //                     ),
    //                     Align(
    //                       alignment: Alignment.bottomCenter,
    //                       child: Padding(
    //                         padding: getPadding(left: 87, right: 87),
    //                         child: Column(
    //                           mainAxisSize: MainAxisSize.min,
    //                           mainAxisAlignment: MainAxisAlignment.start,
    //                           children: [
    //                            ClipRRect(
    // borderRadius: BorderRadius.circular(getHorizontalSize(44)),
    // child: Icon(
    //  IconData(0xe491, fontFamily: 'MaterialIcons'),
    //   size: getSize(44), // Adjust this to fit within the container
    //   // color: Colors.blue, // Customize icon color if needed
    // ),),
    //                             // CustomImageView(
    //                             //   icon: ImageConstant.img63,
    //                             //   height: getSize(89),
    //                             //   width: getSize(89),
    //                             //   radius: BorderRadius.circular(getHorizontalSize(44)),
    //                             // ),
    //                             Padding(
    //                             padding: getPadding(top: 9),
    //                             child:Obx(() {
    //                               if (recon.isLoading.value) {
    //                                 return const Center(child: CircularProgressIndicator());
    //                               } else if (recon.reconList.isEmpty) {
    //                                 return const Center(child: Text(''));
    //                               } else {
    //                                 return 
    //                                 RefreshIndicator(
    //                                   onRefresh: () async {
    //                                     await recon.profileDetails();
    //                                     print(recon.reconList.first.full_name);
    //                                   },
                                      
                                                      
    //                                   child:Text(
    //                                       recon.reconList.first.full_name, // Dynamically fetching the first name
    //                                       style: CustomTextStyles.titleMediumErrorContainer,
    //                                     )
    //                                 );
    //                               }
    //                             }),
    //                             ),
    //                             Obx(() => CustomCheckboxButton(
    //                                   text: "lbl_open_to_work".tr,
    //                                   value: controller.opentowork.value,
    //                                   margin: getMargin(top: 5),
    //                                   textStyle: CustomTextStyles.titleSmallPoppinsBluegray300,
    //                                   onChange: (value) {
    //                                     controller.opentowork.value = value;
    //                                   },
    //                                 )),
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               // Job Title
    //               Container(
    //                 width: getHorizontalSize(272),
    //                 margin: getMargin(left: 52, top: 15, right: 50),
    //                 child:Obx(() {
    //                   if (recon.isLoading.value) {
    //                     return const Center(child: CircularProgressIndicator());
    //                   } else if (recon.candlist.isEmpty) {
    //                     return const Center(child: Text(''));
    //                   } else {
    //                     return RefreshIndicator(
    //                                   onRefresh: () async {
    //                                     await recon.profileDetails();
    //                                     print(recon.reconList.first.full_name);
    //                                   },
                                      
                                                      
    //                                   child:Text(
    //                       recon.candlist.first.position,
    //                       maxLines: 2,
    //                       overflow: TextOverflow.ellipsis,
    //                       textAlign: TextAlign.center,
    //                       style: theme.textTheme.bodyMedium!.copyWith(height: 1.57),
    //                     ));
                        
    //                   }
    //                 })
    //                 // child: Text(
    //                 //   "msg_ui_ux_designer".tr,
    //                 //   maxLines: 2,
    //                 //   overflow: TextOverflow.ellipsis,
    //                 //   textAlign: TextAlign.center,
    //                 //   style: theme.textTheme.bodyMedium!.copyWith(height: 1.57),
    //                 // ),
    //               ),
    //               // Applied and Reviewed Stats
    //               Padding(
    //                 padding: getPadding(left: 24, top: 17, right: 24),
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     buildStatisticContainer("lbl_25".tr, "lbl_applied".tr),
    //                     buildStatisticContainer("lbl_10".tr, "lbl_reviewed".tr, marginLeft: 19),
    //                   ],
    //                 ),
    //               ),
    //               // Divider
    //               Padding(
    //                 padding: getPadding(top: 24),
    //                 child: Divider(color: appTheme.indigo50),
    //               ),
    //               // About Me Section
    //               // buildProfileSection("lbl_about_me".tr, "msg_lorem_ipsum_dolor8".tr, 5),
    //               // Skills Section
    //               // buildSkillsSection(),
    //               // Experience Section
    //               // buildExperienceSection(),
    //               // Education Section
    //               // buildEducationSection(),
    //               // Padding(
    //               //   padding: getPadding(top: 24),
    //               //   child: Divider(color: appTheme.indigo50),
    //               // ),
                 

    //               Container(

    //                 margin: getMargin(left: 24, top: 24, right: 24),
    //                 padding: getPadding(left: 16, top: 15, right: 16, bottom: 15),
                   
    //                 decoration: AppDecoration.outlineIndigo.copyWith(borderRadius: BorderRadiusStyle.circleBorder12),
    //                 child: Center(
    //                   child: Column(
    //                   children:[ 
    //                     CustomElevatedButton(
    //                     height: getVerticalSize(28),
    //                     width: getHorizontalSize(100),
    //                     text: "Attach CV",
    //                     buttonTextStyle: theme.textTheme.labelLarge!.copyWith(
    //                       color: Colors.white,
    //                       fontWeight: FontWeight.bold,
    //                       fontSize: 11.0,
    //                     ),
    //                     buttonStyle: ElevatedButton.styleFrom(
    //                       primary: Color.fromARGB(255, 16, 63, 102),
    //                       onPrimary: Colors.white,
    //                       shape: RoundedRectangleBorder(
    //                         borderRadius: BorderRadius.circular(12),
    //                       ),
    //                       elevation: 5,
    //                     ),
    //                     onTap: () async {
    //                       FilePickerResult? result = await FilePicker.platform.pickFiles(
    //                         type: FileType.custom,
    //                         allowedExtensions: ['pdf'],
    //                       );

    //                       if (result != null) {
    //                         PlatformFile file = result.files.first;
    //                         if (file.path != null) {
                              
    //                           String? message = await uploadFileToServer(file.path!, file.name);
    //                           Get.snackbar('Upload Status', message ?? 'An error occurred while uploading the file.');
                              
    //                             }
                              
                              
    //                         } else {
    //                           print("File path is null");
    //                         }
    //                     }
                          
                          
                        
    //                   ),
    //                   SizedBox(height: 10), // Add some spacing
    //                   Obx(() {
    //                   if (recon.isLoading.value) {
    //                     return const Center(child: CircularProgressIndicator());
    //                   } else if (recon.candlist.isEmpty) {
    //                     return const Center(child: Text(''));
    //                   } else {
    //                       if (recon.candlist.first.updated__masked_cv != null && recon.candlist.first.updated__masked_cv.isNotEmpty) {
    //                       print(recon.candlist.first.updated__masked_cv);
    //                       return RefreshIndicator(
    //                         onRefresh: () async {
    //                         await recon.exp_edu_Details();
    //                         // String cvurl = recon.candlist.first.updated__masked_cv;
    //                       },
    //                       child: CustomElevatedButton(
    //                         height: getVerticalSize(28),
    //                         width: getHorizontalSize(120),
    //                         text: "View Attached CV",
    //                         buttonTextStyle: theme.textTheme.labelLarge!.copyWith(
    //                           color: Colors.white,
    //                           fontWeight: FontWeight.bold,
    //                           fontSize: 11.0,
    //                         ),
    //                         buttonStyle: ElevatedButton.styleFrom(
    //                           primary: const Color.fromARGB(255, 16, 63, 102),
    //                           onPrimary: Colors.white,
    //                           shape: RoundedRectangleBorder(
    //                             borderRadius: BorderRadius.circular(12),
    //                           ),
    //                           elevation: 5,
    //                         ),
    //                         onTap: () =>{
    //                         print("hiiii"),
    
    //                          Get.to(() => UploadedPage(fileUrl: recon.candlist.first.updated__masked_cv))
    //                         }
    //                         )
    //                       );
    //                       }
    //                       else {
    //   return const Center(child: Text(''));
    // }
    //                   }
    //                 })
    //                   ]
    //                   )
    //                 )
                    
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //       )
      ),
    );
    
  }
  onTapArrowbackone() {
    Get.back();
  }
//   Widget buildpdf(BuildContext context) {
//   return Scaffold(
//       body: Container(
//           child: SfPdfViewer.network(
//               'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf')));
// }
  // Helper to create stat blocks for 'Applied' and 'Reviewed'
  Widget buildStatisticContainer(String valueText, String labelText, {double marginLeft = 0}) {
    return Container(
      width: getHorizontalSize(154),
      margin: getMargin(left: marginLeft),
      padding: getPadding(left: 30, top: 12, right: 20, bottom: 12),
      decoration: AppDecoration.fillGray200.copyWith(borderRadius: BorderRadiusStyle.roundedBorder24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(valueText, style: CustomTextStyles.titleMediumBold_1),
          SizedBox(width: 8),
          Text(labelText, style: theme.textTheme.labelLarge),
        ],
      ),
    );
  }

  // Builds the profile section (About Me, Skills, etc.)
  Widget buildProfileSection(String title, String content, int maxLines) {
    return 
    Container(
      margin: getMargin(left: 24, top: 22, right: 24),
      padding: getPadding(left: 16, top: 14, right: 16, bottom: 14),
      decoration: AppDecoration.outlineIndigo.copyWith(borderRadius: BorderRadiusStyle.circleBorder12),

      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: CustomTextStyles.titleMediumInter),
              GestureDetector(
                onTap: () => showEditBioDialog(recon.reconList.first.bio),
                child: Icon(Icons.edit, size: 24),
              ),
              // CustomImageView(svgPath: ImageConstant.imgEditsquare, height: getSize(24), width: getSize(24)),
            ],
          ),
          SizedBox(height: 14),
          Obx(() {
            if (recon.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (recon.reconList.isEmpty) {
              return const Center(child: Text(''));
            } else {
              return RefreshIndicator(
                onRefresh: () async {
                  await recon.profileDetails();
                },
                child: Text(
                    recon.reconList.first.bio, // Assuming `bio` is the field to display
                    maxLines: 120,
                    overflow: TextOverflow.ellipsis,
                    style: CustomTextStyles.titleSmallBluegray400_1.copyWith(height: 1.57),
                  ),
              );
            }
          }),
          // Text(content, maxLines: maxLines, overflow: TextOverflow.ellipsis, style: CustomTextStyles.titleSmallBluegray400_1.copyWith(height: 1.57)),
        ],
      ),
    );
  }
  
  // Builds the skills section
  Widget buildSkillsSection() {
    return Container(
      margin: getMargin(left: 24, top: 24, right: 24),
      padding: getPadding(left: 16, top: 15, right: 16, bottom: 15),
      decoration: AppDecoration.outlineIndigo.copyWith(borderRadius: BorderRadiusStyle.circleBorder12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: getPadding(left: 7, right: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: getPadding(top: 1, bottom: 2),
                  child: Text("lbl_skills".tr, style: CustomTextStyles.titleMediumInter),
                ),
                GestureDetector(
                  onTap: () => showEditskillDialog(recon.reconList.first.interest),
                  child: Icon(Icons.edit, size: 24),
                ),
                // CustomImageView(svgPath: ImageConstant.imgEditsquare, height: getSize(24), width: getSize(24)),
              ],
            ),
          ),
          Padding(
            padding: getPadding(top: 12, bottom: 17),
            child:Obx(() {
            if (recon.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (recon.reconList.isEmpty) {
              return const Center(child: Text(''));
            } else {
              return RefreshIndicator(
                onRefresh: () async {
                  await recon.profileDetails();
                },
                  child: Text(recon.reconList.first.interest, 
                  style: TextStyle(
            color: theme.colorScheme.primary,
            fontSize: getFontSize(
              14,
            ),
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w600,
          ),),
            );}
            })),
            
        ],
      ),
    );
  }

  // Builds the experience section
  Widget buildExperienceSection() {
    return Container(
      margin: getMargin(left: 24, top: 24, right: 24),
      padding: getPadding(left: 16, top: 15, right: 16, bottom: 15),
      decoration: AppDecoration.outlineIndigo.copyWith(borderRadius: BorderRadiusStyle.circleBorder12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(padding: getPadding(top: 2), child: Text("lbl_experience".tr, style: CustomTextStyles.titleMediumInter)),
              
              // CustomImageView(svgPath: ImageConstant.imgEditsquare, height: getSize(24), width: getSize(24)),
            ],
          ),
          SizedBox(height: getVerticalSize(12)),
          Obx(() {
            if (recon.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (recon.candlist.isEmpty) {
              return const Center(child: Text(''));
            } else {
              // print(recon.candlist.first.highest_degree);
                return RefreshIndicator(
                  onRefresh: () async {
                    await recon.exp_edu_Details();
                    // String cvurl = recon.candlist.first.updated__masked_cv;
                  },
                  child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // Ensure proper alignment
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Current Employer: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold, // Bold for label
                              color: Colors.black87, // Visible color
                              fontSize: getFontSize(14),
                              fontFamily: 'Plus Jakarta Sans',
                            ),
                          ),
                          TextSpan(
                            text: '${recon.candlist.first.current_employer ?? ''}', // Normal for value
                            style: TextStyle(
                              fontWeight: FontWeight.normal, // Normal weight for value
                              color: Colors.black87, // Visible color
                              fontSize: getFontSize(14),
                              fontFamily: 'Plus Jakarta Sans',
                            ),
                          ),
                        ],
                      ),
                      maxLines: 2, // Set a reasonable maxLines
                      overflow: TextOverflow.ellipsis, // Handle overflow
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Indian Experience: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold, // Bold for label
                              color: Colors.black87, // Visible color
                              fontSize: getFontSize(14),
                              fontFamily: 'Plus Jakarta Sans',
                            ),
                          ),
                          TextSpan(
                            text: '${recon.candlist.first.india_experience ?? ''}', // Normal for value
                            style: TextStyle(
                              fontWeight: FontWeight.normal, // Normal weight for value
                              color: Colors.black87, // Visible color
                              fontSize: getFontSize(14),
                              fontFamily: 'Plus Jakarta Sans',
                            ),
                          ),
                        ],
                      ),
                      maxLines: 2, // Set a reasonable maxLines
                      overflow: TextOverflow.ellipsis, // Handle overflow
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Overseas Experience: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold, // Bold for label
                              color: Colors.black87, // Visible color
                              fontSize: getFontSize(14),
                              fontFamily: 'Plus Jakarta Sans',
                            ),
                          ),
                          TextSpan(
                            text: '${recon.candlist.first.overseas_experience ?? ''}', // Normal for value
                            style: TextStyle(
                              fontWeight: FontWeight.normal, // Normal weight for value
                              color: Colors.black87, // Visible color
                              fontSize: getFontSize(14),
                              fontFamily: 'Plus Jakarta Sans',
                            ),
                          ),
                        ],
                      ),
                      maxLines: 2, // Set a reasonable maxLines
                      overflow: TextOverflow.ellipsis, // Handle overflow
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Total Experience: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold, // Bold for label
                              color: Colors.black87, // Visible color
                              fontSize: getFontSize(14),
                              fontFamily: 'Plus Jakarta Sans',
                            ),
                          ),
                          TextSpan(
                            text: '${recon.candlist.first.total_experience ?? ''}', // Normal for value
                            style: TextStyle(
                              fontWeight: FontWeight.normal, // Normal weight for value
                              color: Colors.black87, // Visible color
                              fontSize: getFontSize(14),
                              fontFamily: 'Plus Jakarta Sans',
                            ),
                          ),
                        ],
                      ),
                      maxLines: 2, // Set a reasonable maxLines
                      overflow: TextOverflow.ellipsis, // Handle overflow
                    )

                    
                  ],
                )
              );
            }
          })
        ],
      ),
    );
  }

  // Builds the education section
  Widget buildEducationSection() {
    return Container(
      margin: getMargin(left: 24, top: 24, right: 24),
      padding: getPadding(left: 16, top: 15, right: 16, bottom: 15),
      decoration: AppDecoration.outlineIndigo.copyWith(borderRadius: BorderRadiusStyle.circleBorder12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(padding: getPadding(top: 2), child: Text("lbl_education".tr, style: CustomTextStyles.titleMediumInter)),
              // CustomImageView(svgPath: ImageConstant.imgEditsquare, height: getSize(24), width: getSize(24)),
            ],
          ),
          SizedBox(height: getVerticalSize(12)),
          Obx(() {
            if (recon.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (recon.candlist.isEmpty) {
              return const Center(child: Text(''));
            } else {
              return RefreshIndicator(
                onRefresh: () async {
                  await recon.exp_edu_Details();
                  // String cvurl = recon.candlist.first.updated__masked_cv;
                },
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // Ensure proper alignment
                  children: [
                    
                    Text(
                      
                      '${recon.candlist.first.highest_degree ?? ''} (${recon.candlist.first.specialization ?? ''}) - ${recon.candlist.first.year_of_passing ?? ''}',
                      maxLines: 2, // Set a reasonable maxLines
                      overflow: TextOverflow.ellipsis, // Handle overflow
                      style: TextStyle(
                        color: Colors.black87, // Use visible color
                        fontSize: getFontSize(14),
                        fontFamily: 'Plus Jakarta Sans',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
              );
            }
          })

        ],
      ),
    );
    
  }

Future<void> showEditBioDialog(String currentBio) async {
    TextEditingController bioController = TextEditingController();
    
    Get.defaultDialog(
      title: "Edit Bio",
      content: CustomTextFormField(
            controller: bioController,
            maxLines: 4,
            margin: getMargin(top: 5),
            hintText: "Enter new bio",
            hintStyle: TextStyle(color: Color.fromARGB(255, 139, 139, 139),fontSize: 12),
        
            textInputAction: TextInputAction.done,
            // textInputType: TextInputType.emailAddress,
            textStyle: TextStyle(color: const Color.fromRGBO(0, 0, 0, 1)),
            
            
          ),
          textConfirm: 'Save',
          confirmTextColor: Colors.black,
          onConfirm: () async {
            String updatedBio = bioController.text;
              print(bioController.text);
              await recon.updateBio(updatedBio);  // Update bio on server
              Get.back(); 
          });
      
      
        // children: [
          
          // TextField(
          //   controller: bioController,
          //   maxLines: 4,
          //   decoration: InputDecoration(
          //     border: OutlineInputBorder(),
          //     hintText: "Enter new bio",
          //   ),
          // ),
          // SizedBox(height: 10),
          // CustomElevatedButton(
          //   height: getVerticalSize(25),
          //   width: getHorizontalSize(100),
          //   text: "Save",
          //   buttonTextStyle: theme.textTheme.labelLarge!.copyWith(
          //     color: Colors.white,
          //     fontWeight: FontWeight.bold,
          //     fontSize: 14.0,
          //   ),
          //   buttonStyle: ElevatedButton.styleFrom(
          //     primary: Color.fromARGB(255, 16, 63, 102),
          //     onPrimary: Colors.white,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(12),
          //     ),
          //     elevation: 5,
          //   ),
            
            // onTap: () async {
            //               String updatedBio = bioController.text;
            //   print(bioController);
            //   await recon.updateBio(updatedBio);
            //             }
              
                
              
          // ),
          // ElevatedButton(
          //   on: () async {
          //     String updatedBio = bioController.text;
          //     print(bioController);
          //     await recon.updateBio(updatedBio);  // Update bio on server
          //     // Get.back();  // Close dialog
          //   },
          //   child: Text("Save"),
          // ),
        // ],
      // ),
    // );
    // print("hoo");
  }
  void showEditskillDialog(String currentinterest) {
    TextEditingController skillController = TextEditingController(text: currentinterest);

    Get.defaultDialog(
      title: "Edit Skill",
      content: Column(
        children: [
          TextField(
            controller: skillController,
            maxLines: 4,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter new skill",
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () async {
              String updateSkill = skillController.text;
              print(updateSkill);
              await recon.updateSkills(updateSkill);  // Update bio on server
              Get.back();  // Close dialog
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }
  
  Future<void> saveFileToNewLocation(File file) async {
  try {
    // Get the app's documents directory
    Directory appDocDir = await getApplicationDocumentsDirectory();
    // Define the destination path with the original file name
    String newPath = path.join(appDocDir.path, path.basename(file.path));

    // Copy the file to the new path
    await file.copy(newPath);
    print("File saved to: $newPath");
  } catch (e) {
    print("Error saving file: $e");
  }
}

Future<String?> uploadFileToServer(String filePath, String fileName) async {
  final url = Uri.parse("https://erp.teamproit.com/api/method/upload_file");
  
  try {
    // Prepare the file and request
    File file = File(filePath);
    var request = http.MultipartRequest('POST', url)
      ..files.add(await http.MultipartFile.fromPath('file', file.path, filename: fileName));

    // Send the request
    var response = await request.send();

    if (response.statusCode == 200) {
      String api_url='${Globals.url}/api/resource/File?filters=[["file_name","like","%$fileName"]]&fields=["file_url"]&order_by="creation DSEC"';
      try {
      print('Recon URL: $api_url'); 
      String apiKey = 'daa4a43f429c844';
      String apiSecret = '3b0d3fbc3c5e4ce';
      String token = 'token $apiKey:$apiSecret';
      var response = await http.get(
          Uri.parse(api_url),
          headers: {
            'Authorization': token,
          },
        );
      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);

  // Check if 'data' exists and is not empty
      if (jsonData['data'] != null && jsonData['data'].isNotEmpty) {
        // Extract the file_url
        String fileUrl = jsonData['data'][0]['file_url'];
        print("File URL: $fileUrl");
        fileController.setfileurl(fileUrl);
        attachedCvUrl = fileUrl;
        // buildAttachedCvUrl(attachedCvUrl);
        // String email = "siva.m@groupteampro.com";
        print(_authManager.getToken()!);
        
        recon.updateCv( _authManager.getToken()!,fileUrl);
        return fileUrl;
      } else {
        print("Unexpected response: ${response.statusCode}");
      }
      }
    } catch (e) {
      print('Exception');
      // Get.snackbar('Error', 'An error occurred: $e');
    }
      print("File uploaded successfully! File URL");

      // Return the file URL for further use
      
    } else {
      print("Failed to upload file. Status code: ${response.statusCode}");
    }
  } catch (e) {
    print("Error uploading file: $e");
  }
}

  // void onTapImage() {
  //   Get.toNamed(AppRoutes.settingsScreen);
  // }
  
  void setState(Null Function() param0) {}
}


class UploadedPage extends StatefulWidget {
  final String fileUrl;
  const UploadedPage({
    super.key,
    required this.fileUrl,
  });

  @override
  State<UploadedPage> createState() => _UploadedPageState();
}

class _UploadedPageState extends State<UploadedPage> {
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      appBar: CustomAppBar(
          leadingWidth: getHorizontalSize(1),
          leading: 
          Row(children: [

              AppbarImage(
            svgPath: ImageConstant.imgGroup162799,
            margin: getMargin(left: 24, top: 13, bottom: 14),
            
            onTap: () =>{
              print("hiiii"),
                Get.to(() =>JobDetailsPage())
              }
          ),

            Padding(
              padding: getPadding(left: 0),
              child: Image.asset(
                "assets/images/TEAMPRO_STROKE_2.png",
                height: getSize(190),
                width: getSize(100),
                fit: BoxFit.contain,
              ),)

          ]),
          centerTitle: true,
          title: AppbarTitle(text: "CV"),
          
        ),
      body: Container(
        
        child: SfPdfViewer.network(
              widget.fileUrl)));
  
    
  }
  
}
