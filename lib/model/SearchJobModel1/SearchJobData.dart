class Data {
  String id;
  String userId;
  String categoryId;
  String title;
  String img;
  String companyName;
  String workingHours;
  String salaryFrom;
  String salaryTo;
  String jobDescription;
  String skills;
  String otherSkills;
  String location;
  String experienceTo;
  String experienceForm;
  String jobType;
  String skillsName;
  String status;
  String createdAt;
  String updatedAt;
  int appliedCount;
  String isApplied;
  String isSave;

  Data(
      {this.id,
        this.userId,
        this.categoryId,
        this.title,
        this.img,
        this.companyName,
        this.workingHours,
        this.salaryFrom,
        this.salaryTo,
        this.jobDescription,
        this.skills,
        this.otherSkills,
        this.location,
        this.experienceTo,
        this.experienceForm,
        this.jobType,
        this.skillsName,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.appliedCount,
        this.isApplied,
        this.isSave});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    title = json['title'];
    img = json['img'];
    companyName = json['company_name'];
    workingHours = json['working_hours'];
    salaryFrom = json['salary_from'];
    salaryTo = json['salary_to'];
    jobDescription = json['job_description'];
    skills = json['skills'];
    otherSkills = json['other_skills'];
    location = json['location'];
    experienceTo = json['experience_to'];
    experienceForm = json['experience_form'];
    jobType = json['job_type'];
    skillsName = json['skills_name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    appliedCount = json['applied_count'];
    isApplied = json['is_applied'];
    isSave = json['is_save'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['category_id'] = this.categoryId;
    data['title'] = this.title;
    data['img'] = this.img;
    data['company_name'] = this.companyName;
    data['working_hours'] = this.workingHours;
    data['salary_from'] = this.salaryFrom;
    data['salary_to'] = this.salaryTo;
    data['job_description'] = this.jobDescription;
    data['skills'] = this.skills;
    data['other_skills'] = this.otherSkills;
    data['location'] = this.location;
    data['experience_to'] = this.experienceTo;
    data['experience_form'] = this.experienceForm;
    data['job_type'] = this.jobType;
    data['skills_name'] = this.skillsName;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['applied_count'] = this.appliedCount;
    data['is_applied'] = this.isApplied;
    data['is_save'] = this.isSave;
    return data;
  }
}