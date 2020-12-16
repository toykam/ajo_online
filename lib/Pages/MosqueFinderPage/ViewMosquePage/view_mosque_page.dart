import 'package:ajo_online/Pages/MosqueFinderPage/models/mosque.model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewMosquePage extends StatelessWidget {
  Mosque mosque;
  ViewMosquePage({@required this.mosque});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    top: 0, right: 0, left: 0, bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.only(top: 50),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            '${mosque.mosqueImage}'
                          ),
                        )
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0, right: 0, left: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      color: Colors.black.withOpacity(.3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${mosque.mosqueName}', style: TextStyle(
                            color: Colors.white
                          )),
                          SizedBox(height: 3,),
                          Text('${mosque.mosqueAddress}', style: GoogleFonts.acme(
                            color: Colors.white, fontSize: 10, 
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ListTile(
              title: Text('Mosque Type'),
              subtitle: Text('${mosque.mosqueType}'),
            ),

            ListTile(
              title: Text('Mosque Size'),
              subtitle: Text('${mosque.mosqueSize}'),
            ),

            ListTile(
              title: Text('Imam Name'),
              subtitle: Text('${mosque.mosqueImamName}'),
            ),

            ListTile(
              title: Text('Muadhin Name'),
              subtitle: Text('${mosque.mosqueMuadhin}'),
            ),

            ListTile(
              title: Text('Mosque Contact'),
              subtitle: Text('${mosque.mosqueContact}'),
            ),

            ListTile(
              title: Text('Contact Holder'),
              subtitle: Text('${mosque.mosqueContactOwner}'),
            ),
          ],
        ),
      ),
    );
  }
}