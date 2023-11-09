import 'package:flutter/material.dart';
import 'package:restaurant/models/annoucement_model.dart';
import 'package:restaurant/riverpod/riverpod_management.dart';

import 'offer_screen.dart';

class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({Key? key}) : super(key: key);

  @override
  _AnnouncementScreenState createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  bool _pageAnn = true;

  void _togglePage(bool _switchme) {
    setState(() {
      _pageAnn = _switchme;
    });
  }

  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Duyurular",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    _togglePage(true);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: _pageAnn
                        ? const Color.fromRGBO(143, 148, 251, 1)
                        : Colors.transparent,
                    onPrimary: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Duyurular',
                    style: TextStyle(
                      fontSize: 18,
                      color: _pageAnn
                          ? Colors.white
                          : Color.fromARGB(255, 217, 217, 217),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    _togglePage(false);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: _pageAnn ? Colors.white : Colors.white,
                    onPrimary: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Kampanyalar',
                    style: TextStyle(
                        fontSize: 18,
                        color: _pageAnn
                            ? const Color.fromARGB(255, 217, 217, 217)
                            : Colors.white),
                  ),
                ),
              ],
            ),
            _pageAnn
                ? FutureBuilder<List<AnnouncementModel>?>(
                    future: announcement
                        .getAnnouncement(), // Burada fonksiyon ismi düzeltildi.
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text("Hata: ${snapshot.error}"),
                        );
                      } else if (!snapshot.hasData) {
                        return const Center(
                          child: Text("Veri bulunamadı."),
                        );
                      } else {
                        var announcements = snapshot.data!;
                        return Expanded(
                          child: ListView.builder(
                            itemCount: announcements.length,
                            itemBuilder: (context, index) {
                              var announcement = announcements[index];
                              return Card(
                                child: ListTile(
                                  title: Text(
                                    announcement.baslik ?? '',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  subtitle: Text(announcement.aciklama ?? ''),
                                ),
                              );
                            },
                          ),
                        );
                      }
                    },
                  )
                : OfferScreen()
          ],
        ),
      ),
    );
  }
}
