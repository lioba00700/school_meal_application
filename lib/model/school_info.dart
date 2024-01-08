class SchoolInfo{
  final String name;
  final String officeOfEduCode;
  final String adminStandardCode;

  SchoolInfo({
    required this.name,
    required this.officeOfEduCode,
    required this.adminStandardCode,
  });

  SchoolInfo.empty()
      : name = '',
      officeOfEduCode ='',
      adminStandardCode = '';

  factory SchoolInfo.fromJson(Map<String,dynamic> json){
    return SchoolInfo(
      name: json['SCHUL_NM'], 
      officeOfEduCode: json['ATPT_OFCDC_SC_CODE'], 
      adminStandardCode: json['SD_SCHUL_CODE'],
    );
  }
}