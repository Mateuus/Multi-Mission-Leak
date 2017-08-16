/*
	Author: Matthew "ParallelGames"
	
	Description:
	Terror Attack setup
*/

if (Tower2 getVariable "eg_terror") exitWith {Tower2 setVariable ["eg_terror", false, true]; hint "Terror threat cleared";};
	
Tower2 setVariable ["eg_terror", true, true];
hint "Terror declared";	

while {Tower2 getVariable "eg_terror"} do {
	[[Tower1, "red",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower2, "red",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower3, "red",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower4, "red",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower5, "red",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower6, "red",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower7, "red",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower8, "red",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower9, "red",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower10, "red",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower11, "red",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower12, "red",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower13, "red",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower14, "red",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower15, "red",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower16, "red",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower17, "red",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower18, "red",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower19, "red",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	sleep 20;
	[[Tower1, "AirRaidSirenAlert",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower2, "AirRaidSirenAlert",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower3, "AirRaidSirenAlert",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower4, "AirRaidSirenAlert",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower5, "AirRaidSirenAlert",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower6, "AirRaidSirenAlert",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower7, "AirRaidSirenAlert",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower8, "AirRaidSirenAlert",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower9, "AirRaidSirenAlert",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower10, "AirRaidSirenAlert",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower11, "AirRaidSirenAlert",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower12, "AirRaidSirenAlert",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower13, "AirRaidSirenAlert",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower14, "AirRaidSirenAlert",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower15, "AirRaidSirenAlert",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower16, "AirRaidSirenAlert",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower17, "AirRaidSirenAlert",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower18, "AirRaidSirenAlert",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	[[Tower19, "AirRaidSirenAlert",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	sleep 30;
};