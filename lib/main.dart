import 'package:flutter/material.dart'; // 引入Flutter的Material库
import 'Notifications.dart' as prefix0; // 引入Notifications.dart，并用前缀prefix0
import 'package:url_launcher/url_launcher.dart'; // 引入url_launcher库，用于打开网址和邮件
import 'WishList.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, // 关闭右上角的debug标志
    home: BottomNav(), // 设置初始页面为BottomNav
    theme: appTheme, // 应用主题
    title: "travel", // 应用标题
  ));
}

// 定义应用主题
ThemeData appTheme = ThemeData(
  primaryColor: Colors.purple, // 主色
  secondaryHeaderColor: Colors.blue, // 次要头部颜色
);

int sel = 0; // 底部导航栏当前选中的索引
double? width; // 屏幕宽度
double? height; // 屏幕高度

// 定义不同页面的widget列表
final bodies = [
  HomeScreen(), // 首页
  WishList(), // 心愿单
  prefix0.Notification() // 通知
];

// 定义BottomNav类
class BottomNav extends StatefulWidget {
  BottomNav({Key? key}) : super(key: key);

  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  // 创建底部导航栏项
  List<BottomNavigationBarItem> createItems() {
    List<BottomNavigationBarItem> items = [];
    items.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.home,
          color: appTheme.primaryColor,
        ),
        icon: Icon(
          Icons.home,
          color: Colors.black,
        ),
        label: "Explore"));
    items.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.favorite,
          color: appTheme.primaryColor,
        ),
        icon: Icon(
          Icons.favorite,
          color: Colors.black,
        ),
        label: "WishList"));
    items.add(BottomNavigationBarItem(
        activeIcon: Icon(
          Icons.notifications,
          color: appTheme.primaryColor,
        ),
        icon: Icon(
          Icons.notifications,
          color: Colors.black,
        ),
        label: "Notifications"));
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodies.elementAt(sel), // 显示当前选中的页面
      bottomNavigationBar: BottomNavigationBar(
        items: createItems(), // 设置底部导航栏项
        unselectedItemColor: Colors.black,
        selectedItemColor: appTheme.primaryColor,
        type: BottomNavigationBarType.shifting,
        showUnselectedLabels: false,
        showSelectedLabels: true,
        currentIndex: sel,
        elevation: 1.5,
        onTap: (int index) {
          if (index != sel)
            setState(() {
              sel = index; // 更新选中的索引
            });
        },
      ),
    );
  }
}

int flag = 0;

// 定义首页的HomeScreen类
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.shortestSide; // 获取的屏幕宽度
    height = MediaQuery.of(context).size.longestSide; // 获取的屏幕高度
    double h = 100;
    double w = 100;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        hoverElevation: 0,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("More Info :"),
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    // Gmail按钮
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              StadiumBorder(),
                            ),
                            foregroundColor: MaterialStateProperty.all<Color>(
                              Colors.white,
                            ),
                          ),
                          child: Image.asset('assets/images/qq.png'),
                          onPressed: () async {
                            const url = 'https://www.qq.com/';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        ),
                      ),
                    ),

                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SizedBox(
                        height: h,
                        width: w,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              StadiumBorder(),
                            ),
                            foregroundColor: MaterialStateProperty.all<Color>(
                              Colors.white,
                            ),
                          ),
                          child: Image.asset('assets/images/WeChat.png'),
                          onPressed: () async {
                            const url = 'https://wx.qq.com/';
                            if (await canLaunch(url)) {
                              await launch(url); // 打开微博
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        ),
                      ),
                    ),

                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SizedBox(
                        height: h,
                        width: w,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              StadiumBorder(),
                            ),
                            foregroundColor: MaterialStateProperty.all<Color>(
                              Colors.white,
                            ),
                          ),
                          child: Image.asset('assets/images/weibo.png'),
                          onPressed: () async {
                            const url = 'https://m.weibo.cn/';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        ),
                      ),
                    ),

                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SizedBox(
                        height: h,
                        width: w,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              StadiumBorder(),
                            ),
                            foregroundColor: MaterialStateProperty.all<Color>(
                              Colors.white,
                            ),
                          ),
                          child: Image.asset('assets/images/tiktok.png'),
                          onPressed: () async {
                            const url = 'https://www.douyin.com/';
                            if (await canLaunch(url)) {
                              await launch(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.info_outline), // 信息图标
        backgroundColor: appTheme.primaryColor.withOpacity(.5), // 浮动按钮背景颜色
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[HomeTop(), HomeMid(flag: flag)], // 首页上部和下部
        ),
      ),
    );
  }
}

var selectedloc = 0; // 当前选中的位置索引
List<String> locs = ['中国', '美国', '日本', '英国', '法国', '俄罗斯']; // 位置列表

// 定义首页上部的HomeTop类
class HomeTop extends StatefulWidget {
  @override
  _HomeTop createState() => _HomeTop();
}

class _HomeTop extends State<HomeTop> {
  TextEditingController c = TextEditingController(text: locs[1]); // 文本控制器
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // 自定义裁剪路径的ClipPath
        ClipPath(
          clipper: Clipper08(),
          child: Container(
            height: height! * .65 < 450 ? height! * .65 : 500, // 容器高度
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                appTheme.primaryColor,
                appTheme.secondaryHeaderColor
              ]), // 渐变背景
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: height! / 16,
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: width! * 0.05,
                      ),
                      // 弹出菜单按钮
                      PopupMenuButton(
                        onSelected: (index) {
                          setState(() {
                            selectedloc =
                                int.parse(index.toString()); // 更新选中的位置
                            flag = int.parse(index.toString());
                          });
                        },
                        child: Row(
                          children: <Widget>[
                            Text(
                              locs[selectedloc],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            )
                          ],
                        ),
                        itemBuilder: (BuildContext context) {
                          return <PopupMenuItem<int>>[
                            PopupMenuItem(
                              child: Text(
                                locs[0],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                              ),
                              value: 0,
                            ),
                            PopupMenuItem(
                              child: Text(
                                locs[1],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                              ),
                              value: 1,
                            ),
                            PopupMenuItem(
                              child: Text(
                                locs[2],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                              ),
                              value: 2,
                            ),
                            PopupMenuItem(
                              child: Text(
                                locs[3],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                              ),
                              value: 3,
                            ),
                            PopupMenuItem(
                              child: Text(
                                locs[4],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                              ),
                              value: 4,
                            ),
                            PopupMenuItem(
                              child: Text(
                                locs[5],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                ),
                              ),
                              value: 4,
                            )
                          ];
                        },
                      ),
                      Spacer(),
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height! / 16,
                ),
                // 中心文本
                Text(
                  '你想去哪？',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: height! * 0.0375),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 5,
                        offset: Offset(0, 10),
                      )
                    ],
                  ),
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 20), // 添加间距以分隔输入框和选项按钮
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: '请输入你想去的地方',
                            border: InputBorder.none,
                          ),
                          onSubmitted: (value) {
                            // 处理回车提交事件
                            filterTravelCards(value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void filterTravelCards(String searchText) {
    List<TravelCard> results = [];

    // 模拟数据，实际情况应该根据 searchText 进行真正的过滤
    for (var card in travel) {
      if (card.name.toLowerCase().contains(searchText.toLowerCase())) {
        results.add(card);
      }
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchResultPage(filteredTravel: results),
      ),
    );
  }
}

// 自定义裁剪器Clipper08
class Clipper08 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    var firststart = Offset(size.width / 4, size.height - 30);
    var firstend = Offset(size.width / 2, size.height - 10);
    path.quadraticBezierTo(
        firststart.dx, firststart.dy, firstend.dx, firstend.dy);
    var secondstart = Offset(size.width - (size.width / 4), size.height + 10);
    var secondend = Offset(size.width, size.height - 80);
    path.quadraticBezierTo(
        secondstart.dx, secondstart.dy, secondend.dx, secondend.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class SearchResultPage extends StatelessWidget {
  final List<TravelCard> filteredTravel;

  SearchResultPage({required this.filteredTravel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('搜索结果'),
      ),
      body: filteredTravel.isEmpty
          ? Center(child: Text('没有找到结果'))
          : ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '共有${(filteredTravel.length).toString()}\个结果',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: height! * .35 < 300 ? height! * .35 : 300,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: filteredTravel,
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}

class HomeMid extends StatefulWidget {
  final int flag;

  const HomeMid({Key? key, required this.flag}) : super(key: key);
  @override
  _HomeMid createState() => _HomeMid();
}

class _HomeMid extends State<HomeMid> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: ValueKey(widget.flag),
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.grey[200], // Background color for the whole section
            child: Column(
              children: <Widget>[
                if (flag == 0) ...[
                  buildHomeSection('推荐景点', travel.sublist(0, 4)),
                  buildHomeSection('人气景点', travel.sublist(4, 8)),
                  buildHomeSection('最美景点', travel.sublist(8, 12)),
                  buildHomeSection('好评景点', travel.sublist(12, 16)),
                ] else ...[
                  buildHomeSection('推荐景点', travel.sublist(0, 4)),
                  buildHomeSection('人气景点', travel.sublist(4, 8)),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHomeSection(String title, List<Widget> items) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          height: height! * .35 < 300 ? height! * .35 : 300,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: items,
          ),
        ),
      ],
    );
  }
}

// 旅行卡片列表
List<TravelCard> travel = [
  TravelCard(
      imgurl: 'assets/images/黄山1.jpg',
      name: '黄山',
      location: '中国',
      describe:
          '黄山，古称黟山，位于安徽省黄山市境内，地处安徽省南部、黄山市北部，地跨歙县、休宁县、黟县和黄山区、徽州区，东起黄狮岭，西至小岭脚，北始二龙桥，南达汤口镇，地跨东经118°01′至118°17′、北纬30°01′至30°18′，山境南北长约40千米，东西宽约30千米，总占地面积约1200平方千米，属亚热带季风气候；以奇松、怪石、云海、温泉、冬雪“五绝”及历史遗存、书画、文学、传说、名人“五胜”著称于世，有“天下第一奇山”“天开图画”“松海云川”之称。1982年，黄山风景区被国务院公布为首批国家级重点风景名胜区。1985年，黄山风景区被中国旅游报公布为中国十大风景名胜区之一。 1990年12月，黄山被联合国教科文组织列入《世界文化与自然遗产名录》。 2004年2月，黄山被联合国教科文组织公布为世界地质公园。',
      videoUrl: 'https://www.bilibili.com/video/BV1bi4y1E7r6',
      price: 300),
  TravelCard(
      imgurl: 'assets/images/大理1.jpg',
      name: '大理',
      location: '中国',
      describe:
          '大理白族自治州，云南省辖民族自治州，地处云南省中部偏西，介于东经98°52′~101°03′，北纬24°41′~26°42′之间，属于低纬高原季风气候，干湿季节分明，大部分地区夏无酷暑，冬无严寒，总面积29459平方千米。截至2023年末，大理白族自治州常住人口为334.2万人。截至2023年3月，大理白族自治州辖1个县级市、11个县，110个乡镇，自治州人民政府驻大理市下关。 大理白族自治州历史悠久，远在新石器时代，就有白族、彝族等少数民族先民在这里繁衍生息。唐、宋时期分别出现了“南诏国”和“大理国”等地方政权。1956年，建立大理白族自治州。州府所在地大理市，是滇缅公路、滇藏公路交汇地，古为“蜀身毒道”和“茶马古道”的重要中转站，现为云南省规划建设的滇西中心城市、区域交通枢纽和滇西物流中心。',
      videoUrl: 'https://www.bilibili.com/video/BV1oy4y1j7xC',
      price: 300),
  TravelCard(
      imgurl: 'assets/images/华山1.jpg',
      name: '华山',
      location: '中国',
      describe:
          '华山，古称“西岳”，雅称“太华山”，为五岳之一，位于陕西省渭南市华阴市，在省会西安以东120千米处。南接秦岭山脉，北瞰黄渭，自古以来就有“奇险天下第一山”的说法。 中华之“华”源于华山，由此，华山有了“华夏之根”之称 。华山是中国道教主流全真派圣地，为“第四洞天”，也是中国民间广泛崇奉的神祇，即西岳华山君神。共有72个半悬空洞，道观20余座，其中玉泉院、都龙庙、东道院、镇岳宫被列为全国重点道教宫观，有陈抟、郝大通、贺元希等的道教高人。1982年，华山被国务院颁布为首批国家级风景名胜区。2004年，华山被评为中华十大名山。2011年，华山被国家旅游局评为国家AAAAA级旅游景区。',
      videoUrl: 'https://www.bilibili.com/video/BV1Vs411F7dW',
      price: 300),
  TravelCard(
      imgurl: 'assets/images/泰山1.jpg',
      name: '泰山',
      location: '中国',
      describe:
          '泰山相伴上下五千年的华夏文明传承历史，集国家兴盛、民族存亡的象征于一身，是中华民族的精神家园，东方文化的缩影，“天人合一”思想的寄托之地 ，承载着丰厚的地理历史文化内涵 ，被古人视为“直通帝座”的天堂，成为百姓崇拜，帝王告祭的神山，有“泰山安，四海皆安”的说法。自秦始皇起至清代，先后有13代帝王依次亲登泰山封禅或祭祀，另有24代帝王遣官祭祀72次。山体上既有寺庙、宫、观等古建筑群29处，古遗址128处，有大小碑碣、摩崖石刻2000余处 。其景巍峨雄奇、幽奥俊秀，有石坞松涛、云海玉盘等美丽壮阔的自然景观。其历史文化、自然风光、地质奇观和谐融为一体，具有特殊的历史、文化、美学和科学价值。',
      videoUrl: 'https://www.bilibili.com/video/BV1Ef4y1D7Fx',
      price: 300),
  TravelCard(
      imgurl: 'assets/images/九寨沟1.jpg',
      name: '九寨沟',
      location: '中国',
      describe:
          '九寨沟国家级自然保护区，位于四川省西北部岷山山脉南段的阿坝藏族羌族自治州九寨沟县漳扎镇境内，地处岷山南段弓杆岭的东北侧， 地理坐标为东经103°46′14″—104°5′3″、北纬32°54′13″—33°19′57″。距离成都市400多千米，系长江水系嘉陵江上游白水江源头的一条大支沟，总面积65074.7公顷。九寨沟国家级自然保护区内有树正沟、则查洼沟、日则沟、扎如沟四个景点，其中又分为多个大大小小的景点，以高原钙化湖群、钙化瀑群和钙化滩流等水景为主体，其水景规模巨，景型多，数量众，形态美，表局精和环境佳。 九寨沟国家级自然保护区森林覆盖率超过80%，藤本植物有38种，有74种国家保护珍稀植物。有陆栖脊椎动物122种，其中兽类21种，鸟类93种，爬行类4种，两栖类4种。 ',
      videoUrl: 'https://www.bilibili.com/video/BV1r14y1p7HN',
      price: 300),
  TravelCard(
      imgurl: 'assets/images/三亚.jpg',
      name: '三亚',
      location: '中国',
      describe:
          '黄山，古称黟山，位于安徽省黄山市境内，地处安徽省南部、黄山市北部，地跨歙县、休宁县、黟县和黄山区、徽州区，东起黄狮岭，西至小岭脚，北始二龙桥，南达汤口镇，地跨东经118°01′至118°17′、北纬30°01′至30°18′，山境南北长约40千米，东西宽约30千米，总占地面积约1200平方千米，属亚热带季风气候；以奇松、怪石、云海、温泉、冬雪“五绝”及历史遗存、书画、文学、传说、名人“五胜”著称于世，有“天下第一奇山”“天开图画”“松海云川”之称。1982年，黄山风景区被国务院公布为首批国家级重点风景名胜区。 [10]1985年，黄山风景区被中国旅游报公布为中国十大风景名胜区之一。 [8]1990年12月，黄山被联合国教科文组织列入《世界文化与自然遗产名录》。 2004年2月，黄山被联合国教科文组织公布为世界地质公园。',
      videoUrl:
          'https://www.bilibili.com/video/BV1b94y1W7hd/?spm_id_from=333.337.search-card.all.click',
      price: 300),
  TravelCard(
      imgurl: 'assets/images/长城.jpg',
      name: '长城',
      location: '中国',
      describe:
          '长城（The Great Wall），又称万里长城，是中国古代的军事防御工事，是一道高大、坚固而且连绵不断的长垣，用以限隔敌骑的行动。长城不是一道单纯孤立的城墙，而是以城墙为主体，同大量的城、障、亭、标相结合的防御体系。依据长城形成了长城文化。是弘扬中华优秀传统文化的重要力量。长城修筑的历史可上溯到西周时期，发生在首都镐京（今陕西西安）的著名典故“烽火戏诸侯”就源于此。春秋战国时期，列国争霸，互相防守，长城修筑进入第一个高潮，但此时修筑的长度都比较短。秦灭六国统一天下后，秦始皇连接和修缮战国长城，始有万里长城之称。明朝是最后一个大修长城的朝代，人们所看到的长城多是此时修筑。',
      videoUrl: 'https://www.bilibili.com/video/BV1144y1b7Af',
      price: 300),
  TravelCard(
      imgurl: 'assets/images/张家界.jpg',
      name: '张家界',
      location: '中国',
      describe:
          '张家界国家森林公园位于张家界市武陵源区金鞭路279号，1988年8月，张家界武陵源旅游区被列入国家重点风景名胜区；1992年12月，因奇特的石英砂岩大峰林被联合国列入《世界自然遗产名录》，2004年2月被列入世界地质公园；2007年被列入中国首批国家5A级旅游景区，公园总面积4810公顷。武陵源旅游区自然风光以峰称奇、以谷显幽、以林见秀。其间有奇峰3000多座，如人如兽、如器如物，形象逼真，气势壮观，有“奇峰三千，秀水八百”之美称。主要景点有黄石寨、金鞭溪、袁家界、杨家界等。',
      videoUrl: 'https://www.bilibili.com/video/BV1Rt411y7ry',
      price: 300),
  TravelCard(
      imgurl: 'assets/images/西湖.jpg',
      name: '西湖',
      location: '中国',
      describe:
          '西湖，又名钱塘湖，位于中国浙江省杭州市西湖区龙井路1号，杭州市区西部，汇水面积为21.22平方千米，湖面面积为6.38平方千米，为江南三大名湖之一。西湖南、西、北三面环山，东邻城区，南部和钱塘江隔山相邻，湖中白堤、苏堤、杨公堤、赵公堤将湖面分割成若干水面，湖中有三岛，西湖群山以西湖为中心，由近及远可分为四个层次。西湖流域内年径流量为1400万立方米，蓄水量近1400万立方米。西湖是一座设备齐全、管理完善的灌溉济运水库，通过河渠和闸门，为杭州市区及周边农田提供了充足的水源。西湖还可以协助调节钱塘江的水位，防止城市内涝。 ',
      videoUrl: 'https://www.bilibili.com/video/BV1gY411g7cC',
      price: 300),
  TravelCard(
      imgurl: 'assets/images/鼓浪屿.jpg',
      name: '鼓浪屿',
      location: '中国',
      describe:
          '鼓浪屿，原名“圆沙洲”，别名“圆洲仔”，南宋时期命“五龙屿”，岛西南有一海蚀岩洞受浪潮冲击，声如擂鼓，自明朝雅化为今名称“鼓浪屿”，位于福建省厦门市思明区鼓浪屿街道，面积1.88平方公里，与厦门岛隔海相望，至高点为日光岩，与厦门岛上的厦门世茂海峡大厦、厦门大学等隔海相望。鼓浪屿岛上海礁嶙峋，岸线迤逦，山峦叠翠，峰岩跌宕，鼓浪屿以建筑为表，音乐为魂。代表景点有：日光岩、菽庄花园、皓月园、毓园、鼓浪石、鼓浪屿钢琴博物馆、郑成功纪念馆、海底世界、天然海滨浴场、海天堂构等。随着厦门的发展，鼓浪屿成为观光、度假、旅游、购物、休闲、娱乐为一体的综合性海岛风景文化旅游区。',
      videoUrl: 'https://www.bilibili.com/video/BV1YY411L7Ze',
      price: 300),
  TravelCard(
      imgurl: 'assets/images/天坛.jpg',
      name: '天坛',
      location: '中国',
      describe:
          '天坛，原名“天地坛”，位于北京市东城区永定门大街东侧。为明、清两代皇帝祭天、祈谷和祈雨的场所。是中国现存最大的古代祭祀性建筑群。天坛始建于明永乐十八年（1420年），明嘉靖九年（1530年）改名为“天坛”，天坛由两重坛墙环护，分为内、外两坛。其主要古建筑集中于内坛，内坛中间有东西向隔墙将内坛分隔为南、北两部分，隔墙中有门相通。内坛由圜丘、祈谷坛、斋宫三组古建筑群组成。祈谷坛位于内坛北部，圜丘坛位于内坛南部，斋宫位于内坛西部，一条长360米、宽28米、高2.5米的丹陛桥连缀圜丘坛和祈谷坛。内坛四周设有东天门、北天门、西天门、广利门、昭亨门、泰元门。天坛有着较高的历史价值、科学价值和独特的艺术价值，更有着深刻的文化内涵。',
      videoUrl: 'https://www.bilibili.com/video/BV1fL411V7jF',
      price: 300),
  TravelCard(
      imgurl: 'assets/images/月牙泉.jpg',
      name: '月牙泉',
      location: '中国',
      describe:
          '敦煌鸣沙山月牙泉景区（Mingsha Mountain Crescent Spring），位于甘肃省酒泉市敦煌市城南5千米处，占地面积为76.82平方千米，核心景区面积界定为12.79平方千米，是国家AAAAA级旅游景区。以“山泉共处，沙水共生”的奇妙景观著称于世，被誉为“塞外风光之一绝”。鸣沙山月牙泉景区主要景点有鸣沙山、月牙泉。鸣沙山东西长40余公里，南北宽约20公里，主峰海拔1715米，因沙动成响而得名。月牙泉处于鸣沙山环抱之中，因形似一弯新月而得名。1994年，敦煌鸣沙山月牙泉景区被定为国家重点风景名胜区；2005年，敦煌鸣沙山月牙泉景区获“中国最美的五大沙漠之一”荣誉称号；2015年，敦煌鸣沙山月牙泉景区获评国家AAAAA级旅游景区、中国敦煌世界地质公园。',
      videoUrl: 'https://www.bilibili.com/video/BV1ja411n72W',
      price: 300),
  TravelCard(
      imgurl: 'assets/images/壶口瀑布.jpg',
      name: '壶口瀑布',
      location: '中国',
      describe:
          '壶口瀑布是国家级风景名胜区，国家AAAAA级旅游景区。东濒山西省临汾市吉县壶口镇，西临陕西省延安市宜川县壶口镇，为两省共有旅游景区。南距陕西省西安市350千米；北距山西省太原市387千米。壶口瀑布是中国第二大瀑布，世界上最大的黄色瀑布。黄河奔流至此，两岸石壁峭立，河口收束狭如壶口，故名壶口瀑布。瀑布上游黄河水面宽300米，在不到500米长距离内，被压缩到20—30米的宽度。1000立方米/秒的河水，从20多米高的陡崖上倾注而泻，形成“千里黄河一壶收”的气概。',
      videoUrl: 'https://www.bilibili.com/video/BV15W4y1d7vB',
      price: 300),
  TravelCard(
      imgurl: 'assets/images/呼伦贝尔草原.jpg',
      name: '呼伦贝尔草原',
      location: '中国',
      describe:
          '呼伦贝尔草原位于内蒙古自治区东北部，地处大兴安岭以西的呼伦贝尔高原上，因呼伦湖、贝尔湖而得名。整体地势东高西低，海拔在650～700米之间，东西宽约350公里，南北长约300公里，总面积约11.3万平方公里（一亿四千九百万亩），其中可利用草场面积833.33万公顷。呼伦贝尔草原是世界著名的天然牧场，是世界四大草原之一，被称为世界上最好的草原， 是全国旅游二十胜景之一。呼伦贝尔草原是众多古代文明、游牧民族的发祥地，东胡、匈奴、鲜卑、室韦、回纥、突厥、契丹、女真、蒙古等民族曾繁衍生息于此，被史学界誉为“中国北方游牧民族摇篮”，在世界史上占据较高地位。',
      videoUrl: 'https://www.bilibili.com/video/BV1oD4y1277D',
      price: 300),
  TravelCard(
      imgurl: 'assets/images/凤凰古城.jpg',
      name: '凤凰古城',
      location: '中国',
      describe:
          '凤凰古城，旧称镇筸城 ，位于湖南省湘西土家族苗族自治州的西南部，占地面积约10平方千米，由苗族、汉族、土家族等28个民族组成，为典型的少数民族聚居区。其地处武陵山脉南部、云贵高原东侧，因背依的青山酷似一只展翅欲飞的凤凰而得名。凤凰古城建于清康熙四十三年（1704年），东门和北门古城楼尚在。城内青石板街道、江边木结构吊脚楼，以及朝阳宫、古城博物馆、杨家祠堂、沈从文故居、熊希龄故居、天王庙、大成殿、万寿宫等建筑，全都透着古城特色。古城现有文物古建筑68处，古遗址116处，明清时代特色民居120多栋，各种庙祠馆阁30多座，是中国西南现存文物建筑最多的县。',
      videoUrl: 'https://www.bilibili.com/video/BV1nT4y1375F',
      price: 300),
  TravelCard(
      imgurl: 'assets/images/四姑娘山.jpg',
      name: '四姑娘山',
      location: '中国',
      describe:
          '四姑娘山（英语：Siguniang Shan），为横断山脉东部边缘邛崃山的最高峰。藏语名为石骨拉柔达，意为大神山。分别由海拔6247.8米、5664米、 5454米、 5355米的四座山峰组成，主峰为幺妹峰，高6247.8米。四座山峰从北到南“一”字排开，且长年冰雪覆盖，如同头披白纱、姿容俊俏的四位少女，山名由此而来。誉为“蜀山皇后”。四姑娘山位于四川省阿坝藏族羌族自治州汶川县、小金县和理县之间，地处四川盆地向青藏高原过渡地带，属岷山邛崃山构造侵蚀高山区，发育现代冰川、古冰川冰蚀和堆积地貌、流水侵蚀和堆积地貌，被现代冰川覆盖的山峰有20余座。四姑娘山由砂岩、板岩、千枚岩、大理岩、石灰岩组成，并有花岗岩出露；岩性质地致密，在强烈的冰川和寒冻风化作用下，山峰尖削。',
      videoUrl: 'https://www.bilibili.com/video/BV1mz4y1N7tW',
      price: 300)
];

// 定义旅行卡片类
class TravelCard extends StatelessWidget {
  final String imgurl, name, location, describe, videoUrl; // 图片地址、名称、位置
  final int price; // 价格
  TravelCard({
    required this.imgurl,
    required this.name,
    required this.location,
    required this.describe,
    required this.videoUrl,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TravelDetailPage(
                imgurl: imgurl,
                name: name,
                location: location,
                describe: describe,
                videoUrl: videoUrl,
                price: price,
              ),
            ),
          );
        },
        child: Container(
          width: width! * .6 < 250 ? width! * .6 : 250,
          margin: EdgeInsets.all(10),
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 6,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          image: DecorationImage(
                              image: AssetImage(imgurl), fit: BoxFit.cover)),
                    ),
                  ),
                  Expanded(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          color: Colors.grey[200],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                location,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '${price.toString()}\元',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              ),
              // 书签图标
              Positioned(
                right: 20,
                top: 10,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.bookmark_border,
                    color: appTheme.primaryColor,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class TravelDetailPage extends StatelessWidget {
  final String imgurl, name, location, describe, videoUrl; // 图片地址、名称、位置、视频播放网址
  final int price; // 价格

  TravelDetailPage({
    required this.imgurl,
    required this.name,
    required this.location,
    required this.describe,
    required this.videoUrl,
    required this.price,
  });

  Future<void> _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('景点介绍'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: AssetImage(imgurl),
                  fit: BoxFit.cover,
                ),
              ),
              height: 300, // 设置图片高度，根据需要调整
              width: 300,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    location,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    describe,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '景点短片(点击下方图片)',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => _launchURL(videoUrl),
                    child: Image.asset(
                      imgurl, // 替换为你的图片路径
                      height: 100, // 设置图片高度
                      width: 100, // 设置图片宽度
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
