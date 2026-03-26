void displayFilters(){ // putting all 17 requirements at the top of the graph
                      //to distinguish the differnt data types
   // using an array to print different strings
  String[] words = {"Date","Carrier","Fl num","Origin","City Name","Or State","Orig Wac",
                    "Dest","Dest City","Dest State","Dest Wac","CRS Dep t","Dep time",
                    "CRS arr t","Arr time","Cancelled","Diverted","Distance"};
  for (int i = 0; i < words.length; i++) { // go through each word
  fill(0);
  textSize(15);
  strokeWeight(10);
  text(words[i], i*77.7+10, 300); // 1400 our screen length /18 is 77.7. 
                                //So add that everytime we print a new word off
}                               // start 300 down so space for filters later
  
}
