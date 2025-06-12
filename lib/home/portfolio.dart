import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoliday_llp/global.dart';
import 'package:yoliday_llp/model/portfolio.dart';

class Portfolio extends StatefulWidget {
   Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> {
  String chosenwork="Project";
  bool _hasText = false;
  final TextEditingController _searchController = TextEditingController();
  List<PortfolioCard> filteredList = [];
  ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        _hasText = controller.text.isNotEmpty;
      });
    });
    filteredList = portfolioList;

    // Add listener for text field
    _searchController.addListener(() {
      filterPortfolioList();
    });
  }
  void filterPortfolioList() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredList = portfolioList
          .where((card) => card.title.toLowerCase().contains(query))
          .toList();
    });
  }
  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    double h=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: w/3,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Global.basic
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.filter_list,color: Colors.white,),
            SizedBox(width: 3,),
            Text("Filter",style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 6,),
         Row(
           children: [
             con("Project", w),
             con("Saved", w),
             con("Share", w),
             con("Achievement", w),
           ],
         ),
          SizedBox(height: 6,),
          Container(
            width: w-35,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey,
                width: 1.4
              ),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15,right: 6),
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: _hasText ? null : 'Search a Project',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  suffixIcon: InkWell(
                    onTap: (){
                      _searchController.text=controller.text;
                      setState(() {

                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SvgPicture.asset(
                        "assets/Group 16.svg",
                      ),
                    ),
                  ),
                ),
                onFieldSubmitted: (string){
                  _searchController.text=string;
                  setState(() {

                  });
                },
              ),
            ),
          ),
          SizedBox(height: 6,),
          Expanded(
            child: Container(
              height: h,
              width: w,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  final card = filteredList[index];
                  return PortCard(card: card);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget con(String s,double w){
    bool yes=s==chosenwork;
    return InkWell(
      onTap: (){
        setState((){
          chosenwork=s;
        });
      },
      child: Container(
        width: w/4,
        height: 40,
        child: Column(
          children: [
            Text(s,style: TextStyle(fontSize: 13,color:yes?Global.basic:Colors.black,fontWeight:FontWeight.w800 ),),
            SizedBox(height: 7,),
            Container(
              width: w/4,
              height: 3,
              color: yes?Global.basic:Colors.grey,
            )
          ],
        ),
      ),
    );
  }
  final List<PortfolioCard> portfolioList = [
    PortfolioCard(
      pic: 'https://images.pexels.com/photos/1766604/pexels-photo-1766604.jpeg',
      id: '1',
      title: 'Project Alpha',
      subtitle: 'An innovative solution for AI.',
      author: 'John Doe',
    ),
    PortfolioCard(
      pic: 'https://st4.depositphotos.com/1010613/21958/i/450/depositphotos_219585158-stock-photo-close-businesswoman-hand-writing-note.jpg',
      id: '2',
      title: 'Project Beta',
      subtitle: 'A sustainable energy project.',
      author: 'Jane Smith',
    ),
    PortfolioCard(
      pic: 'https://www.spiralytics.com/wp-content/uploads/2024/03/shutterstock_1145552963.jpg',
      id: '3',
      title: 'Project Gamma',
      subtitle: 'A mobile app for healthcare.',
      author: 'Alex Johnson',
    ),
    PortfolioCard(
      pic: 'https://www.shutterstock.com/image-photo/writing-text-document-online-content-600nw-2384800043.jpg',
      id: '4',
      title: 'Project Delta',
      subtitle: 'An educational platform.',
      author: 'Emily Davis',
    ),
    PortfolioCard(
      pic: 'https://media.istockphoto.com/id/902787158/photo/woman-hands-with-pen-writing-on-notebook-in-the-office.jpg?s=612x612&w=0&k=20&c=AFrTZ8bU1XrEifN4GU57k9PK8HYd3a3whGB_0pFp29E=',
      id: '5',
      title: 'Project Epsilon',
      subtitle: 'An e-commerce website.',
      author: 'Michael Brown',
    ),
  ];
}

class PortCard extends StatelessWidget {
  PortfolioCard card;
   PortCard({super.key,required this.card});

  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: w-20,
        height: 140,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey.shade300
          )
        ),
        child: Row(
          children: [
            Container(
              width: w*1/3,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)
                ),
                image: DecorationImage(image: NetworkImage(card.pic),fit: BoxFit.cover)
              ),
            ),
            SizedBox(width: 15,),
            Container(
              width: w-(w*1/3)-15-25-32-40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15,),
                  Text(card.title,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                  Spacer(),
                  Text(card.subtitle,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),),
                  Text(card.author,style: TextStyle(fontWeight: FontWeight.w200,fontSize: 12),),
                  SizedBox(height: 10,),
                ],
              ),
            ),
            Spacer(),
            Column(
              children: [
                Spacer(),
                Image.asset("assets/Group 31.png",height: 20,),
                SizedBox(height: 15,)
              ],
            ),
            SizedBox(width: 10,),
          ],
        )
      ),
    );
  }
}

