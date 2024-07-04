import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobsque/model/constant.dart';
import 'package:jobsque/model/cubit/json_models/allJobs.dart';
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
  final ImagePicker picker = ImagePicker();
  XFile? image;
  static List<Widget> screens = [
    const HomePage(),
    const MessagesPage(),
    const AppliedPage(),
    const SavedPage(),
    const ProfilePage(),
  ];
  List<Data> messageList = [];
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

  Future<void> getJob() async {
    jobList.clear();
    emit(GetJobLoading());
    await DioHelper.getData(
            endPoint: allJobs,
            token: "11484|Xxo5VPB793heudRbtsYk7V2bmFo2qZaH9qf8jXCj")
        .then((value) => {
              print(value.data),
              allJobsList = Jobs.fromJson(value.data),
              jobList = allJobsList!.data!,
              emit(GetJobSuccess())
            })
        .catchError((error) => {print(error.toString()), emit(GetJobError())});
  }

  Future<void> getProfile() async {
    emit(GetJobLoading());
    await DioHelper.getData(
            endPoint: profile,
            token: "11484|Xxo5VPB793heudRbtsYk7V2bmFo2qZaH9qf8jXCj")
        .then((value) => {
              print(value.data),
              allJobsList = Jobs.fromJson(value.data),
              jobList = allJobsList!.data!,
              emit(GetJobSuccess())
            })
        .catchError((error) => {print(error.toString()), emit(GetJobError())});
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

  double percent = 0;
  addSave({required id}) async {
    savedList.clear();
  }
}
