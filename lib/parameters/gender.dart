enum Gender{
  MALE,
  FEMALE,
  OTHER;
}

extension GendersExtends on Gender{
  String get value{
    switch(this){
      case Gender.MALE:
        return 'male';
      case Gender.FEMALE:
        return 'female';
      case Gender.OTHER:
        return 'other';
    }
  }
}