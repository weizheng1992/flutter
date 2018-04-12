import 'package:flutter/material.dart';

class Target {
  const Target ({
    this.name,
    this.reward
  });
  final String name;
  final String reward;
}

typedef void TargetChangedCallback(
  Target target,
  bool nowTarget
);

class AchievementViewItem extends StatelessWidget{
  AchievementViewItem({
    Target target,
    this.nowTarget,
    this.onTargetChanged
  }):
  target=target,
  super(
    key:new ObjectKey(target)
  );
  final Target target;
  final bool nowTarget;
  final TargetChangedCallback onTargetChanged;

  Color _getColor(BuildContext context){
    return nowTarget?Colors.black54:Theme.of(context).primaryColor;
  }

  TextStyle _getNameTextStyle(BuildContext context){
    if(!nowTarget)return new TextStyle(
      fontSize: 16.0,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
    return new TextStyle(
      fontSize: 16.0,
      color: Colors.black54,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.lineThrough,
    );
  }

  TextStyle _getRewardTextStyle(BuildContext context){
    if(!nowTarget) return new TextStyle(
      color: Colors.black,
      fontSize: 13.0,
    );

    return new TextStyle(
      color: Colors.black54,
      fontSize: 13.0,
      decoration: TextDecoration.lineThrough,
    );
  }

@override
  Widget build (BuildContext context){
    return new ListTile(
      onTap:(){
        onTargetChanged(target,!nowTarget);
      },
      leading:new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text('囧'),
      ),
      title:new Stack(
        children: <Widget>[
          new Positioned(
            left: 0.0,
            top:0.0,
            child: new Text(
              target.name,
              style: _getNameTextStyle(context),
            ),
          ),
          new Positioned(
            left: 0.0,
            top: 20.0,
            child: new Text(
              '奖励'+'\n'+target.reward,
              style: _getRewardTextStyle(context),
            ),
          )
        ],
      )
    );
  }

}