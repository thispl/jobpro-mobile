import 'package:flutter/material.dart';
import 'package:jobpro/core/app_export.dart';
import 'package:jobpro/widgets/app_bar/custom_app_bar.dart';
import 'package:jobpro/widgets/app_bar/appbar_image.dart';
import 'package:jobpro/widgets/app_bar/appbar_image_1.dart';
import 'package:jobpro/widgets/app_bar/appbar_title.dart';
import 'package:jobpro/widgets/custom_elevated_button.dart';
import 'package:jobpro/widgets/custom_icon_button.dart';
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

  @override
  void initState() {
    super.initState();
    final Map<String, dynamic> jobDetails = Get.arguments;
    String plainDescription = jobDetails['description']; // Use raw description HTML

    // Initialize controller with plain text
    descriptionController = TextEditingController(text: plainDescription);
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> jobDetails = Get.arguments;
    final String subject = jobDetails['subject'];
    final String customer = jobDetails['customer'];
    final String currency = jobDetails['currency'];
    final double amount = jobDetails['amount'];
    final String creation = jobDetails['creation'];
    final String position = jobDetails['position'];
    final String description = jobDetails['description'];
    final String custom_recruiter_contact = jobDetails['custom_recruiter_contact'];

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
            onTap:() { Get.toNamed(AppRoutes.jobDetails, ); },
          ),
          centerTitle: true,
          title: AppbarTitle(
            text: "lbl_job_details".tr,
          ),
          actions: [
            AppbarImage1(
              svgPath: ImageConstant.imgBookmark,
              margin: getMargin(
                left: 16,
                top: 13,
                right: 16,
                bottom: 13,
              ),
            ),
          ],
        ),
        body: SizedBox(
          height: getVerticalSize(688),
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                width: double.maxFinite,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: getPadding(top: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: getMargin(right: 14, left: 14),
                          padding: getPadding(left: 72, top: 24, right: 72, bottom: 24),
                          decoration: AppDecoration.outlineIndigo.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder16,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: getSize(79),
                                width: getSize(79),
                                padding: getPadding(all: 19),
                                decoration: AppDecoration.fillGray.copyWith(
                                  borderRadius: BorderRadiusStyle.roundedBorder39,
                                ),
                                child: CustomImageView(
                                  svgPath: ImageConstant.imgCardano1Secondarycontainer,
                                  height: getSize(40),
                                  width: getSize(40),
                                  alignment: Alignment.center,
                                ),
                              ),
                              Padding(
                                padding: getPadding(top: 16),
                                child: Text(
                                  subject,
                                  style: CustomTextStyles.titleSmallBold,
                                ),
                              ),
                              Padding(
                                padding: getPadding(top: 7),
                                child: Text(
                                  customer,
                                  style: theme.textTheme.labelLarge,
                                ),
                              ),
                              Padding(
                                padding: getPadding(left: 1, top: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomElevatedButton(
                                      height: getVerticalSize(28),
                                      width: getHorizontalSize(69),
                                      text: "lbl_fulltime".tr,
                                      buttonTextStyle: theme.textTheme.bodySmall!,
                                    ),
                                    CustomElevatedButton(
                                      height: getVerticalSize(28),
                                      width: getHorizontalSize(104),
                                      text: creation,
                                      margin: getMargin(left: 9),
                                      buttonTextStyle: theme.textTheme.bodySmall!,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: getHorizontalSize(600),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: 3),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        CustomIconButton(
                                          height: getSize(48),
                                          width: getSize(48),
                                          padding: getPadding(all: 12),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFE0F7FA),
                                            shape: BoxShape.circle,
                                          ),
                                          child: CustomImageView(svgPath: ImageConstant.imgWallet),
                                        ),
                                        Padding(
                                          padding: getPadding(top: 9),
                                          child: Text(
                                            "Salary",
                                            style: CustomTextStyles.labelLargeBluegray300,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(top: 9),
                                          child: Text(
                                            "$currency-$amount",
                                            style: CustomTextStyles.titleSmallPrimarySemiBold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        CustomIconButton(
                                          height: getSize(48),
                                          width: getSize(48),
                                          padding: getPadding(all: 12),
                                          decoration: BoxDecoration(
                                            color: Color(0xFFFFE0B2),
                                            shape: BoxShape.circle,
                                          ),
                                          child: CustomImageView(svgPath: ImageConstant.imgWork),
                                        ),
                                        Padding(
                                          padding: getPadding(top: 9),
                                          child: Text(
                                            "Position",
                                            style: CustomTextStyles.labelLargeBluegray300,
                                          ),
                                        ),
                                        Padding(
                                          padding: getPadding(top: 9),
                                          child: Text(
                                            position,
                                            
                                            style: CustomTextStyles.titleSmallPrimarySemiBold,
                                            softWrap: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 50),
                                Text(
                                  "Job Description",
                                  style: CustomTextStyles.titleMediumBluegray900,
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl
                                ),
                                // Box around the HTML content
                                Container(
                                  width: getHorizontalSize(319),
                                  margin: getMargin(left: 31, top: 13, right: 24),
                                  padding: getPadding(all: 16),  // Add padding inside the box
                                  decoration: BoxDecoration(
                                    color: Colors.white,  // Box color
                                    borderRadius: BorderRadius.circular(12),  // Rounded corners
                                    border: Border.all(
                                      color: Colors.grey.shade300,  // Border color
                                      width: 1,
                                       // Border width
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: Offset(0, 3),  // Position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Html(
                                    data: description,  // Pass the raw HTML description here
                                    style: {
                                      "body": Style(
                                        textAlign: TextAlign.left,  // Align text to the left
                                      ),
                                    },
                                  ),
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () => whatsapp(position,custom_recruiter_contact),
                                  child: Text('Apply Now'),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  whatsapp(String position,String custom_recruiter_contact) async {
    String contact = (custom_recruiter_contact.length == 10) 
        ? custom_recruiter_contact 
        : "7305428777"; 

    String text = 'Hi, I am willing to apply for the Position: $position'; // Corrected the string interpolation
    String androidUrl = "whatsapp://send?phone=$contact&text=${Uri.encodeComponent(text)}"; // Encode the message
    String iosUrl = "https://wa.me/$contact?text=${Uri.encodeComponent(text)}"; // Encode the message
    String webUrl = 'https://api.whatsapp.com/send/?phone=$contact&text=${Uri.encodeComponent(text)}'; // Encode the message

    try {
      if (Platform.isIOS) {
        if (await canLaunchUrl(Uri.parse(iosUrl))) {
          await launchUrl(Uri.parse(iosUrl));
        }
      } else {
        if (await canLaunchUrl(Uri.parse(androidUrl))) {
          await launchUrl(Uri.parse(androidUrl));
        }
      }
    } catch (e) {
      print('Error launching WhatsApp: $e');
      await launchUrl(Uri.parse(webUrl), mode: LaunchMode.externalApplication);
    }
  }
}