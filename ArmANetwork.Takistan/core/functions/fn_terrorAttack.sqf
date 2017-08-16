/*
	Author: Matthew "ParallelGames"
	
	Description:
	Terror Attack setup
*/
private ["_command"];
_command = 0;

if (Tower2 getVariable "eg_terror") exitWith {Tower2 setVariable ["eg_terror", false, true]; hint "Terror threat cleared";};
if((call life_adminlevel) < 2) then {if((call life_coplevel) != 10) then {if((call life_coplevel) != 5) then {_command = 0;} else {_command = 1;};} else {_command = 1;};} else {_command = 1;};

if(!(_command == 1)) exitWith {closeDialog 0; hint "You need to be higher rank to use this function.";};

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