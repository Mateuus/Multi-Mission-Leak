/*
	File: fn_hudUpdate.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the HUD when it needs to.
*/
private["_ui","_food","_water","_toilet","_battery","_zustand","_muell","_level","_illnessess","_hudselection"];
disableSerialization;

if(!hudactive) exitWith {};

_ui = uiNameSpace getVariable ["playerHUD",displayNull];
if(isNull _ui) then {[] call life_fnc_hudSetup;};
_hudback = _ui displayCtrl 25;
_hudexp = _ui displayCtrl 30;
_mailicon = _ui displayCtrl 50;
_phoneicon = _ui displayCtrl 60;
_food = _ui displayCtrl 23500;
_water = _ui displayCtrl 23510;
_zustand = _ui displayCtrl 23520;
_battery = _ui displayCtrl 23525;
_muell = _ui displayCtrl 23530;
_bargeld = _ui displayCtrl 23535;
_level = _ui displayCtrl 23540;
_civ = _ui displayCtrl 23545;
_cop = _ui displayCtrl 23550;
_med = _ui displayCtrl 23555;
_adac = _ui displayCtrl 23560;
_toilet = _ui displayCtrl 23565;
_exp = _ui displayCtrl 23570;

//HUD config
if(playerside != civilian) then {{_x ctrlShow false} foreach [_hudexp,_level,_exp]};

_hudselection = [] call life_fnc_hudcfg;
_hudback ctrlSetText ((_hudselection select hudselection) select 0);
_hudexp ctrlSetText ((_hudselection select hudselection) select 1);
if(!mailreceived) then {_mailicon ctrlShow false};
if(!phonereceived) then {_phoneicon ctrlShow false};

//Krankheiten
_illnessess = ["Typhus","Migräne","Übelkeit","Grippe","Erkältung","Malaria","Harndrang"];

//Update Level
_level ctrlSetText format["Level %1", life_level];
_level ctrlSetBackgroundColor [0, 0, 0, 0.3];
_level CtrlCommit 0;

//Bargeld
_bargeld ctrlSetBackgroundColor [0, 0, 0, 0.5];
_bargeld CtrlCommit 0;

//Update Population
_civ ctrlSetBackgroundColor [0, 0, 0, 0.5];
_civ CtrlCommit 0;
_cop ctrlSetBackgroundColor [0, 0, 0, 0.5];
_cop CtrlCommit 0;
_med ctrlSetBackgroundColor [0, 0, 0, 0.5];
_med CtrlCommit 0;
_adac ctrlSetBackgroundColor [0, 0, 0, 0.5];
_adac CtrlCommit 0;

//Update food
_food ctrlSetText format["%1%2", life_hunger, "%"];
_food ctrlSetBackgroundColor [0, 0, 0, 0.5]; 
if(life_hunger < 30) then { 
	_food ctrlSetBackgroundColor [255, 0, 0, 0.5]; 
};
_food ctrlCommit 0;

//Update Water
_water ctrlSetText format["%1%2", life_thirst, "%"];
_water ctrlSetBackgroundColor [0, 0, 0, 0.5]; 
if(life_thirst < 30) then { 
	_water ctrlSetBackgroundColor [255, 0, 0, 0.5]; 
};
_water ctrlCommit 0;

//Update Toilet
_toilet ctrlSetText format["%1%2", life_toilet, "%"];
_toilet ctrlSetBackgroundColor [0, 0, 0, 0.5]; 
if(life_toilet > 80) then { 
	_toilet ctrlSetBackgroundColor [255, 0, 0, 0.5]; 
};
_toilet ctrlCommit 0;

//Update Zustand
_zustand ctrlSetText format["%1", life_zustand];
_zustand ctrlSetBackgroundColor [0, 220, 0, 0.5]; 
if(life_zustand in _illnessess) then { 
	_zustand ctrlSetBackgroundColor [255, 0, 0, 0.5]; 	
};
if(life_zustand == "Verstrahlt" OR life_zustand == "Vergiftet") then { 
	_zustand ctrlSetBackgroundColor [255, 255, 0, 0.5]; 	
};
if(life_zustand == "Verflucht") then { 
	_zustand ctrlSetBackgroundColor [141, 35, 222, 0.5]; 	
};
_zustand ctrlCommit 0;

//Update battery
_battery ctrlSetText format["%1%2", life_battery, "%"];
_battery ctrlSetBackgroundColor [0, 0, 0, 0.5]; 
if(life_battery < 20) then { 
	_battery ctrlSetBackgroundColor [255, 0, 0, 0.5]; 	
};
_battery ctrlCommit 0;

//Update muell
_muell ctrlSetText format["%1 Tonnen", muell_counter];
if(muell_counter <= 5) then { 
	_muell ctrlSetBackgroundColor [255, 0, 0, 0.5]; 	
};
_muell ctrlCommit 0;