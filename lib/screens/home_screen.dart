import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reader_app/models/document_models.dart';
import 'package:reader_app/screens/reader_screen.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
     
        title: const Text('PDF Reader',style: TextStyle(color: Colors.blueAccent, fontSize: 25, fontWeight: FontWeight.bold),),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Available Documents',
                style: GoogleFonts.roboto(
                    fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
              Column(
                children: Document.docList
                    .map((doc) => ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ReaderScreen(doc)));
                          },
                          title: Text(
                            doc.docTitle!,
                            style: GoogleFonts.nunito(),
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text("${doc.pageNum} Pages"),
                          trailing: Text(
                            doc.docDate!,
                            style: GoogleFonts.nunito(color: Colors.black),
                          ),
                          leading: const Icon(
                            Icons.picture_as_pdf,
                            color: Colors.red,
                            size: 28.0,
                          ),
                        ))
                    .toList(),
              )
            ],
          ),
        ),
      )),
    );
  }
}
