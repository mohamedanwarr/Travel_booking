import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travelbooking/ui/On_boarding/listonboarding.dart';

class On_Boarding extends StatefulWidget {
  const On_Boarding({Key? key}) : super(key: key);

  @override
  State<On_Boarding> createState() => _On_BoardingState();
}

class _On_BoardingState extends State<On_Boarding> {
  int curruntindex = 0;
  PageController ?_controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }


  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        onPageChanged: (int index) {
          setState(() {
            curruntindex = index;
          });
        },
        itemCount: content.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
          Padding(
          padding:
          const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Image.asset(
          content[index].image,
          width: 321.31,
          height: 294.94,
          ),
          ),
          Text(
          content[index].title,
          style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 32,
          ),
          ),
          SizedBox(height: 20),
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
          content[index].discribtion,
          style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.grey,
          fontSize: 18,
          ),
          ),
          ),
          SizedBox(height: 50),
          Container(
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(content.length, (index) =>
          buildDot(index, context))
          ),
          ),
          SizedBox(height: 50),

          Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          TextButton(
          style: ButtonStyle(
            foregroundColor:MaterialStatePropertyAll(Color(0xFF312DA4)) ,
          elevation: MaterialStatePropertyAll(5),
          textStyle: MaterialStatePropertyAll(TextStyle(
          fontSize: 18,
          color: Color(0xFF312DA4),
          fontWeight: FontWeight.bold))),
          onPressed: () {},
          child: Text('Skip')),
          GestureDetector(
          onTap: (){
          if(curruntindex == content.length -1){}
          _controller!.nextPage(
          duration: Duration(milliseconds: 100),
          curve: Curves.bounceIn);
          },
          child: Container(
          width: 100,
          height: 40,
          decoration: BoxDecoration(

          boxShadow: [
          BoxShadow(
          blurRadius: 1,
          offset: Offset(0, 1)
          )
          ],
          color: Color(0xFFFEFEFE),
          borderRadius: BorderRadius.circular(50)),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          CircleAvatar(
          child: Icon(
          Icons.arrow_forward_ios_outlined,
          color: Colors.white,
          size: 15,
          ),
          radius: 15,
          backgroundColor: Color(0xFF312DA4),
          ),
          Text(curruntindex == content.length -1 ?
          'Continue':'Next',
          style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 15),
          )
          ],
          ),
          ),
          )
          ],
          ),
          ),

          ],
          );
        },
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 6),
      height: 10,
      width: curruntindex == index ? 10 : 10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: curruntindex == index ? Color(0xFF312DA4) : Color(0xFFCCD1FB)
      ),
    );
  }
}
