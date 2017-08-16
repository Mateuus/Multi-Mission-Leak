#include "..\script_macros.hpp"
/*
    File: fn_initCop.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Cop Initialization file.
*/
private["_end", "_donatorlevel"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;

if (life_blacklisted) exitWith {
    ["Blacklisted",false,true] call BIS_fnc_endMission;
    sleep 30;
};

if (FETCH_CONST(life_coplevel) isEqualTo 0) then {
    ["NotWhitelisted",false,true] call BIS_fnc_endMission;
    sleep 35;
};

0 = execVM "IgiLoad\IgiLoadInit.sqf";
// Set Paycheck for Police
switch (call life_coplevel) do 
{
	case 1: { life_paycheck = (2000) }; //Polizeimeisteranwearter
	case 2: { life_paycheck = (4000) }; //Polizeimeister
	case 3: { life_paycheck = (6000) }; //Polizeiobermeister
	case 4: { life_paycheck = (8000) }; //Polizeihauptmeister
	case 5: { life_paycheck = (10000) }; //Erster Polizeihauptmeister
	case 6: { life_paycheck = (11000) }; //Polizeikommissarsanwearter
	case 7: { life_paycheck = (12000) }; //Polizeikommissar
	case 8: { life_paycheck = (13000) }; //Polizeioberkommissar
	case 9: { life_paycheck = (14000) }; //Polizeihauptkommissar
	case 10: { life_paycheck = (15000) }; //Erster Polizeihaubtkommissar
	case 11: { life_paycheck = (16000) }; //Polizeiratsanwearter
	case 12: { life_paycheck = (17000) }; //Polizeirat
	case 13: { life_paycheck = (18000) }; //Polizeioberrat
	case 14: { life_paycheck = (19000) }; //Polizeidirektor
	case 15: { life_paycheck = (20000) }; //Leitenderpolizeidirektor/Polizeipreasident
};


player setVariable ["rank",(FETCH_CONST(life_coplevel)),true];
[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
[] spawn life_fnc_placeablesInit;
[] spawn {
private["_skinName"];
while {true} do
{
	waitUntil {uniform player == "U_B_CombatUniform_mcam"};
	_skinName = ["skins\c_",(FETCH_CONST(life_coplevel)),".jpg"] joinString "";
	player setObjectTextureGlobal [0, _skinName];
	waitUntil {uniform player != "U_B_CombatUniform_mcam"};
};
};
[] spawn {
while {true} do
{
	waitUntil {backpack player == "B_Bergen_mcamo"};
	(unitBackpack player) setObjectTextureGlobal [0, "skins\polizeibag.paa"];
	waitUntil {backpack player != "B_Bergen_mcamo"};
};
};
[] execVM "scripts\welcome.sqf";
