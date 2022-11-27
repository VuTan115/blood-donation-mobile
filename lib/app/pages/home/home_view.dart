import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:personal_financial_management/app/components/colors/my_colors.dart';
import 'package:personal_financial_management/app/components/date_picker/date_controller.dart';
import 'package:personal_financial_management/app/utils/utils.dart';
import 'package:personal_financial_management/domain/blocs/home_bloc/home_bloc.dart';
import 'package:personal_financial_management/domain/blocs/page_route/page_route_bloc.dart';
import 'package:personal_financial_management/domain/models/shared_item.dart';
import 'package:personal_financial_management/domain/models/stepCard.dart';
import 'package:personal_financial_management/domain/repositories/budget_repo.dart';
import 'package:personal_financial_management/domain/repositories/repositories.dart';
import 'package:personal_financial_management/domain/repositories/transaction_repo.dart';
import 'package:personal_financial_management/domain/repositories/user_repo.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  NavigatorState get _navigator => GlobalKeys.appNavigatorKey.currentState!;
  PageController get _pageController => GlobalKeys.pageController;
  late final UserRepository userRepository;
  late final TransactionRepository transactionRepository;
  late final BudgetRepository budgetRepository;
  late final WalletRepository walletRepository;
  late final List<StepCard> stepItems = [
    StepCard(
        1,
        "Đăng ký",
        "Bạn cần hoàn thành một biểu mẫu đăng ký rất đơn giản, chứa tất cả thông tin liên hệ bắt buộc để nhập vào quá trình quyên góp.",
        "https://blood-donation.nvquynh.codes/images/process_1.jpg"),
    StepCard(
        2,
        "Xét nghiệm",
        "Một giọt máu từ ngón tay của bạn sẽ được dùng làm xét nghiệm đơn giản để đảm bảo rằng lượng sắt trong máu của bạn đủ thích hợp cho quá trình hiến tặng.",
        "https://blood-donation.nvquynh.codes/images/process_2.jpg"),
    StepCard(
        3,
        "Hiến máu",
        "Sau khi đảm bảo và vượt qua kiểm tra sàng lọc thành công, bạn sẽ được chuyển đến giường của người hiến tặng để hiến tặng. Quá trình này chỉ mất 6-10 phút.",
        "https://blood-donation.nvquynh.codes/images/process_3.jpg"),
    StepCard(
        4,
        "Nghỉ ngơi",
        "Bạn cũng có thể ở trong phòng khách cho đến khi bạn cảm thấy đủ khỏe để rời khỏi trung tâm của chúng tôi. Bạn sẽ nhận được đồ uống tuyệt vời từ chúng tôi trong khu vực quyên góp.",
        "https://blood-donation.nvquynh.codes/images/process_4.jpg"),
  ];
  late final List<SharedItem> sharedItems = [
    SharedItem("Bạn có thể hiến máu ở đâu?", "https://google.com"),
    SharedItem(
        "Khuyến cáo phòng chống dịch bệnh COVID-19", "https://google.com"),
    SharedItem("Hướng dẫn cài đặt và sử dụng ứng…", "https://google.com"),
    SharedItem("Có thể bạn chưa biết về gói xét…", "https://google.com"),
    SharedItem("Một số lưu ý trước và sau hiến…", "https://google.com"),
    SharedItem("Thông báo tuyển sinh các khóa đào tạo…", "https://google.com"),
    SharedItem("Các dịch vụ đào tạo đang triển khai", "https://google.com"),
    SharedItem("Thủ tục khám bệnh và điều trị ngoại…", "https://google.com"),
    SharedItem(
        "Bệnh Thalassemia - hiểu biết, phòng tránh và…", "https://google.com"),
    SharedItem(
        "Tại sao phải xét nghiệm gen Thalassemia?", "https://google.com"),
    SharedItem("Ai có thể bị Hemophilia và bệnh biểu…", "https://google.com"),
    SharedItem("Hướng dẫn lưu giữ máu dây rốn dịch…", "https://google.com"),
  ];

  DateTime? dateTime;

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    transactionRepository = TransactionRepository();
    budgetRepository = BudgetRepository();
    walletRepository = WalletRepository();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeBloc>(context).add(const HomeSubscriptionRequested());
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider.value(value: transactionRepository),
          RepositoryProvider.value(value: budgetRepository),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<HomeBloc>(
              create: (context) => HomeBloc(
                  transactionRepository: transactionRepository,
                  budgetRepository: budgetRepository,
                  walletRepository: walletRepository)
                ..add(const HomeSubscriptionRequested()),
            )
          ],
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.status == HomeStatus.loading) {
                // return const Center(
                //   child: CircularProgressIndicator(),
                // );
              }
              return Scaffold(
                  body: ListView(
                children: [
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Quá trình hiến máu",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 30,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      ...stepItems.map((e) {
                        return _cardItem(
                            e.id, e.name, e.description, e.imageUrl);
                      }).toList(),
                      const SizedBox(
                        height: 10,
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Bạn cần biết",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ...sharedItems.map((e) => _sharedItem(e.name, e.url)),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  )
                ],
              ));
            },
          ),
        ));
  }

  Widget _cardItem(int step, String name, String description, String imageurl) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      margin: const EdgeInsets.all(19),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  imageurl,
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  bottom: 20,
                  right: 5,
                  child: Container(
                    color: Colors.black54,
                    width: 300,
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      "Bước $step: $name",
                      style: const TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(description),
          )
        ],
      ),
    );
  }

  Widget _sharedItem(String content, String link) {
    return InkWell(
      onTap: () => _launchUrl(link),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(children: [
          const Icon(Icons.check_circle_rounded),
          const SizedBox(
            width: 5,
          ),
          Text(content)
        ]),
      ),
    );
  }

  // Widgets
  // TabBar
  // ignore: unused_element
  Widget _buildTabBar() {
    late int _currentIndex = 0;
    late TextStyle _tabBarTextStyle = const TextStyle(
      fontSize: 16,
    );
    late List<Widget> _tabs = [
      Tab(
        child: Text(
          'THÁNG',
          style: _tabBarTextStyle,
        ),
      ),
      Tab(
        child: Text(
          'TUẦN',
          style: _tabBarTextStyle,
        ),
      ),
      Tab(
        child: Text(
          'NGÀY',
          style: _tabBarTextStyle,
        ),
      ),
    ];
    late List<Widget> _tabViews = [
      _buildMonthTabView(),
      _buildWeekTabView(),
      _buildDayTabView(),
    ];
    void _onChangeTab(int index) {
      setState(() {
        _currentIndex = index;
      });
    }

    return DefaultTabController(
      initialIndex: _currentIndex,
      length: 3,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: MyAppColors.gray500,
                    blurRadius: 15.0,
                    offset: Offset(0.0, 0.75),
                  )
                ],
                color: MyAppColors.gray050,
              ),
              child: TabBar(
                indicatorColor: const Color.fromARGB(255, 218, 24, 24),
                unselectedLabelColor: MyAppColors.gray600,
                labelColor: const Color.fromARGB(255, 218, 24, 24),
                onTap: _onChangeTab,
                tabs: _tabs,
              ),
            ),
          ),
          body: TabBarView(
            children: _tabViews,
          )),
    );
  }

  Widget _buildMonthTabView() {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            MyDatePicker(
              dateTime: dateTime,
              filter: TransactionFilter.month,
              isShowDatePicker: false,
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return _buildIndicatorChart(
                    totalBudget: state.totalBudget.toDouble(),
                    spent: state.spent.toDouble() * -1);
              },
            ),
            _buildListViewTitle(
                leftTitle: 'LỊCH SỬ GIAO DỊCH', rightTitle: 'XEM CHI TIẾT'),
            _buildHistoryExpense(filter: 'month'),
          ],
        ),
      ),
    );
  }

  Widget _buildWeekTabView() {
    return Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MyDatePicker(
              dateTime: dateTime,
              filter: TransactionFilter.week,
              isShowDatePicker: false,
            ),
            _buildListViewTitle(
                leftTitle: 'LỊCH SỬ GIAO DỊCH TUẦN NÀY', rightTitle: ""),
            _buildHistoryExpense(filter: 'week')
          ],
        ));
  }

  Widget _buildDayTabView() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          MyDatePicker(
            dateTime: dateTime,
            filter: TransactionFilter.day,
            isShowDatePicker: true,
          ),
          _buildListViewTitle(
              leftTitle: 'LỊCH SỬ GIAO DỊCH HÔM NAY', rightTitle: ""),
          _buildHistoryExpense(filter: 'day')
        ],
      ),
    );
  }

  // Chart indicator
  Widget _buildIndicatorChart(
      {required double totalBudget, required double spent}) {
    return InkWell(
      onTap: () {},
      child: CircularPercentIndicator(
        addAutomaticKeepAlive: true,
        reverse: true,
        radius: 150.0,
        animation: true,
        animationDuration: 1000,
        lineWidth: 15.0,
        percent:
            (spent / totalBudget).abs() <= 1 ? (spent / totalBudget).abs() : 1,
        center: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (spent.abs() > totalBudget)
                ? const Text(
                    'Đã chi tiêu vượt quá ngân sách',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 205, 5, 5),
                    ),
                  )
                : const Text(
                    'Đã chi tiêu',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: MyAppColors.gray600,
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                '${numberFormat.format(spent.abs())} ${numberFormat.currencyName}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: MyAppColors.gray800,
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
            Container(
              constraints: const BoxConstraints(
                maxWidth: 200,
              ),
              child: Text(
                'Hạn mức: ${numberFormat.format(totalBudget)} ${numberFormat.currencyName}',
                maxLines: 1,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: MyAppColors.gray600,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
        circularStrokeCap: CircularStrokeCap.butt,
        backgroundColor: MyAppColors.gray100,
        progressColor: MyAppColors.gray800,
      ),
    );
  }

  // History Expense
  Widget _buildListViewTitle({String leftTitle = '', String rightTitle = ''}) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      decoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: MyAppColors.gray500,
            blurRadius: 0,
            offset: Offset(0.0, 0.75),
          )
        ],
        color: MyAppColors.white000,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(leftTitle, style: const TextStyle(fontSize: 14)),
            BlocProvider(
              create: (context) => PageRouteBloc(),
              child: BlocBuilder<PageRouteBloc, PageRouteState>(
                builder: (context, state) {
                  return TextButton(
                      onPressed: () {
                        _pageController.jumpToPage(1);
                        BlocProvider.of<PageRouteBloc>(context).add(
                          const PageJumpEvent(currentPageIndex: 1),
                        );
                      },
                      child: Text(rightTitle,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 218, 24, 24),
                          )));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTileExpense({
    String title = '',
    String subtitle = '',
    String amount = '',
    bool? isOutPut = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ListTile(
        onTap: () {},
        leading: generateIcon(title),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Text(
          "${isOutPut == true ? '-' : '+'}${numberFormat.format(int.parse(amount))}",
          style: TextStyle(
            color: isOutPut == true ? Colors.red : Colors.green,
          ),
        ),
      ),
    );
  }

  Widget _buildHistoryExpense({String filter = ''}) {
    return Expanded(
      child: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) =>
            previous.transactionMap![filter] != current.transactionMap![filter],
        builder: (context, state) {
          if (state.transactionMap![filter] == null) {
            return const Center(
              child: Text('Không có giao dịch nào'),
            );
          }
          if (state.transactionMap![filter]!.isEmpty) {
            return const Center(
              child: Text('Không có giao dịch nào'),
            );
          }
          return ListView.separated(
            separatorBuilder: (context, index) {
              return const Divider(
                height: 1,
                color: MyAppColors.gray600,
              );
            },
            itemBuilder: (context, index) {
              final element = state.transactionMap![filter]!.elementAt(index);
              return _buildListTileExpense(
                title: element.categoryName,
                subtitle:
                    "${element.createdAt.day}/${element.createdAt.month.toString().padLeft(2, '0')}/${element.createdAt.year}",
                amount: element.amount.toString(),
                isOutPut: element.is_output,
              );
            },
            itemCount: state.transactionMap![filter]!.length,
          );
        },
      ),
    );
  }
}
