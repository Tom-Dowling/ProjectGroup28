class DataPoint {

  String FL_DATE;
  String MKT_CARRIER;
  int MKT_CARRIER_FL_NUM;
  String ORIGIN;
  String ORIGIN_CITY_NAME;
  String ORIGIN_STATE_ABR;
  int ORIGIN_WAC;
  String DEST;
  String DEST_CITY_NAME;
  String DEST_STATE_ABR;
  int DEST_WAC;
  int CRS_DEP_TIME;
  int DEP_TIME;
  int CRS_ARR_TIME;
  int ARR_TIME;
  Boolean CANCELLED;
  Boolean DIVERTED;
  int DISTANCE;


  DataPoint(String FL_DATE, String MKT_CARRIER, int MKT_CARRIER_FL_NUM, String ORIGIN, String ORIGIN_CITY_NAME, String ORIGIN_STATE_ABR, int ORIGIN_WAC, String DEST, String DEST_CITY_NAME,
    String DEST_STATE_ABR, int DEST_WAC, int CRS_DEP_TIME, int DEP_TIME, int CRS_ARR_TIME, int ARR_TIME, Boolean CANCELLED, Boolean DIVERTED, int DISTANCE)
  {
    this.FL_DATE = FL_DATE;
    this.MKT_CARRIER = MKT_CARRIER;
    this.MKT_CARRIER_FL_NUM = MKT_CARRIER_FL_NUM;
    this.ORIGIN = ORIGIN;
    this.ORIGIN_CITY_NAME = ORIGIN_CITY_NAME;
    this.ORIGIN_STATE_ABR = ORIGIN_STATE_ABR;
    this.ORIGIN_WAC = ORIGIN_WAC;
    this.DEST = DEST;
    this.DEST_CITY_NAME = DEST_CITY_NAME;
    this.DEST_STATE_ABR = DEST_STATE_ABR;
    this.DEST_WAC = DEST_WAC;
    this.CRS_DEP_TIME = CRS_DEP_TIME;
    this.DEP_TIME = DEP_TIME;
    this.CRS_ARR_TIME = CRS_ARR_TIME;
    this.ARR_TIME = ARR_TIME;
    this.CANCELLED = CANCELLED;
    this.DIVERTED = DIVERTED;
    this.DISTANCE = DISTANCE;
  }

  DataPoint()
  {
    this.FL_DATE = null;
    this.MKT_CARRIER = null;
    this.MKT_CARRIER_FL_NUM = 0;
    this.ORIGIN = null;
    this.ORIGIN_CITY_NAME = null;
    this.ORIGIN_STATE_ABR = null;
    this.ORIGIN_WAC = 0;
    this.DEST = null;
    this.DEST_CITY_NAME = null;
    this.DEST_STATE_ABR = null;
    this.DEST_WAC = 0;
    this.CRS_DEP_TIME = 0;
    this.DEP_TIME = 0;
    this.CRS_ARR_TIME = 0;
    this.ARR_TIME = 0;
    this.CANCELLED = true;
    this.DIVERTED = true;
    this.DISTANCE = 0;
  }
}
