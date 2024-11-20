import 'package:construction_site_management/core/config/constants/numbers.dart';
import 'package:construction_site_management/model/home_site_information.dart';
import 'package:construction_site_management/screens/home/components/header.dart';
import 'package:construction_site_management/screens/home/components/header2.dart';
import 'package:construction_site_management/screens/home/components/left_panel.dart';
import 'package:construction_site_management/screens/home/components/sites_table.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late final List<HomeSiteInformation> sitesInfo;
  late final SitesDataSource sitesDataSource;
  @override
  void initState() {
    sitesInfo = <HomeSiteInformation>[
      HomeSiteInformation(
        name: "site 1",
        imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-C_UAhXq9GfuGO452EEzfbKnh1viQB9EDBQ&s",
        capital: 200,
        financialStatus: "Open",
        siteDeliveryStatus: "pending",
        salePrice: 1243342,
        profitOrLoseRatio: -44,
      ),
      HomeSiteInformation(
        name: "site 2",
        imageUrl: "http://www.kilterpulse.lv/UserFiles/Image/shutterstock_67527154%20(1)%20(Large).jpg",
        capital: 2003,
        financialStatus: "closed",
        siteDeliveryStatus: "pending",
        salePrice: 1243342,
        profitOrLoseRatio: 44,
      ),
      HomeSiteInformation(
        name: "site 3",
        imageUrl: "https://acropolis-wp-content-uploads.s3.us-west-1.amazonaws.com/Building-Types-Hero.webp",
        capital: 20340,
        financialStatus: "Open",
        siteDeliveryStatus: "pending",
        salePrice: 1243342,
        profitOrLoseRatio: -44,
      ),
      HomeSiteInformation(
        name: "site 4",
        imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReBPcjjpGDYjEXyC-T8oBBSqcb5cLVgY9tPg&s",
        capital: 200,
        financialStatus: "Open",
        siteDeliveryStatus: "pending",
        salePrice: 1243342,
        profitOrLoseRatio: -44,
      ),
      HomeSiteInformation(
        name: "site 5",
        imageUrl: "http://www.kilterpulse.lv/UserFiles/Image/shutterstock_67527154%20(1)%20(Large).jpg",
        capital: 200,
        financialStatus: "Open",
        siteDeliveryStatus: "pending",
        salePrice: 1243342,
        profitOrLoseRatio: 44,
      ),
      HomeSiteInformation(
        name: "site 6",
        imageUrl: "http://www.kilterpulse.lv/UserFiles/Image/shutterstock_67527154%20(1)%20(Large).jpg",
        capital: 200,
        financialStatus: "Open",
        siteDeliveryStatus: "pending",
        salePrice: 1243342,
        profitOrLoseRatio: 44,
      ),
    ];

    sitesDataSource = SitesDataSource(homeSitesInformation: sitesInfo);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const LeftPanel(),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.only(
              left: Numbers.defaultPadding * 2,
              right: Numbers.defaultPadding * 2,
              top: Numbers.defaultPadding * 2,
            ),
            child: Column(
              children: [
                const Header(),
                const SizedBox(
                  height: 100,
                ),
                Header2(
                  onPressed: () {
                    // sitesInfo.add(
                    //   HomeSiteInformation(
                    //     name: "site 7",
                    //     imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-C_UAhXq9GfuGO452EEzfbKnh1viQB9EDBQ&s",
                    //     capital: 300,
                    //     financialStatus: "closed",
                    //     siteDeliveryStatus: "pending",
                    //     salePrice: 300,
                    //     profitOrLoseRatio: 80,
                    //   ),
                    // );
                    // sitesDataSource.buildDataGrid();
                    // sitesDataSource.updateDataGridSource();
                  },
                ),
                // Header2(
                //   onPressed: () {
                //     sitesInfo[0].name = "Manar";
                //     sitesDataSource._homeSites[0].getCells()[1] = DataGridCell<HomeSiteInformation>(
                //       columnName: SiteTableColumn.Name.toString(),
                //       value: sitesInfo[0],
                //     );
                //   },
                // ),
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  child: SitesTable(
                    sitesDataSource: sitesDataSource,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}