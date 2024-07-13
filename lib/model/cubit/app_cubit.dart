import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobsque/model/constant.dart';
import 'package:jobsque/model/cubit/json_models/all_jobs.dart';
import 'package:jobsque/model/dio_helper.dart';
import '../../view/home_screens/applied_page.dart';
import '../../view/home_screens/home_page.dart';
import '../../view/home_screens/messages_page.dart';
import '../../view/home_screens/profile_page.dart';
import '../../view/home_screens/saved_page.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);
  TextEditingController email = TextEditingController();
  TextEditingController salary = TextEditingController();
  TextEditingController search = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password2 = TextEditingController();
  TextEditingController password3 = TextEditingController();
  TextEditingController bio = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController university = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController position = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController startEduDate = TextEditingController();
  TextEditingController endEduDate = TextEditingController();
  TextEditingController startWorkDate = TextEditingController();
  var currentIndex = 0;
  double percent = 0;
  final ImagePicker picker = ImagePicker();
  XFile? image;
  static List<Widget> screens = [
    const HomePage(),
    const MessagesPage(),
    const AppliedPage(),
    const SavedPage(),
    const ProfilePage(),
  ];
  List<Data> notificationList = [];
  List<Data> appliedList = [];
  List<Data> jobList = [];
  List<Data> savedList = [];
  Jobs? allJobsList = Jobs();

  bottomNavBar(int index) {
    emit(BottomNavBarStates());
    currentIndex = index;
  }

  uploadPhoto({required String cam}) async {
    if (cam == "camera") {
      image = await picker.pickImage(source: ImageSource.camera);
      return image = XFile(image!.path);
    } else {
      image = await picker.pickImage(source: ImageSource.gallery);
      return image = XFile(image!.path);
    }
  }

  updateProfile1() {
    emit(PersonalDetailsSaveSuccess());
  }

  updateProfile2() {
    emit(EducationSaveSuccess());
  }

  updateProfile3() {
    emit(ExperienceSaveSuccess());
  }

  updateProfile4() {
    emit(PortfolioSaveSuccess());
  }

  getJob() async {
    jobList.clear();
    emit(GetJobLoading());
    await DioHelper.getData(
            endPoint: allJobs,
            token: "11484|Xxo5VPB793heudRbtsYk7V2bmFo2qZaH9qf8jXCj")
        .then((value) => {
              allJobsList = Jobs.fromJson(value.data),
              jobList = allJobsList!.data!,
              emit(GetJobSuccess())
            })
        .catchError((error) => {emit(GetJobError())});
  }

  deleteJobItem(id) async {
    emit(DeleteJobLoading());
    try {
      final response = await DioHelper.deleteData(
        data: id,
        endPoint: allJobs,
      );
      if (response.statusCode == 200 || response.statusCode == 204) {
        emit(DeleteJobSuccess());
      }
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(DeleteJobError());
    }
  }

  addSave({required id}) async {
    savedList.clear();
  }
}
