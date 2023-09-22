import 'package:flutter/material.dart';
import 'package:flutter_issues/helpers/constants/constants.dart';
import 'package:flutter_issues/models/data_model.dart';
import 'package:flutter_issues/controllers/home_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class IssuesCard extends StatelessWidget {
  final DataModel data;

  const IssuesCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    String createData = data.createdAt.toString();
    String formatedDate = homeController.convertDate(createData);
    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title.toString(),
                      style:
                          kTitleTextstyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                    gapHeight(size: 5),
                    Text(
                      data.body.toString(),
                      style: kSubtitleStye,
                    ),
                  ],
                ),
              ),

              //

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    formatedDate,
                    style:
                        kTitleTextstyle.copyWith(fontWeight: FontWeight.bold),
                  ),
                  gapHeight(size: 5),
                  Text(
                    data.user!.login.toString(),
                    style: kSubtitleStye,
                  ),
                ],
              )
            ],
          ),
          gapHeight(size: 10),
          GridView.builder(
            padding: EdgeInsets.zero,
            itemCount: data.labels!.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 3.5.r,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
            ),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, index) {
              return Container(
                // padding:
                //     EdgeInsets.symmetric(horizontal: 10.r, vertical: 5.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kPrimaryColor,
                ),
                child: Center(
                  child: Text(
                    data.labels![index].name.toString(),
                    style: kSubtitleStye.copyWith(color: white),
                  ),
                ),
              );
            },
          ),
          gapHeight(size: 5),
          const Divider(
            color: kPrimaryColor,
          )
        ],
      ),
    );
  }
}
