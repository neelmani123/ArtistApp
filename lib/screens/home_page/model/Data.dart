
class Data {
    int applied_count;
    String category_id;
    String company_name;
    String created_at;
    String experience_form;
    String experience_to;
    String id;
    String img;
    String is_save;
    String job_description;
    String job_type;
    String location;
    String other_skills;
    String salary_from;
    String salary_to;
    String skills;
    String skills_name;
    String status;
    String title;
    String name;
    String updated_at;
    String user_id;
    String working_hours;

    Data({this.name,this.applied_count, this.category_id, this.company_name, this.created_at, this.experience_form, this.experience_to, this.id, this.img, this.is_save, this.job_description, this.job_type, this.location, this.other_skills, this.salary_from, this.salary_to, this.skills, this.skills_name, this.status, this.title, this.updated_at, this.user_id, this.working_hours});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            name: json['name'],
            applied_count: json['applied_count'], 
            category_id: json['category_id'], 
            company_name: json['company_name'], 
            created_at: json['created_at'], 
            experience_form: json['experience_form'], 
            experience_to: json['experience_to'], 
            id: json['id'], 
            img: json['img'], 
            is_save: json['is_save'], 
            job_description: json['job_description'], 
            job_type: json['job_type'], 
            location: json['location'], 
            other_skills: json['other_skills'], 
            salary_from: json['salary_from'], 
            salary_to: json['salary_to'], 
            skills: json['skills'], 
            skills_name: json['skills_name'], 
            status: json['status'], 
            title: json['title'], 
            updated_at: json['updated_at'], 
            user_id: json['user_id'], 
            working_hours: json['working_hours'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['name'] = this.name;
        data['applied_count'] = this.applied_count;
        data['category_id'] = this.category_id;
        data['company_name'] = this.company_name;
        data['created_at'] = this.created_at;
        data['experience_form'] = this.experience_form;
        data['experience_to'] = this.experience_to;
        data['id'] = this.id;
        data['img'] = this.img;
        data['is_save'] = this.is_save;
        data['job_description'] = this.job_description;
        data['job_type'] = this.job_type;
        data['location'] = this.location;
        data['other_skills'] = this.other_skills;
        data['salary_from'] = this.salary_from;
        data['salary_to'] = this.salary_to;
        data['skills'] = this.skills;
        data['skills_name'] = this.skills_name;
        data['status'] = this.status;
        data['title'] = this.title;
        data['updated_at'] = this.updated_at;
        data['user_id'] = this.user_id;
        data['working_hours'] = this.working_hours;
        return data;
    }
}