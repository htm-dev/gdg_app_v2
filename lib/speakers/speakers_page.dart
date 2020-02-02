import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gdg_app/home/speaker.dart';
import 'package:gdg_app/universal/dev_scaffold.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class SpeakersPage extends StatelessWidget {
  static const String routeName = "/speakers";
  @override
  Widget build(BuildContext context) {
    return DevScaffold(
      title: "Speakers",
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: speakers.length,
          itemBuilder: (c,i){
            return Card(
              
              elevation: 0.0,
               child: Padding(
                 padding: const EdgeInsets.all(12),
                 child: Row(
                   mainAxisSize: MainAxisSize.min,
                   children: <Widget>[
                     ConstrainedBox(
                       constraints: BoxConstraints.expand(
                         height: MediaQuery.of(context).size.height*0.096,
                         width: MediaQuery.of(context).size.width*0.2,
                       ),
                       child: ClipOval(
                         child: CachedNetworkImage(
                           imageUrl: speakers[i].speakerImage,
                           fit:BoxFit.cover,
                         ),
                       ),
                     ),
                     SizedBox(
                       width: 20,
                     ),
                     Expanded(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.start,
                         mainAxisSize: MainAxisSize.min,
                         children: <Widget>[
                           Text(speakers[i].speakerName),
                           SizedBox(
                             height: 10,
                           ),
                           Text(
                             speakers[i].speakerDesc,
                             style: Theme.of(context).textTheme.subtitle,
                           ),
                           SizedBox(
                             height: 10,
                           ),
                           Text(
                             speakers[i].speakerSession,
                             style: Theme.of(context).textTheme.caption,
                           )
                         ],
                       ),
                     )
                   ],
                 ),
               ),
            );
          },),
    );
  }
}
