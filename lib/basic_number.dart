int getBasicNumber(int date) {
  int sum = 0;
  while(date > 0) {
    sum += date%10;
    date = (date/10).floor();
  }
  if(sum < 10)
    return sum;
  else
    return getBasicNumber(sum);
}

int getYearUnit(int year) {
  return year%10;
}

int getYearDecade(int year) {
  year = (year/1000).floor();
  return year%10;

}

int getMonthGreaterThanNine(int month) {
  if(month < 9) {
    return 0;
  }
  else return 1;
}

int getMonthLessThanNine(int month) {
  if(month <10)
    return month;

  else
    return month%10;
}

int getDestinyNumber(int date, int month, int year) {
  int sum = getBasicNumber(date) + getBasicNumber(month) + getBasicNumber(year);
  return getBasicNumber(sum);
}

int getDateUnit(int date) {
  return date%10;
}

int getDateTens(int date) {
  date = (date/10).floor();
  return date%10;
}
