removeAllWeapons player;
[] call ES_fnc_civFetchGear;
[] call ES_fnc_sessionUpdate; 
[] call ES_fnc_civLoadGear;
titleText["Deine Waffen wurden beschlagnahmt.","PLAIN"];
