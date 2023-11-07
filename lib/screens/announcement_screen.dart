import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant/models/annoucement_model.dart';
import 'package:restaurant/riverpod/riverpod_management.dart';

class AnnouncementScreen extends ConsumerStatefulWidget {
  const AnnouncementScreen({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AnnouncementScreenState();
}

class _AnnouncementScreenState extends ConsumerState<AnnouncementScreen> {
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
        body: FutureBuilder<List<AnnouncementModel>?>(
          future: announcement.getAnnouncement(),
          builder: (context, snapshot) {
            debugPrint("Connection State: ${snapshot.connectionState}");
            debugPrint("Has Error: ${snapshot.hasError}");
            debugPrint("Has Data: ${snapshot.hasData}");
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
              return ListView.builder(
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
              );
            }
          },
        ),
      ),
    );
  }
}
