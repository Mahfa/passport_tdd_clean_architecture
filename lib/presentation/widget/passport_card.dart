import 'package:flutter/material.dart';
import 'package:passport/domain/model/passport_info.dart';

class PassportCard extends StatelessWidget{
  final PassportInfo info;
  const PassportCard(this.info,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 512, maxWidth: 256),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network((info.results?[0].picture!.large)!,height: 72,width: 72,),
                const SizedBox(width: 16, height: 16),
                Text(
                  "Name: ${info.results?[0].name?.first} ${info.results?[0].name?.last}",
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 16, height: 16),
                Text(
                  "Gender: ${info.results?[0].gender}",
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 16, height: 16),
                Text(
                  "Age: ${info.results?[0].dob?.age}",
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 16, height: 16),
                Text(
                  "Country: ${info.results?[0].location?.country}",
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 16, height: 16),
                Text(
                  "Country: ${info.results?[0].location?.country}",
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(width: 16, height: 16),
                Text(
                  "City: ${info.results?[0].location?.city}",
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}