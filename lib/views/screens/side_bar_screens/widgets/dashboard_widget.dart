import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  // Sample data: top sellers and their earnings
  final List<Seller> topSellers = [
    Seller(name: 'Pooja Textile', earnings: 1500),
    Seller(name: 'Seller wala', earnings: 2000),
    Seller(name: 'Shah Industries', earnings: 1800),
  ];

  final List<Seller> topGrossingProduct = [
    Seller(name: 'Dell Laptop', earnings: 15),
    Seller(name: 'Xyz', earnings: 2),
    Seller(name: 'Frock', earnings: 24),
  ];

  final List<Seller> totalProfits = [
    Seller(name: 'Jan', earnings: 1200000),
    Seller(name: 'Feb', earnings: 2000000),
    Seller(name: 'March', earnings: 2800000),
  ];

  final List<Category> categories = [
    Category(name: 'Electronics', products: 5),
    Category(name: 'Man', products: 3),
    Category(name: 'Asseccories', products: 4),
    Category(name: 'Woman', products: 4),
    Category(name: 'Home & Living', products: 1),
    Category(name: 'Kids', products: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width / 3,
                child: BarChart(
                  BarChartData(
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, _) {
                            // Ensure value is within valid range
                            if (value < 0 || value >= topSellers.length)
                              return SizedBox();

                            // Return seller name for the corresponding index
                            return Text(
                              topSellers[value.toInt()].name,
                              style: TextStyle(fontSize: 14),
                            );
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(show: true),
                    maxY: 3000,
                    barGroups: List.generate(
                      topSellers.length,
                      (index) => BarChartGroupData(
                        x: index,
                        barRods: [
                          BarChartRodData(
                            toY: topSellers[index].earnings.toDouble(),
                            color: Colors.blue,
                            width: 20,
                            borderRadius: BorderRadius.zero,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width / 3,
                child: BarChart(
                  BarChartData(
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, _) {
                            // Ensure value is within valid range
                            if (value < 0 || value >= topGrossingProduct.length)
                              return SizedBox();

                            // Return seller name for the corresponding index
                            return Text(
                              topGrossingProduct[value.toInt()].name,
                              style: TextStyle(fontSize: 14),
                            );
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(show: true),
                    maxY: 30,
                    barGroups: List.generate(
                      topGrossingProduct.length,
                      (index) => BarChartGroupData(
                        x: index,
                        barRods: [
                          BarChartRodData(
                            toY: topGrossingProduct[index].earnings.toDouble(),
                            color: Colors.blue,
                            width: 20,
                            borderRadius: BorderRadius.zero,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Top seller by earning",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Top grossing product",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width / 3,
                child: BarChart(
                  BarChartData(
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, _) {
                            // Ensure value is within valid range
                            if (value < 0 || value >= totalProfits.length)
                              return SizedBox();

                            // Return seller name for the corresponding index
                            return Text(
                              totalProfits[value.toInt()].name,
                              style: TextStyle(fontSize: 14),
                            );
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(show: true),
                    maxY: 5000000,
                    barGroups: List.generate(
                      totalProfits.length,
                      (index) => BarChartGroupData(
                        x: index,
                        barRods: [
                          BarChartRodData(
                              toY: totalProfits[index].earnings.toDouble(),
                              color: Colors.blue,
                              width: 20,
                              borderRadius: BorderRadius.zero),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width / 3,
                child: PieChart(
                  PieChartData(
                    sectionsSpace: 0,
                    centerSpaceRadius: 0,
                    sections: List.generate(
                      categories.length,
                      (index) {
                        final category = categories[index];
                        return PieChartSectionData(
                          color: getColor(index),
                          value: category.products.toDouble(),
                          title: category.name,
                          radius: 150,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Monthly profit overall",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Categories",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Function to assign a color to each category
Color getColor(int index) {
  switch (index % 6) {
    case 0:
      return Colors.blue;
    case 1:
      return Colors.green;
    case 2:
      return Colors.orange;
    case 3:
      return Colors.red;
    case 4:
      return Colors.purple;
    case 5:
      return Colors.brown;
    default:
      return Colors.blue;
  }
}

class Seller {
  final String name;
  final int earnings;

  Seller({required this.name, required this.earnings});
}

class Category {
  final String name;
  final int products;

  Category({required this.name, required this.products});
}
