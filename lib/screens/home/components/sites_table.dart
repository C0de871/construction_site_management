import 'package:construction_site_management/core/config/Colors/app_colors.dart';
import 'package:construction_site_management/core/config/constants/app_strings.dart';
import 'package:construction_site_management/model/home_site_information.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class SitesTable extends StatelessWidget {
  const SitesTable({
    super.key,
    required this.sitesDataSource,
  });

  final SitesDataSource sitesDataSource;
//temp list:
  @override
  Widget build(BuildContext context) {
    // return Container();
    return SfDataGridTheme(
      data: const SfDataGridThemeData(
        gridLineStrokeWidth: 1,
        gridLineColor: Color.fromARGB(255, 228, 234, 236),
        headerColor: Color(0xFFF1F7F9),
      ),
      child: SfDataGrid(
        source: sitesDataSource,
        columns: buildGridColumns(),
        gridLinesVisibility: GridLinesVisibility.both,
        // headerGridLinesVisibility: GridLinesVisibility.both,

        columnWidthMode: ColumnWidthMode.fill,
      ),
    );
  }

  List<GridColumn> buildGridColumns() => <GridColumn>[
        GridColumn(
          width: 100,
          columnName: SiteTableColumn.Photo.toString(),
          label: buildLabel(AppStrings.sitePhoto),
        ),
        GridColumn(
          columnName: SiteTableColumn.Name.toString(),
          label: buildLabel(AppStrings.siteName),
        ),
        GridColumn(
          columnName: SiteTableColumn.Capital.toString(),
          label: buildLabel(AppStrings.siteCapital),
        ),
        GridColumn(
          columnName: SiteTableColumn.SalePrice.toString(),
          label: buildLabel(AppStrings.siteSalePrice),
        ),
        GridColumn(
          columnName: SiteTableColumn.ProfitRatio.toString(),
          label: buildLabel(AppStrings.siteProfitRatio),
        ),
        GridColumn(
          columnName: SiteTableColumn.FinancialStatus.toString(),
          label: buildLabel(AppStrings.siteFinancialStatus),
        ),
        GridColumn(
          columnName: SiteTableColumn.TechnicalStatus.toString(),
          label: buildLabel(AppStrings.siteTechnicalStatus),
        ),
      ];

  Widget buildLabel(String text) => Center(
        child: Text(
          text,
          style: const TextStyle(color: Color(0xFF4B6269)),
          textAlign: TextAlign.center,
        ),
      );
}

class SitesDataSource extends DataGridSource {
  late List<DataGridRow> _homeSites;
  List<HomeSiteInformation> homeSitesInformation;

  @override
  List<DataGridRow> get rows => _homeSites;

  SitesDataSource({required this.homeSitesInformation}) {
    buildDataGrid();
  }

  void buildDataGrid() => _homeSites = homeSitesInformation.map<DataGridRow>(
        (siteInfo) {
          return DataGridRow(
            cells: SiteTableColumn.values
                .map(
                  (column) => DataGridCell<HomeSiteInformation>(
                    columnName: column.toString(),
                    value: siteInfo,
                  ),
                )
                .toList(),
          );
        },
      ).toList();

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>(
        (dataGridCell) {
          final HomeSiteInformation homeSiteInformation = dataGridCell.value;

          final column = SiteTableColumn.values.firstWhere(
            (value) => value.toString() == dataGridCell.columnName,
          );

          switch (column) {
            case SiteTableColumn.Photo:
              return buildPhotoRow(homeSiteInformation.imageUrl);
            case SiteTableColumn.Name:
              return buildNameRow(homeSiteInformation.name);
            case SiteTableColumn.Capital:
              return buildCapitalRow(homeSiteInformation.capital);
            case SiteTableColumn.SalePrice:
              return buildSalePriceRow(homeSiteInformation.salePrice);
            case SiteTableColumn.ProfitRatio:
              return buildprofiteRationRow(homeSiteInformation.profitOrLoseRatio);
            case SiteTableColumn.FinancialStatus:
              return buildFinancialStatus(homeSiteInformation.financialStatus);
            default:
              return const Center(child: Text("Hello"));
          }
        },
      ).toList(),
    );
  }

  void updateDataGridSource() {
    notifyListeners();
  }

  Widget buildFinancialStatus(String status) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 2,
          bottom: 2,
        ),
        height: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.dividerColor),
        ),
        child: IntrinsicWidth(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.circle,
                size: 10,
                color: status.toLowerCase() == "open" ? const Color(0xFF0C9047) : const Color(0xFFF9400E),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                status,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildprofiteRationRow(double ratio) {
    return Center(
      child: Text(
        "%$ratio",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          //todo: move it to app color:
          color: ratio <= 0 ? Colors.red : const Color(0xFF99D158),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildNameRow(String name) {
    return Center(
      child: Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildCapitalRow(double capital) {
    return Center(
      child: Text(
        "$capital",
        style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF505D51)),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildSalePriceRow(double salePrice) {
    return Center(
      child: Text(
        "$salePrice",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFF505D51),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildPhotoRow(String imageUrl) {
    return Center(
      child: Container(
        width: 80,
        height: 40,
        // padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

// ignore: constant_identifier_names
enum SiteTableColumn {
  Photo,
  Name,
  Capital,
  SalePrice,
  ProfitRatio,
  FinancialStatus,
  TechnicalStatus,
}
