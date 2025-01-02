import 'package:flutter/foundation.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart';
import 'dart:async';

class LocationProvider with ChangeNotifier {
  LocationData? _currentLocation;
  final StreamController<LocationData> _locationStreamController = StreamController<LocationData>.broadcast();
  StreamSubscription<LocationData>? _locationSubscription;

  LocationData? get currentLocation => _currentLocation;
  Stream<LocationData> get locationStream => _locationStreamController.stream;


  LocationProvider() {
    initLocationStream();
  }

  Future<void> initLocationStream() async {
    if (await _handleLocationPermission()) {
      final location = Location();
      
      location.enableBackgroundMode(enable: true);
      _locationSubscription?.cancel(); // Cancel any existing subscription to avoid multiple listeners

      _locationSubscription = location.onLocationChanged.listen((LocationData locationData) {
        _currentLocation = locationData;
        _locationStreamController.add(locationData);
        notifyListeners();
      }, onError: (error) {
        print("Error receiving location updates: $error");
      }, cancelOnError: true);
    }
  }


  Future<LatLng> getCurrentLocation() async {
    try {
      if (await _handleLocationPermission()) {
        final location = Location();
        _currentLocation = await location.getLocation();
        notifyListeners();
        return LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!);
      }
    } on TimeoutException catch (e) {
      print("Timeout getting current location: $e");
      return LatLng(0, 0);
    } catch (e) {
      print("Error getting current location: $e");
      return LatLng(0, 0);
    }

    return LatLng(0, 0);
  }

  Future<bool> _handleLocationPermission() async {
    var status = await Permission.location.status;
    if (status.isDenied || status.isRestricted || status.isLimited) {
      status = await Permission.location.request();
      if (status.isDenied) {
        print('Location permission denied.');
        return false;
      }
      if (status.isPermanentlyDenied) {
        print('Location permission permanently denied. Please enable it from settings.');
        return false;
      }
    }
    return true;
  }

  @override
  void dispose() {
    _locationSubscription?.cancel();
    _locationStreamController.close();
    super.dispose();
  }
}
