/*
 *  This file is part of restaurant.
 *
 *  restaurant is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  restaurant is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *   along with restaurant.  If not, see <https://www.gnu.org/licenses/>.
 */

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:restaurant/models/offer_model.dart';
import 'package:restaurant/riverpod/riverpod_management.dart';

class OfferScreen extends ConsumerStatefulWidget {
  const OfferScreen({
    super.key,
  });

  @override
  void initState() {
    bool _pageAnn = true;
  }

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OfferScreenState();
}

class _OfferScreenState extends ConsumerState<OfferScreen> {
  bool _ishidden = true;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<OfferModel>?>(
      future: offer.getOffer(),
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
          var offers = snapshot.data!;
          return Expanded(
            child: ListView.builder(
              itemCount: offers.length,
              itemBuilder: (context, index) {
                var offer = offers[index];

                return Card(
                  child: ListTile(
                    title: Text(
                      offer.baslik ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(offer.aciklama ?? ''),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
