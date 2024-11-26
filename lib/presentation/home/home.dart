import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobpro/presentation/job_details/controller/job_details_controller.dart';
import 'package:jobpro/utils/authentication_manager.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  JobController jobController = Get.put(JobController());
  // TextEditingController rackController = TextEditingController();
  // TextEditingController binController = TextEditingController();
  // TextEditingController itemCodeController = TextEditingController();
  // TextEditingController stockQtyController = TextEditingController();
  // TextEditingController physicalQtyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AuthenticationManager _authManager = Get.find();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
                onPressed: () {
                  _authManager.logOut();
                },
                icon: const Icon(Icons.logout_rounded))
          ],
        ),
        body: Obx(() {
          return jobController.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : RefreshIndicator(
                  onRefresh: () async {
                    // Call the method to fetch or update data
                    await jobController.fetchJobDetails();
                  },
                  child: ListView.builder(
                    itemCount: jobController.reconList.length,
                    itemBuilder: (context, index) {
                      print(jobController.reconList);
                      return ListTile(
                        // onTap: () {
                        //   Get.to(() => ReconEntry(),
                        //       arguments: reconController.reconList[index].name);
                        // },
                        title: Text(jobController.reconList[index].subject),
                        subtitle: Text(jobController
                            .reconList[index].subject
                            .toString()),
                      );
                    },
                  ),
                );
        }));
  }
}
