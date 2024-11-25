import 'package:flutter/material.dart';
import 'package:schedule_app/app/app.locator.dart';
import 'package:schedule_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

void main() async {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: StackedService.navigatorKey,
      title: 'Schedule App',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }

  import ast
  import datetime
  import time
  from tickdata import TickData
  from copy import copy
  from typing import Dict, List

  def safe_eval_line(line):
          line = line.replace("datetime.datetime", "datetime.datetime")
                  try:
                              # Evaluate the string safely
                                          return eval(line, {"datetime": datetime})
                                                  except Exception as e:
                                                              print(f"Error evaluating line: {e}")
                                                                          return None

                                                                          def read_ticks(file_path):
                                                                              with open(file_path, 'r') as file:
                                                                                      for line in file:
                                                                                                  tick = safe_eval_line(line.strip())
                                                                                                              if tick:
                                                                                                                              yield tick  # Yield the first (and only) tick object in the list

                                                                                                                              file_path = 'bankextestdata.txt'
                                                                                                                              candles_1: Dict[str, List[TickData]]={}
                                                                                                                              for ticks in read_ticks(file_path): 
                                                                                                                                  tickData=TickData(ticks[0])
                                                                                                                                      print(tickData.last_price,tickData.exchange_timestamp)
                                                                                                                                          instrument=tickData.instrument_token
                                                                                                                                              ltt= tickData.exchange_timestamp
                                                                                                                                                  # create current min and previous min
                                                                                                                                                      current_min=datetime.datetime(ltt.year, ltt.month, ltt.day, ltt.hour,ltt.minute)
                                                                                                                                                          previous_min=current_min - datetime.timedelta(minutes=1)
                                                                                                                                                              
                                                                                                                                                                  if instrument in candles_1:
                                                                                                                                                                          if current_min in candles_1[instrument]:
                                                                                                                                                                                      candles_1[instrument][current_min].ohlc.high = max(candles_1[instrument][current_min].ohlc.high,
                                                                                                                                                                                                                                                                   tickData.last_price)  
                                                                                                                                                                                                                                                                               candles_1[instrument][current_min].ohlc.low = min(candles_1[instrument][current_min].ohlc.low,
                                                                                                                                                                                                                                                                                                                                                           tickData.last_price)  
                                                                                                                                                                                                                                                                                                                                                                       candles_1[instrument][current_min].ohlc.close = tickData.last_price  
                                                                                                                                                                                                                                                                                                                                                                               else:
                                                                                                                                                                                                                                                                                                                                                                                           candles_1[instrument][current_min] = {}
                                                                                                                                                                                                                                                                                                                                                                                                       candles_1[instrument][current_min]=tickData
                                                                                                                                                                                                                                                                                                                                                                                                                   
                                                                                                                                                                                                                                                                                                                                                                                                                               #when new candle created check if there is completed previous candle or not if then push
                                                                                                                                                                                                                                                                                                                                                                                                                                           if previous_min in candles_1[instrument]:
                                                                                                                                                                                                                                                                                                                                                                                                                                                           print(candles_1[instrument][previous_min])
                                                                                                                                                                                                                                                                                                                                                                                                                                                               else:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                       #if not present create empty dict for that instrument
                                                                                                                                                                                                                                                                                                                                                                                                                                                                               candles_1[instrument]={}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       print("created dict for "+str(instrument))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           time.sleep(.1)  
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
}import ast
import datetime
import time
from tickdata import TickData
from copy import copy
from typing import Dict, List

def safe_eval_line(line):
        line = line.replace("datetime.datetime", "datetime.datetime")
                try:
                            # Evaluate the string safely
                                        return eval(line, {"datetime": datetime})
                                                except Exception as e:
                                                            print(f"Error evaluating line: {e}")
                                                                        return None

                                                                        def read_ticks(file_path):
                                                                            with open(file_path, 'r') as file:
                                                                                    for line in file:
                                                                                                tick = safe_eval_line(line.strip())
                                                                                                            if tick:
                                                                                                                            yield tick  # Yield the first (and only) tick object in the list

                                                                                                                            file_path = 'bankextestdata.txt'
                                                                                                                            candles_1: Dict[str, List[TickData]]={}
                                                                                                                            for ticks in read_ticks(file_path): 
                                                                                                                                tickData=TickData(ticks[0])
                                                                                                                                    print(tickData.last_price,tickData.exchange_timestamp)
                                                                                                                                        instrument=tickData.instrument_token
                                                                                                                                            ltt= tickData.exchange_timestamp
                                                                                                                                                # create current min and previous min
                                                                                                                                                    current_min=datetime.datetime(ltt.year, ltt.month, ltt.day, ltt.hour,ltt.minute)
                                                                                                                                                        previous_min=current_min - datetime.timedelta(minutes=1)
                                                                                                                                                            
                                                                                                                                                                if instrument in candles_1:
                                                                                                                                                                        if current_min in candles_1[instrument]:
                                                                                                                                                                                    candles_1[instrument][current_min].ohlc.high = max(candles_1[instrument][current_min].ohlc.high,
                                                                                                                                                                                                                                                                 tickData.last_price)  
                                                                                                                                                                                                                                                                             candles_1[instrument][current_min].ohlc.low = min(candles_1[instrument][current_min].ohlc.low,
                                                                                                                                                                                                                                                                                                                                                         tickData.last_price)  
                                                                                                                                                                                                                                                                                                                                                                     candles_1[instrument][current_min].ohlc.close = tickData.last_price  
                                                                                                                                                                                                                                                                                                                                                                             else:
                                                                                                                                                                                                                                                                                                                                                                                         candles_1[instrument][current_min] = {}
                                                                                                                                                                                                                                                                                                                                                                                                     candles_1[instrument][current_min]=tickData
                                                                                                                                                                                                                                                                                                                                                                                                                 
                                                                                                                                                                                                                                                                                                                                                                                                                             #when new candle created check if there is completed previous candle or not if then push
                                                                                                                                                                                                                                                                                                                                                                                                                                         if previous_min in candles_1[instrument]:
                                                                                                                                                                                                                                                                                                                                                                                                                                                         print(candles_1[instrument][previous_min])
                                                                                                                                                                                                                                                                                                                                                                                                                                                             else:
                                                                                                                                                                                                                                                                                                                                                                                                                                                                     #if not present create empty dict for that instrument
                                                                                                                                                                                                                                                                                                                                                                                                                                                                             candles_1[instrument]={}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     print("created dict for "+str(instrument))
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         time.sleep(.1)  

