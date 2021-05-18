
class Data {
    String country;
    String created_at;
    String email;
    String gender;
    String home_town;
    String id;
    String jwtToken;
    String name;
    String perfect_work_location;
    String phone;
    String profile_img;
    String profile_summary;
    String resume;
    String resume_headline;
    String skill;
    String status;
    String your_interests;

    Data({ this.country, this.created_at, this.email,  this.gender, this.home_town, this.id, this.jwtToken, this.name, this.perfect_work_location, this.phone, this.profile_img, this.profile_summary, this.resume, this.resume_headline, this.skill, this.status, this.your_interests});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            country: json['country'], 
            created_at: json['created_at'], 
            email: json['email'], 
            gender: json['gender'], 
            home_town: json['home_town'], 
            id: json['id'], 
            jwtToken: json['jwtToken'], 
            name: json['name'], 
            perfect_work_location: json['perfect_work_location'], 
            phone: json['phone'], 
            profile_img: json['profile_img'], 
            profile_summary: json['profile_summary'], 
            resume: json['resume'], 
            resume_headline: json['resume_headline'], 
            skill: json['skill'], 
            status: json['status'], 
            your_interests: json['your_interests'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['country'] = this.country;
        data['created_at'] = this.created_at;
        data['email'] = this.email;
        data['gender'] = this.gender;
        data['home_town'] = this.home_town;
        data['id'] = this.id;
        data['jwtToken'] = this.jwtToken;
        data['name'] = this.name;
        data['perfect_work_location'] = this.perfect_work_location;
        data['phone'] = this.phone;
        data['profile_img'] = this.profile_img;
        data['profile_summary'] = this.profile_summary;
        data['resume'] = this.resume;
        data['resume_headline'] = this.resume_headline;
        data['skill'] = this.skill;
        data['status'] = this.status;
        data['your_interests'] = this.your_interests;
        return data;
    }
}