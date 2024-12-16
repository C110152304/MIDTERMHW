import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player = AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClipPath example',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final tabs = [
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
  ];

  int previousIndex = 0;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex == 0) player.play(AssetSource("1.mp3"));
    return Scaffold(
      appBar: AppBar(
        title: Text('我的自傳'),
        centerTitle: true,
      ),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        selectedFontSize: 18,
        unselectedFontSize: 14,
        iconSize: 30,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: currentIndex == 0
                ? Image.asset('assets/f1.jpg', width: 40, height: 40)
                : Image.asset('assets/f1.jpg', width: 30, height: 30),
            label: '自我介紹',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: '學習歷程'),
          BottomNavigationBarItem(icon: Icon(Icons.scale_outlined), label: '學習計畫'),
          BottomNavigationBarItem(icon: Icon(Icons.engineering), label: '專業方向'),
        ],
        onTap: (index) {
          setState(() {
            previousIndex = currentIndex;
            currentIndex = index;
            if (index == 0) {
              if (previousIndex == currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("1.mp3"));
            }
            if (index == 1) {
              if (previousIndex == currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("2.mp3"));
            }
            if (index == 2) {
              if (previousIndex == currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("3.mp3"));
            }
            if (index == 3) {
              if (previousIndex == currentIndex) player.resume();
              player.stop();
              player.play(AssetSource("4.mp3"));
            }
          });
        },
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  Screen1({super.key});

  String s1 = '我叫楊承翰，目前是大學四年級的學生。雖然我沒有正式的工作經驗，但在大學四年的學習過程中，我學到了很多知識與技能，並且逐步了解了自己的興趣和未來的方向。'
      '大學時期的學習讓我接觸到各種不同的領域，無論是專業課程還是跨領域的知識，都讓我對未來充滿了期待。儘管我還未參與過工作，但我相信，在未來的職業生涯中，我能夠運用大學裡所學的知識，解決各種問題，並不斷提升自己。'
      '我認為自己是一個具有學習能力、積極向上的人。大學四年中，我一直努力專注於學業，盡管沒有突出成就，但我保持著對學習的熱情，並且不斷努力改進自己的不足。未來，我希望能夠有機會在職場上發揮所學，並逐步完善自己。'
      '我期待在未來能夠有更多的挑戰和機會，並且以積極的心態去迎接每一個新階段，為自己的成長奠定基礎。\n';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text(
              'Who am I',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(s1, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(height: 15),
          Container(
            color: Colors.redAccent,
            child: Image.asset('assets/f1.jpg'),
            height: 200,
            width: 200,
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '學習歷程',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              '大學期間，我投入了多項學術與課外活動。在學術方面，我主修計算機科學，完成了多項專題研究，例如機器學習應用、數據可視化與分散式系統設計。\n\n'
                  '此外，我參加校內程式設計競賽，提升了問題解決能力與團隊合作技巧。我也擔任學生會成員，協助策劃活動，提升同學的學習興趣與參與感。\n\n'
                  '這些經歷讓我學會了時間管理與多工處理的重要性，也加深了對學術與實務結合的理解。',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '學習計畫',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              '1. 強化基礎知識：\n學習核心課程如演算法與網路安全。\n\n'
                  '2. 專注於實務技能：\n學習熱門程式語言如Python與Flutter。\n\n'
                  '3. 提升語言能力：\n加強技術英文與國際交流能力。\n\n'
                  '4. 考取專業認證：\n參加AWS與Google Cloud認證考試。',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '專業方向',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              '我的專業方向包括：\n\n'
                  '1. 軟體開發：\n專注於用戶友好的應用程式設計。\n\n'
                  '2. 人工智慧應用：\n研究影像辨識與自然語言處理。\n\n'
                  '3. 大數據分析：\n學習數據工程與預測模型開發。',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}