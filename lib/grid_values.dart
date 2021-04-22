class GridValues {
  static String  grid1 = '';
  static String  grid2 = '';
  static String  grid3 = '';
  static String  grid4 = '';
  static String  grid5 = '';
  static String  grid6 = '';
  static String  grid7 = '';
  static String  grid8 = '';
  static String  grid9 = '';

  static clearGridValues() {
    grid1 = '';
    grid2 = '';
    grid3 = '';
    grid4 = '';
    grid5 = '';
    grid6 = '';
    grid7 = '';
    grid8 = '';
    grid9 = '';
  }

  static setGridValues(var gridList) {
   grid1 = gridList[1];
    grid2 = gridList[2];
    grid3 = gridList[3];
    grid4 = gridList[4];
    grid5 = gridList[5];
    grid6 = gridList[6];
    grid7 = gridList[7];
    grid8 = gridList[8];
    grid9 = gridList[9];
  }
}