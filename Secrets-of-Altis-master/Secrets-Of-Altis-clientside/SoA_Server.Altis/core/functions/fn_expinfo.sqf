/*

		fn_expinfo.sqf
		Author: G00golplexian
		
		Description: Displays how many xp you've got, and how many you need.
*/

switch(life_level) do {

case 0: {hint parsetext format ["<t color ='#FFA500'>Erfahrung gesammelt:</t><br/><br/> %1 EP / 50 EP",[life_exp] call life_fnc_numbertext];};
case 1: {hint parsetext format ["<t color ='#FFA500'>Erfahrung gesammelt:</t><br/><br/> %1 EP / 1,500 EP",[life_exp] call life_fnc_numbertext];};
case 2: {hint parsetext format ["<t color ='#FFA500'>Erfahrung gesammelt:</t><br/><br/> %1 EP / 5,000 EP",[life_exp] call life_fnc_numbertext];};
case 3: {hint parsetext format ["<t color ='#FFA500'>Erfahrung gesammelt:</t><br/><br/> %1 EP / 10,000 EP",[life_exp] call life_fnc_numbertext];};
case 4: {hint parsetext format ["<t color ='#FFA500'>Erfahrung gesammelt:</t><br/><br/> %1 EP / 25,000 EP",[life_exp] call life_fnc_numbertext];};
case 5: {hint parsetext format ["<t color ='#FFA500'>Erfahrung gesammelt:</t><br/><br/> %1 EP / 50,000 EP",[life_exp] call life_fnc_numbertext];};
case 6: {hint parsetext format ["<t color ='#FFA500'>Erfahrung gesammelt:</t><br/><br/> %1 EP / 100,000 EP",[life_exp] call life_fnc_numbertext];};
case 7: {hint parsetext format ["<t color ='#FFA500'>Erfahrung gesammelt:</t><br/><br/> %1 EP / 350,000 EP",[life_exp] call life_fnc_numbertext];};
case 8: {hint parsetext format ["<t color ='#FFA500'>Erfahrung gesammelt:</t><br/><br/> %1 EP / 750,000 EP",[life_exp] call life_fnc_numbertext];};
case 9: {hint parsetext format ["<t color ='#FFA500'>Erfahrung gesammelt:</t><br/><br/> %1 EP / 1,300,000 EP",[life_exp] call life_fnc_numbertext];};
case 10: {hint parsetext format ["<t color ='#FFA500'>Erfahrung gesammelt:</t><br/><br/> %1 EP / 2,000,000 EP",[life_exp] call life_fnc_numbertext];};
case 11: {hint parsetext format ["<t color ='#FFA500'>Erfahrung gesammelt:</t><br/><br/> %1 EP / 3,000,000 EP",[life_exp] call life_fnc_numbertext];};
case 12: {hint parsetext format ["<t color ='#FFA500'>Levelmaximum erreicht:</t><br/><br/> %1 EP / 3,100,000 EP",[life_exp] call life_fnc_numbertext];};

};