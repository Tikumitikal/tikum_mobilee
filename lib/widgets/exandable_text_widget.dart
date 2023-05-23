import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:tikum_mobile/utils/colors.dart';
import 'package:tikum_mobile/utils/dimension.dart';
import 'package:tikum_mobile/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText=true;

  double textHeight = Dimensions.screenHeight/5.63;
  
  @override
  void initState(){
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1, widget.text.length);
    }else{
      firstHalf=widget.text;
      secondHalf="";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(color: AppColors.TextColor, size: Dimensions.font16, text: firstHalf):Column(
        children: [
          SmallText(height: 1.8, color: AppColors.TextColor, size: Dimensions.font16, text:hiddenText?(firstHalf+"..."):(firstHalf+secondHalf)),
          InkWell(
            onTap: () {
              setState(() {
                hiddenText=!hiddenText;
              });
            },
            child: Row(children: [
              SmallText(text: "Show More", color: AppColors.TikumColor,),
              Icon(hiddenText? Icons.arrow_drop_down:Icons.arrow_drop_up, color: AppColors.TikumColor,)
            ]),
          )
        ],
      ),
    );
  }
}