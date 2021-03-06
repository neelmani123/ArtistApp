import 'dart:convert';
import 'dart:io' show File, Platform;
import 'package:artist_icon/helper/api_heper.dart';
import 'package:artist_icon/helper/setup.dart';
import 'package:artist_icon/model/ChangeStatus/ChangeStatusApplied.dart';
import 'package:artist_icon/model/DoBookmark/DoBookmark.dart';
import 'package:artist_icon/model/DoLike/DoLike.dart';
import 'package:artist_icon/model/GetAllBookMark/getBookMark.dart';
import 'package:artist_icon/model/GetUserFeed/GetUserFeed.dart';
import 'package:artist_icon/model/MyFeedModel/MyFeedModel.dart';
import 'package:artist_icon/model/RequestUserLoginModel/RequestUserLoginModel.dart';
import 'package:artist_icon/model/SearchJobModel1/SearchJobModel1.dart';
import 'package:artist_icon/model/SearchJobModel1/UserSearchAppliedJob.dart';
import 'package:artist_icon/model/TutorialPurchaseList/TutorialPurchaseList.dart';
import 'package:artist_icon/model/TutorialPurchaseModel/TutorialPurchase.dart';
import 'package:artist_icon/model/YourJobPostApplied/YourJobPostApplied.dart';
import 'package:artist_icon/model/YourJobPostListModel/YourJobPostList.dart';
import 'package:artist_icon/model/register/register_apiModel.dart';
import 'package:artist_icon/screens/edit_profile/model/EditProfileBean.dart';
import 'package:artist_icon/screens/feed/model/CreateJobPostModel.dart';
import 'package:artist_icon/screens/feed/model/CreatePostModel.dart';
import 'package:artist_icon/screens/feed/model/GetAllFeedsBean.dart';
import 'package:artist_icon/screens/feed/model/getAllPost/feed/FeedModel.dart';
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

class HttpService {
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

  Future<RequestUserLoginModel> sendOtpModel({String number}) async {
    Map reqBody = {
      "number": number
    };
    final response = await _apiHelper.post(
        'Artist_api/user_request_otp_for_login', reqBody);
    try {
      return RequestUserLoginModel.fromJson(response);
    } catch (e) {
      showExceptionToast();
      return null;
    }
  }


  Future<RequestUserLoginModel> request_otp_for_regester(
      {String number}) async {
    Map reqBody = {
      "number": number
    };
    final response = await _apiHelper.post(
        'Artist_api/request_otp_for_regester', reqBody);
    try {
      return RequestUserLoginModel.fromJson(response);
    } catch (e) {
      showExceptionToast();
      return null;
    }
  }

  Future<CreatepostModel> create_post(
      {String text, String title, String desc}) async {
    Map reqBody = {
      "jwtToken": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJ0aW1lU3RhbXAiOiIyMDIxLTA0LTEzIDEwOjQwOjAxIn0.2TNWx0yu22Uj37oqGbgNwB2cfvPNEREC6KqlbgnBJjk",
      "text": text,
      "media_type": "1",
      "is_tutorial": "1",
      "price": "10000",
      "title": title,
      "desc": desc,
      "file_url": "IMG_20200804_185303.jpg",
      "product_image": "IMG_20200804_185303.jpg"
    };
    final response = await _apiHelper.post('Feed_api/add_feed', reqBody);
    try {
      return CreatepostModel.fromJson(response);
    } catch (e) {
      showExceptionToast();
      return null;
    }
  }


  Future<register_apiModel> registerAPiModel(
      {String name, String email, String phone}) async
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


  Future<register_apiModel> users_login_api({String number, String otp}) async {
    Map reqBody = {
      "number": number,
      "otp": otp
    };
    final response = await _apiHelper.post(
        'Artist_api/users_login_api', reqBody);
    try {
      return register_apiModel.fromJson(response);
    } catch (e) {
      showExceptionToast();
      return null;
    }
  }

  Future<RecentSearchJobModel> job_categories_list(
      {String jwtToken, String limit, String search}) async {
    Map reqBody = {
      "jwtToken": jwtToken,
      "limit": limit,
      "search": search
    };
    final response = await _apiHelper.post(
        'Artist_api/job_categories_list', reqBody);
    try {
      return RecentSearchJobModel.fromJson(response);
    } catch (e) {
      showExceptionToast();
      return null;
    }
  }

  Future<RecentSearchJobModel> recent_search_job(
      {String jwtToken, String limit}) async {
    Map reqBody = {
      "jwtToken": jwtToken,
      "limit": limit
    };
    final response = await _apiHelper.post(
        'Artist_api/recent_search_job', reqBody);
    try {
      return RecentSearchJobModel.fromJson(response);
    } catch (e) {
      showExceptionToast();
      return null;
    }
  }

  Future<RecentSearchJobModel> recommended_jobs(
      {String jwtToken, String limit}) async {
    Map reqBody = {
      "jwtToken": jwtToken,
      "limit": limit
    };
    final response = await _apiHelper.post(
        'Artist_api/recommended_jobs', reqBody);
    try {
      return RecentSearchJobModel.fromJson(response);
    } catch (e) {
      showExceptionToast();
      return null;
    }
  }


  Future<TemplateListModel> template_list(
      {String jwtToken, String limit, String search}) async {
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

  Future<SearchJobModel> search_job(
      {String jwtToken, String Skills_id, String job_type, String city_id}) async {
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

  Future<SkillsListBean> skills_list(
      {String jwtToken, String limit, String search}) async {
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
  Future<FeedModel> getPostData(
      {String jwtToken, String limit}) async {
    Map reqBody = {
      "jwtToken": jwtToken,
      "pages": limit
    };
    final response = await _apiHelper.post('Feed_api/get_all_post', reqBody);
    try {
      return FeedModel.fromJson(response);
    } catch (e) {
      showExceptionToast();
      return null;
    }
  }



  Future<CityListBean> city_list(
      {String jwtToken, String limit, String search}) async {
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
  Future<GetProfileData> get_profile_data({String jwtToken}) async {
    Map reqBody = {
      "jwtToken": jwtToken
    };
    final response = await _apiHelper.post(
        'Artist_api/get_profile_data', reqBody);
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
      Response response = await dio.post(
          "https://artist.devclub.co.in/api/Artist_api/profile_update",
          data: data);
      return EditProfileBean.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      showExceptionToast();
      return null;
    }
  }

//manage profile
  Future<GetAllFeedsBean> get_all_post({String jwtToken, String pages}) async {
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
  Future<AddWorkExperienceModel> add_Work_exp(
      {String position, String comp_name,String startDate,String endDate,String current_work1,String company_location }) async {
    final prefs = await SharedPreferences.getInstance();
    Map reqBody = {
      'position': position,
      'company_name': comp_name,
      'start_date': startDate,
      'end_date': endDate,
      'currently_work_here': current_work1.toString(),
      'company_location': company_location,
      'jwtToken': prefs.getString('userID')
    };
    final response = await _apiHelper.post(
        'Artist_api/add_work_experience', reqBody);
    try {
      return AddWorkExperienceModel.fromJson(response);
    }
    catch (e) {

    }
  }

  //manage profile
  Future<AddEducationModel> add_education({
    String school_name, String education_level, String filled_of_study, String start_date, String end_date, String currently_study_here, String education_sub_category }) async {
    final prefs = await SharedPreferences.getInstance();
    Map reqBody = {
      "school_name": school_name,
      "education_level": education_level,
      "filled_of_study": filled_of_study,
      "start_date": start_date,
      "end_date": end_date,
      "currently_study_here": currently_study_here,
      "education_sub_category": education_sub_category,
      "education_location": "noida",
      "jwtToken": prefs.getString('userID')
    };
    final response = await _apiHelper.post('Artist_api/add_education', reqBody);
    try {
      return AddEducationModel.fromJson(response);
    } catch (e) {
      showExceptionToast();
      return null;
    }
  }

  Future<YourJobPostList>jobPostList()async
  {
    final prefs = await SharedPreferences.getInstance();
    Map reqBody = {
      "jwtToken": prefs.getString('userID')
    };
    final response = await _apiHelper.post('Artist_api/your_job_post_list', reqBody);
    try{
      return YourJobPostList.fromJson(response);
    }
    catch (e) {
      showExceptionToast();
      return null;
    }
  }
  Future<SearchJobModel1>searchJob1({String skillId,String jobId,String cityId})async{
    final prefs = await SharedPreferences.getInstance();
    Map reqBody={
      "jwtToken": prefs.getString('userID'),
      "Skills_id":skillId,
      "job_type":jobId,
      "city_id":cityId
    };
    final response = await _apiHelper.post('Artist_api/search_job', reqBody);
    try{
      return SearchJobModel1.fromJson(response);
    }
    catch(e)
    {
      showExceptionToast();
      return null;
    }
  }
  Future<UserSearchAppliedJob>searchJobApplied({String jobPostId})async{
    final prefs = await SharedPreferences.getInstance();
    Map reqBody={
      "jwtToken": prefs.getString('userID'),
      "job_post_id":jobPostId,
    };
    final response= await _apiHelper.post('Artist_api/user_applied_job', reqBody);
    try{
      return UserSearchAppliedJob.fromJson(response);
    }
    catch(e)
    {
      showExceptionToast();
      return null;
    }
  }

Future<YourJobPostApplied>jobPostApplied({String id})async{
  final prefs = await SharedPreferences.getInstance();
  Map reqBody = {
    "jwtToken": prefs.getString('userID'),
    "job_id":id.toString(),
  } ;
  final response = await _apiHelper.post('Artist_api/applied_job_post_list', reqBody);
  try{
    return YourJobPostApplied.fromJson(response);
  }
  catch(e){
    showExceptionToast();
    return null;
  }
}
Future<ChangeStatusApplied>changeStatus({String id,String type})async
{
  final prefs = await SharedPreferences.getInstance();
  Map reqBody = {
    "jwtToken": prefs.getString('userID'),
    "applied_job_id":id.toString(),
    "select_type":type
  } ;
  final response=await _apiHelper.post('Artist_api/change_status_applied_job_type', reqBody);
  try{
    return ChangeStatusApplied.fromJson(response);
  }
  catch(e)
  {
    showExceptionToast();
    return null;
  }

}
  Future<CreateJobPostModel> create_job_post({
    String category_id, String location, String company_name, String title, String other_skill, String salary_from, String salary_to, String experience_from, String experience_to, String job_type, String working_hours, String city_id, String job_description ,String skills}) async {
    final prefs = await SharedPreferences.getInstance();
    Map reqBody = {
      "jwtToken": prefs.getString('userID'),
      "category_id": category_id,
      "location": location,
      "title": title,
      "job_description": job_description,
      "skills": skills,
      "other_skills": other_skill,
      "salary_from": salary_from,
      "salary_to": salary_to,
      "experience_to": experience_to,
      "experience_form": experience_from,
      "job_type": job_type,
      "company_name": company_name,
      "working_hours": working_hours,
      "city_id": city_id
    } ;
    final response = await _apiHelper.post(
        "Artist_api/create_job_post", reqBody);
    try {
      return CreateJobPostModel.fromJson(response);
    } catch (e) {
      showExceptionToast();
      return null;
    }
  }

  Future<TutorialPurchase> tutorial_purchase({String postId,String price}) async{
    final prefs = await SharedPreferences.getInstance();
    Map reqBody = {
      "jwtToken": prefs.getString('userID'),
      "post_id":postId,
      "price":price
    } ;
    final response = await _apiHelper.post('Artist_api/tutorial_purchase', reqBody);
    try{
      return TutorialPurchase.fromJson(response);
    }
    catch(e){
      showExceptionToast();
      return null;
    }
  }

  Future<GetAllBookMark>getBookMarkDetails()async{
    final prefs = await SharedPreferences.getInstance();
    Map reqBody = {
      "jwtToken": prefs.getString('userID'),
      "pages":"1",
    };
    final response=await _apiHelper.post('Feed_api/get_all_bookmark_post', reqBody);
    try{
      return GetAllBookMark.fromJson(response);
    }
    catch(e)
    {
      showExceptionToast();
      return null;
    }
  }
  Future<DoLike>doLike({String id})async{
    final prefs = await SharedPreferences.getInstance();
    Map reqBody={
      "jwtToken": prefs.getString('userID'),
      "post_id":id
    };
    final response=await _apiHelper.post('Feed_api/do_like', reqBody);
    try{
      return DoLike.fromJson(response);
    }
    catch(e)
    {
      showExceptionToast();
      return null;
    }
  }
  Future<DoBookMark>doBookMark({String id})async{
    final prefs = await SharedPreferences.getInstance();
    Map reqBody={
      "jwtToken": prefs.getString('userID'),
      "post_id":id
    };
    final response=await _apiHelper.post('Feed_api/do_bookmark', reqBody);
    try{
      return DoBookMark.fromJson(response);
    }
    catch(e){
      showExceptionToast();
      return null;
    }
  }

  Future<GetUserFeed>getUserFeedDetails({String id,String pages})async{
    final prefs = await SharedPreferences.getInstance();
    Map reqBody={
      "jwtToken": prefs.getString('userID'),
      "pages":pages,
      "id_user":id
    };
    final response=await _apiHelper.post('Feed_api/user_feed', reqBody);
    try{
      return GetUserFeed.fromJson(response);
    }
    catch(e)
    {
      showExceptionToast();
      return null;
    }
  }
  Future<TutorialPurchaseList> getMyTutorialPurchaseList()async{
    final prefs = await SharedPreferences.getInstance();
    Map reqBody={
      "jwtToken": prefs.getString('userID'),
      "pages":"1",
    };
    final response=await _apiHelper.post('Feed_api/get_my_tutorial_purchase_list', reqBody);
    try{
      return TutorialPurchaseList.fromJson(response);
    }
    catch(e){
      showExceptionToast();
      return null;
    }
  }
  Future<MyFeedModel>myFeed()async{
    final prefs = await SharedPreferences.getInstance();
    Map reqBody={
      "jwtToken": prefs.getString('userID'),
      "pages":"1",
    };
    final response=await _apiHelper.post('Feed_api/my_feed', reqBody);
    try{
      return MyFeedModel.fromJson(response);
    }
    catch(e)
    {
      showExceptionToast();
      return null;
    }
  }
}
