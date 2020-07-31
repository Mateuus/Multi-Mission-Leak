/*
maintenance / oil rig jobs
*/

if(has_job) exitwith { ["You already have a job! Press Shift + 4 to quit!", false] spawn domsg;};
if(maintenance_on) exitwith {};
oil = false;
farm = false;
switch(_this select 3) do {
	case "oil": {
		if(license_civ_air) then {
		oil = true;
		has_job = true;
		maintenance_on = true;
		[] spawn fnc_maintstart;
		["You get paid extra for doing various jobs for the oil lines - lets suit you up!", false] spawn domsg;
		} else {
			["You need a pilot license to do this well paying job.", false] spawn domsg;
		};
	};
	case "farm": {
		if(license_civ_truck) then {
		farm = true;
		has_job = true;
		maintenance_on = true;
		["You get paid extra for doing various jobs for the farmer - lets suit you up!", false] spawn domsg;
		[] spawn fnc_maintstart;
		} else {
			["You need a truck license to do this well paying job.", false] spawn domsg;
		};
	};
};

_fkit = 0;
sleep 1;
_fkit = 9;

while{_fkit > 0 && maintenance_on} do {
	uiSleep 300;
	if(vehicle player != player) then {
		if (player distance oilrig1 < 100 || player distance oilrig2 < 100 || player distance oilrig3 < 100 ) then
		{
			["bank","add", 1630] call life_fnc_handleCash;
			["You just got paid an extra $1630 for maintaining the Oil Lines.", false] spawn domsg;
		};
		if (player distance wheat1 < 100 ) then
		{
			["bank","add", 920] call life_fnc_handleCash;
			["You just got paid an extra $920 for maintaining the Fred's Farm.", false] spawn domsg;
		};
		if (player distance wheat1 > 200 && farm ) exitwith
		{

		};
	};
	_fkit = _fkit - 1;
};
["Your payment periods are over..", false] spawn domsg;
mainteneance_on = false;

has_job = false;