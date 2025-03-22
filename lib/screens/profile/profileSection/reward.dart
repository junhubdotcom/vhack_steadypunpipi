import 'package:flutter/material.dart';
import 'package:steadypunpipi_vhack/models/VoucherModel.dart';

class MyRewardsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      final vouchers = [
      VoucherModel(
        title: '20% off',
        subtitle: 'Min. Spend RM30',
        validity: 'Valid for 30 days',
        icon: Icons.discount,
        buttonText: 'Use',
      ),
      VoucherModel(
        title: 'No Min. Spend',
        subtitle: 'First Purchase Only',
        validity: 'Valid for 30 days',
        icon: Icons.phone_android,
        buttonText: 'Claim',
      ),
    ];
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("My Rewards", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Column(
            children: vouchers.map((voucher)=> VoucherTile(voucher:voucher)).toList(),
          ),
        ],
      ),
    );
  }
}

class VoucherTile extends StatelessWidget{
  final VoucherModel voucher;
  const VoucherTile({super.key, required this.voucher});

  @override
  Widget build(BuildContext context){
    Color buttonTextColor;
    Color buttonColor;
    Color buttonSideColor;
    if (voucher.buttonText == 'Use'){
      buttonTextColor = Colors.red;
      buttonColor = Colors.white;
      buttonSideColor = Colors.red; 
    }else{
      buttonTextColor = Colors.white;
      buttonColor = Colors.red;
      buttonSideColor = Colors.red;
    }
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: const EdgeInsets.symmetric(vertical:8.0),
      child: ListTile(
        leading: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/celcomLogo.png',width: 55,height: 30),
            Icon(voucher.icon,color: Colors.green,size: 25),
          ],
        ),
        title: Text(
          voucher.title, style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(voucher.subtitle,style: const TextStyle(color: Colors.grey, fontSize:14),),
          Text(voucher.validity, style: const TextStyle(color:Colors.grey,fontSize: 12),),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: (){}, child: Text(voucher.buttonText),
            style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor, 
            foregroundColor: buttonTextColor,
            side: BorderSide(color:buttonSideColor),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),),
        ],
      ),
      ),
    );
  }
}
