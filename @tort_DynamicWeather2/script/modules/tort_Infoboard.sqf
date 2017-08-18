private ["_runs","_rndActive", "_winddir", "_processing", "_overcast", "_fog", "_wind", "_rain"];
//if (tort_infoboard_permanent == -1) then {_runs = 2} else {_runs = 100000};

while {tort_infoboard_permanent > 0} do {
   if (tort_dynamicweather2_watch) then {
      if (tort_process_overcast) then {_overcast = "#00ff00"} else {_overcast = "#ff0000"};
      if (tort_process_fog) then {_fog = "#00ff00"} else {_fog = "#ff0000"};
      if (tort_process_wind) then {_wind = "#00ff00"} else {_wind = "#ff0000"};
      if (tort_process_rain) then {_rain = "#00ff00"} else {_rain = "#ff0000"};
   } else {
      _overcast = "#ff0000";
      _fog = "#ff0000";
      _wind = "#ff0000";
      _rain = "#ff0000";
   };
   _Stxt = parseText format
   ["
   <t color='%21'>OVC: </t><t color='#CCCCCC'>MIN:%1</t><t color='#00ff00'> %2</t><t color='#ffffff'>->%3</t><t color='#CCCCCC'> MAX:%4</t><br/>
   <t color='%22'>FOG: </t><t color='#CCCCCC'>MIN:%5</t><t color='#00ff00'> %6</t><t color='#ffffff'>->%7</t><t color='#CCCCCC'> MAX:%8</t><br/>
   <t color='%23'>WIND[m/s]: </t><t color='#CCCCCC'>MIN:%9</t><t color='#00ff00'> %10</t><t color='#CCCCCC'> MAX:%11</t><br/>
   <t color='%23'>WDIR: </t><t color='#CCCCCC'>MIN:%12</t><t color='#00ff00'> %13</t><t color='#ffffff'>->%14</t><t color='#CCCCCC'> MAX:%15</t><br/>
   <t color='%24'>RAIN: </t><t color='#CCCCCC'>(TR %16) MIN:%17</t><t color='#00ff00'> %18</t><t color='#ffffff'>->%19</t><t color='#CCCCCC'> MAX:%20</t>
   ",
   round(tort_overcast_min*100)/100,
   round(overcast*100)/100,
   round(tort_overcast_amount*100)/100,
   round(tort_overcast_max*100)/100,

   round(tort_fog_min*100)/100,
   round(fog*100)/100,
   round(tort_fog_amount*100)/100,
   round(tort_fog_max*100)/100,

   round(tort_wind_speed_min*10)/10,
   round(tort_wind_speed*10)/10,
   round(tort_wind_speed_max*10)/10,

   round(tort_wind_dir_min),
   round((winddir + 180) mod 360),
   round(tort_wind_Dir),
   round(tort_wind_dir_max*100)/100,

   round(tort_rain_threshold*100)/100,
   round(tort_rain_min*100)/100,
   round(rain*100)/100,
   round(tort_rain_amount*100)/100,
   round(tort_rain_max*100)/100,
   _overcast,
   _fog,
   _wind,
   _rain
   ];
   hintsilent _Stxt;
   sleep 1;
};

tort_infoboard_permanent = 0;