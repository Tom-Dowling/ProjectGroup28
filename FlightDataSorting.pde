class Flight {
  String airport;
  String flightNumber;
  
  Flight(String airport, String flightNumber) {
    this.airport = airport;
    this.flightNumber = flightNumber;
  }    
}

// count flights per airport
int[] getFlightCountsSorted(Flight[] flights, String[] airports) {
  int[] counts = new int[airports.length];
  
  for (Flight f : flights) {
    for (int i = 0; i < airports.length; i++) {
      if (f.airport.equals(airports[i])) {
        counts[i]++;
        break;
      }
    }
  }
  
  // bubble sort airports and counts together (descending order)
  for (int i = 0; i < airports.length - 1; i++) {
    for (int j = 0; j < airports.length - 1 - i; j++) {
      if (counts[j] < counts[j + 1]) {
        
        int tempCount = counts[j];     // swap counts
        counts[j] = counts[j + 1];
        counts[j + 1] = tempCount;
        
        String tempAirport = airports[j];  // swap airport names
        airports[j] = airports[j + 1];
        airports[j + 1] = tempAirport;
      }
    }
  }
  
  return counts;
}
