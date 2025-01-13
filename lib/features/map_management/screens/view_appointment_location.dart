import 'package:care453/core/helpers/genenal_helpers.dart';
import 'package:care453/providers/location_provider.dart';
import 'package:care453/providers/mapStyleProvider.dart';
import 'package:care453/core/utils/colors/pallete.dart';
import 'package:care453/core/utils/map_styles/map_styles.dart';
import 'package:care453/core/utils/map_styles/map_tokens.dart';
import 'package:care453/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class ViewAppointmentLocation extends StatefulWidget {
  final double latitude;
  final double longtitude;

  const ViewAppointmentLocation(
      {super.key, required this.latitude, required this.longtitude});

  @override
  _ViewAppointmentLocationState createState() =>
      _ViewAppointmentLocationState();
}

class _ViewAppointmentLocationState extends State<ViewAppointmentLocation> {
  final MapController _mapController = MapController();

  LatLng? _currentPosition;
  LatLng? _selectedPosition;

  @override
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getCurrentLocation();
    });
  }

  Future<void> _getCurrentLocation() async {
    if (!mounted) return;
    setState(() {
      _currentPosition = LatLng(widget.latitude, widget.longtitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Appointment Location',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        centerTitle: true,
      ),
      body: _currentPosition != null
          ? Stack(
              children: [
                Consumer<MapStyleProvider>(
                  builder: (context, mapStyleProvider, child) {
                    return FlutterMap(
                      mapController: _mapController,
                      options: MapOptions(
                        initialCenter: _currentPosition!,
                        initialZoom: 16,
                        maxZoom: 40,
                        minZoom: 0,
                        onTap: (tapPosition, point) {
                          setState(() {
                            _selectedPosition = point;
                          });
                        },
                      ),
                      children: [
                        TileLayer(
                          urlTemplate: mapStyleProvider.currentMapStyle,
                          additionalOptions: {
                            'accessToken': MapToken.publicToken,
                          },
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              width: 20,
                              height: 20,
                              point: _currentPosition!,
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                            color: Pallete.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Pallete.primaryColor
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 4,
                                                offset: const Offset(0, 3),
                                              ),
                                            ],
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 1,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            if (_selectedPosition != null)
                              Marker(
                                width: 20,
                                height: 20,
                                point: _selectedPosition!,
                                child: const Icon(
                                  Icons.location_on,
                                  color: Colors.orange,
                                  size: 50,
                                ),
                              ),
                          ],
                        )
                      ],
                    );
                  },
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: CustomButton(
                    onTap: () {
                      // Change the map style
                      final mapStyleProvider =
                          Provider.of<MapStyleProvider>(context, listen: false);
                      mapStyleProvider.setMapStyle(
                        mapStyleProvider.currentMapStyle ==
                                MapStyle.satelliteView
                            ? MapStyle.navigationDayView
                            : mapStyleProvider.currentMapStyle ==
                                    MapStyle.navigationDayView
                                ? MapStyle.navigationNightView
                                : MapStyle.satelliteView,
                      );
                    },
                    width: 60,
                    borderRadius: 10,
                    btnColor: Pallete.primaryColor,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.map,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 82,
                  right: 16,
                  child: CustomButton(
                    onTap: () => _mapController.move(_currentPosition!, 16),
                    width: 60,
                    borderRadius: 10,
                    btnColor: Pallete.primaryColor,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.my_location_sharp,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : LoadingAnimationWidget.hexagonDots(
              color: Pallete.primaryColor, size: 45),
    );
  }
}
