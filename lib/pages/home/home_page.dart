import 'dart:convert';
import 'package:info_popup/info_popup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../models/poll.dart';
import '../../models/response_body.dart';
import '../my_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


   final List<Poll> _polls=[
     Poll(
    id : 1,
    question: "บุคคลใดที่คุณจะสนับสนุนให้เป็นนายกรัฐมนตรีในการเลือกตั้งครั้งนี้",
    choices: [
      "นายพิธา ลิ้มเจริญรัตน์",
      "นพ.ชลน่าน ศรีแก้ว",
      "นายอนุทิน ชาญวีรกูล",
      "พล.ต.อ.เสรีพิศุทธ์ เตมียเวส",
      "นายกรณ์ จาติกวณิช",
      "คุณหญิงสุดารัตน์ เกยุราพันธุ์",
      "พลเอกประยุทธ์ จันทร์โอชา",
      "น.ส.แพทองธาร ชินวัตร",
      "อื่นๆ",
      "ยังหาคนที่เหมาะสมไม่ได้"
    ]),
     Poll(
         id: 2,
         question: "ในการเลือกตั้ง ส.ส. แบบแบ่งเขต คุณจะเลือกผู้สมัครจากพรรคการเมืองใด",
         choices: [
         "พรรคก้าวไกล",
         "พรรคเพื่อไทย",
         "พรรครวมไทยสร้างชาติ",
         "พรรคประชาธิปัตย์",
         "พรรคไทยสร้างไทย",
         "พรรคเสรีรวมไทย",
         "พรรคพลังประชารัฐ",
         "พรรคภูมิใจไทย",
         "อื่นๆ",
         "ยังไม่ได้ตัดสินใจ"
         ]
     ),
     Poll(
         id: 3,
         question: "ในการเลือกตั้ง ส.ส. แบบบัญชีรายชื่อ คุณจะเลือกผู้สมัครจากพรรคการเมืองใด",
         choices: [
         "พรรคเสรีรวมไทย",
         "พรรคภูมิใจไทย",
         "พรรคประชาธิปัตย์",
         "พรรคไทยสร้างไทย",
         "พรรครวมไทยสร้างชาติ",
         "พรรคก้าวไกล",
         "พรรคพลังประชารัฐ",
         "พรรคเพื่อไทย",
         "อื่นๆ",
         "ยังไม่ได้ตัดสินใจ"
         ]
     )
  ];


  var _isLoading = false;



  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    // todo: Load list of polls here
    // https://cpsu-test-api.herokuapp.com/api/polls
    // http://jsonplaceholder.typicode.com/todos
    // Uri uri = Uri.parse('https://cpsu-test-api.herokuapp.com/api');
    // var res = await http.get(uri);
    // if(res.statusCode==200){
    //   print(res.body);
    //   List result = jsonDecode(res.body);
    //
    //   _polls = result.map((item) => Poll.fromJson(item)).toList();
    // }else{
    //
    // }
  }

  @override
  Widget build(BuildContext context) {
  print(_polls.length);
    return MyScaffold(
      body: Column(
        children: [
          Image.network('https://cpsu-test-api.herokuapp.com/images/election.jpg'),
          Expanded(
            child: Stack(
              children: [
                 _buildList(),

              ],
            ),
          ),
        ],
      ),
    );
  }

  ListView _buildList() {
    return ListView.builder(
      itemCount: _polls!.length,
      itemBuilder: (BuildContext context, int index) {
        var poll = _polls[index];
        var myTextStyls = const TextStyle(fontSize: 20.0, color: Colors.black54,fontWeight: FontWeight.bold);
        var amountStyls = const TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold, color: Colors.black54);
        // todo: Create your poll item by replacing this Container()

        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.black),
                left: BorderSide(color: Colors.black),
                right: BorderSide(color: Colors.black),
                bottom: BorderSide(color: Colors.black),
              ),

            ),
            width: 400,
            height: 600,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment:  MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${poll.id}. ${poll.question}',style: myTextStyls,),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for(int i=0;i< poll.choices.length;i++)

                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              SizedBox(width: 40,),
                              ElevatedButton(onPressed: (){}
                                  , child: Text('${poll.choices[i]}',style:TextStyle(fontSize: 20.0, color: Colors.white,fontWeight: FontWeight.bold),)),
                            ],
                          ),
                        )

                  ],
                )
               ,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Container(
                      color: Colors.blue,
                      width: 500,
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          onPressed: () { },
                          child: Text('ดูผลโหวต',style: myTextStyls,),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ) ,
          ),
        );
      },
    );
  }

  Widget _buildProgress() {
    return Container(
      color: Colors.black.withOpacity(0.6),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            CircularProgressIndicator(color: Colors.white),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('รอสักครู่', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

}

