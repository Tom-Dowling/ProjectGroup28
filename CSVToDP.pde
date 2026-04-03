public ArrayList<DataPoint> CSVToDataPoint(String file, boolean hideCancelled, boolean hideDiverted) {

  ArrayList<DataPoint> dataPoints = new ArrayList<DataPoint>();

  BufferedReader reader = null;
  String line   = "";
  int count     = 0;

  try {
    reader = new BufferedReader(new FileReader(sketchPath(file)));

    while ((line = reader.readLine()) != null) {
      if (count > 0) {
        try {
          String[] parts = line.split(",(?=(?:[^\"]*\"[^\"]*\")*[^\"]*$)");

          String FL_DATE       = parts[0];
          String MKT_CARRIER   = parts[1];

          int MKT_CARRIER_FL_NUM = parts[2].equals("") ? 0 : Integer.parseInt(parts[2]);

          String ORIGIN           = parts[3];
          String ORIGIN_CITY_NAME = parts[4];
          String ORIGIN_STATE_ABR = parts[5];

          int ORIGIN_WAC = parts[6].equals("") ? 0 : Integer.parseInt(parts[6]);

          String DEST           = parts[7];
          String DEST_CITY_NAME = parts[8];
          String DEST_STATE_ABR = parts[9];
          if (DEST_STATE_ABR.equals("CA")) CA++;
          else if (DEST_STATE_ABR.equals("NY")) NY++;
          else if (DEST_STATE_ABR.equals("FL")) FL++;
          else if (DEST_STATE_ABR.equals("VA")) VA++;
          else if (DEST_STATE_ABR.equals("WA")) WA++;
          else if (DEST_STATE_ABR.equals("IL")) IL++;
          else if (DEST_STATE_ABR.equals("TX")) TX++;


          int DEST_WAC     = parts[10].equals("") ? 0 : Integer.parseInt(parts[10]);
          int CRS_DEP_TIME = parts[11].equals("") ? 0 : Integer.parseInt(parts[11]);
          int DEP_TIME     = parts[12].equals("") ? 0 : Integer.parseInt(parts[12]);
          int CRS_ARR_TIME = parts[13].equals("") ? 0 : Integer.parseInt(parts[13]);
          int ARR_TIME     = parts[14].equals("") ? 0 : Integer.parseInt(parts[14]);

          boolean CANCELLED = parts[15].trim().equals("0") ? false : true;
          if (hideCancelled == true && CANCELLED == true) continue;

          boolean DIVERTED  = parts[16].trim().equals("0") ? false : true;
          if (hideDiverted == true && DIVERTED == true) continue;

          int DISTANCE = Integer.parseInt(parts[17]);

          dataPoints.add(new DataPoint(
            FL_DATE, MKT_CARRIER, MKT_CARRIER_FL_NUM,
            ORIGIN, ORIGIN_CITY_NAME, ORIGIN_STATE_ABR, ORIGIN_WAC,
            DEST, DEST_CITY_NAME, DEST_STATE_ABR, DEST_WAC,
            CRS_DEP_TIME, DEP_TIME, CRS_ARR_TIME, ARR_TIME,
            CANCELLED, DIVERTED, DISTANCE
            ));
        }
        catch (Exception e) {
          System.out.println("bad row " + count + e.getMessage());
        }
      }
      count++;
    }
  }
  catch (Exception e) {
    //e.printStackTrace();
  }
  finally {
    try {
      if (reader != null) reader.close();
    }
    catch (IOException e) {
      e.printStackTrace();
    }
  }

  return dataPoints;
}
