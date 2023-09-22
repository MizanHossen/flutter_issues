import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_issues/helpers/constants/constants.dart';
import 'package:flutter_issues/controllers/home_controller.dart';
import 'package:flutter_issues/widgets/issues_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    if (homeController.issuesData.isEmpty && !homeController.isLoading.value) {
      homeController.getData();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Flutter Issues ",
          style: kHeadingTextStyle.copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // *********************************************************** Header Section & Search ************************************
              Text(
                "Issues List",
                style: kHeadingTextStyle,
              ),
              gapHeight(size: 10),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.05,
                child: TextFormField(
                  cursorColor: kPrimaryColor,
                  decoration: InputDecoration(
                    fillColor: white,
                    labelStyle: kTitleTextstyle.copyWith(fontSize: 12.sp),
                    hintText: "Search ",
                    hintStyle: kSubtitleStye,
                    prefixIcon: const Icon(Icons.search),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60.r),
                      borderSide:
                          const BorderSide(color: kPrimaryColor, width: 0.0),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60.r),
                      borderSide:
                          const BorderSide(color: kPrimaryColor, width: 0.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60.r),
                      borderSide:
                          const BorderSide(color: kPrimaryColor, width: 0.0),
                    ),
                  ),
                ),
              ),
              gapHeight(size: 10),
              Expanded(
                child: homeController.issuesData.isEmpty
                    ? Center(
                        child: Text(
                          "No Data :-(",
                          style: kHeadingTextStyle,
                        ),
                      )
                    : ListView.builder(
                        controller: homeController.scrollController,
                        itemCount: homeController.issuesData.length,
                        itemBuilder: (context, index) {
                          var data = homeController.issuesData[index];

                          return IssuesCard(
                            data: data,
                          );
                        },
                      ),
              ),
              if (homeController.isLoading.value)
                const Center(
                  child: CupertinoActivityIndicator(
                    radius: 30,
                    color: kPrimaryColor,
                  ),
                ),
              // if (!homeController.isLimit.value &&
              //     !homeController.isLoading.value)
              //   const Center(
              //     child: CircularProgressIndicator(
              //       color: Colors.red,
              //     ),
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
