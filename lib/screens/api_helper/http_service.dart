import 'dart:convert';
import 'dart:io' show File, Platform;
import 'package:artist_icon/helper/api_heper.dart';
import 'package:artist_icon/helper/setup.dart';
import 'package:artist_icon/model/RequestUserLoginModel/RequestUserLoginModel.dart';
import 'package:artist_icon/model/register/register_apiModel.dart';
import 'package:artist_icon/screens/edit_profile/model/EditProfileBean.dart';
import 'package:artist_icon/screens/feed/model/CreatePostModel.dart';
import 'package:artist_icon/screens/feed/model/GetAllFeedsBean.dart';
import 'package:artist_icon/screens/home_page/model/RecentSearchJobModel.dart';
import 'package:artist_icon/screens/home_page/template_listModel/TemplateListModel.dart';
import 'package:artist_icon/screens/profile/model/GetProfileData.dart';
import 'package:artist_icon/screens/search/model/city_list/CityListBean.dart';
import 'package:artist_icon/screens/search/model/job_search/SearchJobModel.dart';
import 'package:artist_icon/screens/search/model/skills/SkillsListBean.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:artist_icon/screens/edit_profile/model/modeleducation/AddEducationModel.dart';
import 'package:artist_icon/model/addWorkExperience/AddWorkExperienceModel.dart';

class HttpService
{
  ApiBaseHelper _apiHelper = ApiBaseHelper();
  String _userID = '0';
  String _token = '';
  String _deviceId = '';
  String _deviceToken = '';
  String _deviceType = 'web';

  Future _init() async {
    final _prefs = await SharedPreferences.getInstance();
    int _id = _prefs.getInt('userID') ?? 0;
    _userID = _id.toString();
    _token = _prefs.getString('token');
    _deviceToken = _prefs.getString("deviceToken");
  }

  showExceptionToast() {
    Fluttertoast.showToast(msg: 'Something Went Wrong', timeInSecForIosWeb: 10);
  }

  Future<RequestUserLoginModel> sendOtpModel({String number}) async{

    Map reqBody = {
      "number": number
    };
    final response = await _apiHelper.post('Artist_api/user_request_otp_for_login', reqBody);
    try {
      return RequestUserLoginModel.fromJson(response);
    } catch (e) {
      showExceptionToast();
      return null;
    }
  }


  Future<RequestUserLoginModel> request_otp_for_regester({String number}) async{

    Map reqBody = {
      "number": number
    };
    final response = await _apiHelper.post('Artist_api/request_otp_for_regester', reqBody);
    try {
      return RequestUserLoginModel.fromJson(response);
    } catch (e) {
      showExceptionToast();
      return null;
    }
  }
  Future<CreatepostModel>create_post({String text,String title,String desc})async{
    Map reqBody={
      "jwtToken":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJ0aW1lU3RhbXAiOiIyMDIxLTA0LTEzIDEwOjQwOjAxIn0.2TNWx0yu22Uj37oqGbgNwB2cfvPNEREC6KqlbgnBJjk",
      "text":text,
      "media_type":"1",
      "is_tutorial":"1",
      "price":"10000",
      "title":title,
      "desc":desc,
      "file_url":"IMG_20200804_185303.jpg",
      "product_image":"IMG_20200804_185303.jpg"
    };
    final response = await _apiHelper.post('Feed_api/add_feed', reqBody);
    try {
      return CreatepostModel.fromJson(response);
    } catch (e) {
      showExceptionToast();
      return null;
    }
  }


  Future<register_apiModel> registerAPiModel({String name,String email,String phone}) async
  {
    Map reqBody = {
      "name": name,
      "email": email,
      "phone": phone
    };
    final response = await _apiHelper.post('Artist_api/register_api', reqBody);
    try {
      return register_apiModel.fromJson(response);
    } catch (e) {
      showExceptionToast();
      return null;
    }
  }


  Future<register_apiModel> users_login_api({String number,String otp}) async{
    Map reqBody = {
      "number": number,
      "otp": otp
    };
    final response = await _apiHelper.post('Artist_api/users_login_api', reqBody);
    try {
      return register_apiModel.fromJson(response);
    } catch (e) {
      showExceptionToast();
      return null;
    }
  }

  Future<RecentSearchJobModel> job_categories_list({String jwtToken,String limit,String search}) async{
    Map reqBody = {
      "jwtToken": jwtToken,
      "limit": limit,
      "search": search
    };
    final response = await _apiHelper.post('Artist_api/job_categories_list', reqBody);
    try {
      return RecentSearchJobModel.fromJson(response);
    } catch (e) {
      showExceptionToast();
      return null;
    }
  }

  Future<RecentSearchJobModel> recent_search_job({String jwtToken,String limit}) async{
    Map reqBody = {
      "jwtToken": jwtToken,
      "limit": limit
    };
    final response = await _apiHelper.post('Artist_api/recent_search_job', reqBody);
    try {
      return RecentSearchJobModel.fromJson(response);
    } catch (e) {
      showExceptionToast();
      return null;
    }
  }

  Future<RecentSearchJobModel> recommended_jobs({String jwtToken,String limit}) async{
    Map reqBody = {
      "jwtToken": jwtToken,
      "limit": limit
    };
    final response = await _apiHelper.post('Artist_api/recommended_jobs', reqBody);
    try {
      return RecentSearchJobModel.fromJson(response);
    } catch (e) {
      showExceptionToast();
      return null;
    }
  }


  Future<TemplateListModel> template_list({String jwtToken,String limit,String search}) async{
    Map reqBody = {
      "jwtToken": jwtToken,
      "limit": limit
    };
    final response = await _apiHelper.post('Artist_api/template_list', reqBody);
    try {
      return TemplateListModel.fromJson(response);
    } catch (e) {
      showExceptionToast();
      return null;
    }
  }

  Future<SearchJobModel> search_job({String jwtToken,String Skills_id,String job_type,String city_id}) async{
    Map reqBody = {
      "jwtToken": jwtToken,
      "Skills_id": Skills_id,
      "job_type": job_type,
      "city_id": city_id
    };
    final response = await _apiHelper.post('Artist_api/search_job', reqBody);
    try {
      return SearchJobModel.fromJson(response);
    } catch (e) {
      showExceptionToast();
      return null;
    }
  }

  Future<SkillsListBean> skills_list({String jwtToken,String limit,String search}) async{
    Map reqBody = {
      "jwtToken": jwtToken,
      "limit": limit
    };
    final response = await _apiHelper.post('Artist_api/skills_list', reqBody);
    try {
      return SkillsListBean.fromJson(response);
    } catch (e) {
      showExceptionToast();
      return null;
    }
  }


  Future<CityListBean> city_list({String jwtToken,String limit,String search}) async{
    Map reqBody = {
      "jwtToken": jwtToken,
      "limit": limit
    };
    final response = await _apiHelper.post('Artist_api/city_list', reqBody);
    try {
      return CityListBean.fromJson(response);
    } catch (e) {
      showExceptionToast();
      return null;
    }
  }

//manage profile
  Future<GetProfileData> get_profile_data({String jwtToken}) async{
    Map reqBody = {
      "jwtToken": jwtToken
    };
    final response = await _apiHelper.post('Artist_api/get_profile_data', reqBody);
    try {
      return GetProfileData.fromJson(response);
    } catch (e) {
      showExceptionToast();
      return null;
    }
  }

  Future<EditProfileBean> uploadHeadline(String resumeHeadline) async {
    final prefs = await SharedPreferences.getInstance();
    Dio dio = new Dio();
    FormData data = FormData.fromMap({
      "jwtToken": prefs.getString('userID'),
      "resume_headline": resumeHeadline,

    });
    try {
      Response response = await dio.post("https://artist.devclub.co.in/api/Artist_api/profile_update", data: data);
      return EditProfileBean.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      showExceptionToast();
      return null;
    }
  }

//manage profile
  Future<GetAllFeedsBean> get_all_post({String jwtToken,String pages}) async{
    Map reqBody = {
      "jwtToken": jwtToken,
      "pages": pages
    };
    final response = await _apiHelper.post('Feed_api/get_all_post', reqBody);
    try {
      return GetAllFeedsBean.fromJson(response);
    } catch (e) {
      showExceptionToast();
      return null;
    }
  }
  //Add Work Experience Api  Call
  Future<AddWorkExperienceModel> add_Work_exp({String position,String comp_name,String current_work,String location})async{
    final prefs = await SharedPreferences.getInstance();
Map reqBody={
  'position':position,
  'company_name':comp_name,
  'start_date':"12-10-2021",
  'end_date':"12-10-2021",
  'currently_work_here':"0",
  'company_location':position,
  'jwtToken':prefs.getString('userID')
};
final response=await _apiHelper.post('Artist_api/add_work_experience', reqBody);
try{
  return AddWorkExperienceModel.fromJson(response);

}
catch(e){

}
}

  //manage profile
  Future<AddEducationModel> add_education ( {
    String school_name,String education_level,String filled_of_study,String start_date, String end_date,String currently_study_here,String  education_sub_category  }) async{
    final prefs = await SharedPreferences.getInstance();
    Map reqBody = {
      "school_name": school_name,
      "education_level": education_level,
      "filled_of_study": filled_of_study,
      "start_date": start_date,
      "end_date": end_date,
      "currently_study_here": currently_study_here,
      "education_sub_category": education_sub_category,
      "education_location":"noida",
      "jwtToken":prefs.getString('userID')
    };
    final response = await _apiHelper.post('Artist_api/add_education', reqBody);
    try {
      return AddEducationModel.fromJson(response);
    } catch (e) {
      showExceptionToast();
      return null;
    }
  }

}
