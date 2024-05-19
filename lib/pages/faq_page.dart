import 'package:e_klinik_pens/models/faq_lists.dart';
import 'package:e_klinik_pens/utils/color.dart';
import 'package:e_klinik_pens/widgets/profiles/faq_tiles.dart';
import 'package:e_klinik_pens/widgets/profiles/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  List<FaqLists> faqLists= FaqContents.faqLists;
  late List<bool> isExpandedList;

  @override
  void initState() {
    super.initState();
    isExpandedList= List.generate(
      faqLists.length, (index) => false
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pureWhite,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: themeLight,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              }, 
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: pureWhite,)
              ),
            title: Text("FAQ", style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: MediaQuery.of(context).size.width * 0.055, 
              color: pureWhite
            ),
          ),
            centerTitle: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.115,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/atomic.png",
                fit: BoxFit.cover,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0.0), 
              child: Container(
                height: MediaQuery.of(context).size.height * 0.0275,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: pureWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32)
                  )
                ),
              )
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              faqLists.asMap().entries.map((entry) {
                final index= entry.key;
                final faqList= entry.value;
                return Column(
                  children:[
                    FaqTiles(
                      faqLists: faqList, 
                      isExpanded: isExpandedList[index],
                    ),
                    customDivider(context),
                  ],
                ); 
              }).toList(),
            )
          ),
        ],
      ),
    );
  }
}