import 'package:get/get.dart';
import 'package:care453/features/view_care_professionals/controller/view_professional_controller.dart';
import 'package:care453/features/visits_management/controller/visit_controller.dart';
import 'package:care453/features/assessment_management/controller/assessment_controller.dart';
import 'package:care453/features/runner_management/controller/runner_controller.dart';
import 'package:care453/features/appointments/controllers/appointment_controller.dart';
import 'package:care453/features/patientvitals/controllers/patient_vitals_controllers.dart';
import 'package:care453/features/profile_management/controllers/profile_controllers.dart';

import 'features/Internet_Check/controllers/connectivity_controller.dart';

void appControllers() {
  Get.put(ViewProfessionalController());
  Get.put(VisitController());
  Get.put(AssessmentController());
  Get.put(RunnerController());
  Get.put(AppointmentController());
  Get.put(PatientVitalsControllers());
  Get.put(ProfileController());
  Get.put(ConnectivityController());
}
