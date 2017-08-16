#include "..\script_macros.hpp"
/*
	File: fn_revived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	THANK YOU JESUS I WAS SAVED!
*/
private["_medic","_dir"];
_medic = param [0,"Unknown Medic",[""]];

if(isNil {ES_corpse}) exitWith {};

_oldGear = [ES_corpse] call ES_fnc_fetchDeadGear;
[_oldGear] spawn ES_fnc_loadDeadGear;
ES_corpse setVariable ["realname",nil,true]; //Should correct the double name sinking into the ground.

_text = format["Reanimiert von %1",_medic];
[ES_corpse,_text] call ES_fnc_medilogSubmit;
player setVariable ["medilog",(ES_corpse getVariable["medilog",[]]),true];

_dir = getDir ES_corpse;
hint format[localize "STR_Medic_RevivePay",_medic,[ES_SETTINGS(getNumber,"revive_fee")] call ES_fnc_numberText];

closeDialog 0;
ES_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy ES_deathCamera;

//Take fee for services.
if(ES_atmbank > (ES_SETTINGS(getNumber,"revive_fee"))) then {	
	ES_atmbank = ES_atmbank - (ES_SETTINGS(getNumber,"revive_fee"));
} else {
	ES_atmbank = 0;
};

//Bring me back to life.
player setDir _dir;
player setPosASL (visiblePositionASL ES_corpse);
ES_corpse setVariable ["Revive",nil,TRUE];
ES_corpse setVariable ["name",nil,TRUE];
deleteVehicle ES_corpse;

player setVariable ["Revive",nil,TRUE];
player setVariable ["name",nil,TRUE];
player setVariable ["Reviving",nil,TRUE];
player setVariable ["copSwitchSkin", false];

if (isClass(configFile >> "CfgPatches" >> "EisenschmiedeHighTextures")) then { [] spawn ES_fnc_updateClothing; }else{ [] spawn ES_fnc_updateClothing; };
[] call ES_fnc_hudUpdate;