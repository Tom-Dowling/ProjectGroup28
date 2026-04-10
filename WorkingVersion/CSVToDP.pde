public ArrayList<DataPoint> CSVToDataPoint(String file, boolean hideCancelled, boolean hideDiverted) {

  ArrayList<DataPoint> dataPoints = new ArrayList<DataPoint>();

  BufferedReader reader = null;
  String line   = "";
  int count     = 0;

  try {
    reader = new BufferedReader(new FileReader(sketchPath(file))); //using a BufferedReader stores a large chunk of the file data at a time whch the reader then searches instead of the file itself, this improves processing speed

    while ((line = reader.readLine()) != null) { //Goes through eaach line of file until it meets a null line, saves the current line as a string to the 'line variable'
      if (count > 0) { //this skips the 0th line of the file which does not have data but is simply the headings of the collumns, also allows the programme to report the number of the iteration if it runs into an error
        try {
          String[] parts = line.split(",(?=(?:[^\"]*\"[^\"]*\")*[^\"]*$)"); //splits the current string into an array of smaller strings by seperating them by the appearance of a comma(it is a comma seperated values file)
                                                                            //However, (?=(?:[^\"]*\"[^\"]*\")*[^\"]*$) makes sure that if a comma appears inbetween quotation marks(which the problem values are) then don't count it
                                                                            //This prevents values which contain a comma(such as "New York, NY" to not be seperate themselves, which would cause errors.
                                                                            //This is done by the programme checking the amount of quations marks in the remainder of the string, if odd(i.e. we are inside of a value, then don't seperate by comma).


          String FL_DATE       = parts[0];
          String dateNumber = String.valueOf(FL_DATE.charAt(2));
          switch (dateNumber) {            //checks the date of the flight and updates the corresponding date count variable for bar chart to display when no filters are applied
          case "1": initialJan1++; break;
          case "2": initialJan2++; break;
          case "3": initialJan3++; break;
          case "4": initialJan4++; break;
          case "5": initialJan5++; break;
          case "6": initialJan6++; break;
          }

          // All of these assign the each part of the string(i.e. each value) to the correpsonding varibale to be saved 

          String MKT_CARRIER   = parts[1];

          int MKT_CARRIER_FL_NUM = parts[2].equals("") ? 0 : Integer.parseInt(parts[2]); //converts the value to an int before saving, if the value is a blank cell then it just saves it as 0

          String ORIGIN           = parts[3];
          String ORIGIN_CITY_NAME = parts[4];
          String ORIGIN_STATE_ABR = parts[5];

          int ORIGIN_WAC = parts[6].equals("") ? 0 : Integer.parseInt(parts[6]);

          String DEST           = parts[7];
          String DEST_CITY_NAME = parts[8];
          String DEST_STATE_ABR = parts[9];
          switch (DEST_STATE_ABR) {         //checks the destination state of the flight and updates the corresponding state count variable for bar chart to display when no filters are applied
              case "CA": initialCA++; break;
              case "NY": initialNY++; break;
              case "FL": initialFL++; break;
              case "VA": initialVA++; break;
              case "WA": initialWA++; break;
              case "IL": initialIL++; break;
              case "HI": initialHI++; break;
              case "TX": initialTX++; break;
              case "OR": initialOR++; break;
              case "NM": initialNM++; break;
              case "NJ": initialNJ++; break;
          }


          int DEST_WAC     = parts[10].equals("") ? 0 : Integer.parseInt(parts[10]);
          int CRS_DEP_TIME = parts[11].equals("") ? 0 : Integer.parseInt(parts[11]);
          int DEP_TIME     = parts[12].equals("") ? 0 : Integer.parseInt(parts[12]);
          int CRS_ARR_TIME = parts[13].equals("") ? 0 : Integer.parseInt(parts[13]);
          int ARR_TIME     = parts[14].equals("") ? 0 : Integer.parseInt(parts[14]);

          boolean CANCELLED = parts[15].trim().equals("0.00") ? false : true; // the file represents a flight being not cancelled as 0.00 in this cell, we check for this value and then otherwise save it as false

          boolean DIVERTED  = parts[16].trim().equals("0.00") ? false : true;

          float DISTANCE = Float.parseFloat(parts[17]);
          
          dataPoints.add(new DataPoint(                      //uses the saved variables to create an object of the DataPoint class and save that to an arrayList
            FL_DATE, MKT_CARRIER, MKT_CARRIER_FL_NUM,
            ORIGIN, ORIGIN_CITY_NAME, ORIGIN_STATE_ABR, ORIGIN_WAC,
            DEST, DEST_CITY_NAME, DEST_STATE_ABR, DEST_WAC,
            CRS_DEP_TIME, DEP_TIME, CRS_ARR_TIME, ARR_TIME,
            CANCELLED, DIVERTED, DISTANCE, dateNumber
            ));
        }
        catch (Exception e) {
          System.out.println("bad row " + count + e.getMessage()); //if the programme runs into an error while processing lines this prints the error and the line of the csv which caused it, preventing the programme from crashing by small errors but reports them to be fixed
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
      if (reader != null) reader.close(); //closes the reader
    }
    catch (IOException e) {
      e.printStackTrace();
    }
  }

  return dataPoints; //returns the array list of the saved data points
}
