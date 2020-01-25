/*
	File: fn_licenseslook.sqf
	Author: Not Tonic
	License Look
	Licenses Look
	Description:
	Outprints the licenses.
*/
disableSerialization;
_ui = uiNameSpace getVariable ["playerHUD",displayNull];
if(isNull _ui) exitWith
{
	[] call life_fnc_hudSetup;
	_ui = uiNameSpace getVariable ["playerHUD",displayNull];
};

_civ = param [0,ObjNull,[ObjNull]];
if(side _civ != civilian && side _civ != east) exitwith { ["Musi byc cywilem..", false] spawn domsg; };
0 cutRsc ["RSC_ID_BG","PLAIN"];
_id_name = _ui displayCtrl 44446;
_id_faction = _ui displayCtrl 44447;

skip_all = false;

if(side player == west) then {
	player remoteExec ["fnc_pull_ID",_civ];
	life_gather_info = false;
	["Zbieram informacje - Prosze czekac!", false] spawn domsg; 
	waituntil {life_gather_info};
};

if(!skip_all) then {
	_message = name _civ;
	_id_name ctrlSetStructuredText parseText format["<img size='0.3' image='cg_mission_files\id_icons\name.paa'/> Imie i Nazwisko:<t color='#C80000'> %1 </t>",_message];

	_message = target_licenses;
	_id_faction ctrlSetStructuredText parseText format["<img size='0.3' image='cg_mission_files\id_icons\license.paa'/> Posiadane licencje:<t color='#C80000'> %1 </t>",_message];

	OldHead = headgear _civ;
	OldGoggles = goggles _civ;
	removeGoggles _civ;
	removeHeadGear _civ;

	life_IDCamera  = "CAMERA" camCreate (getPosATL _civ); 
	showCinemaBorder true;    
	life_IDCamera cameraEffect ["EXTERNAL", "BACK"];      
	life_IDCamera camSetTarget _civ;    
	life_IDCamera camSetRelPos [0,1,1];    
	life_IDCamera camSetFOV .85;    
	life_IDCamera camSetFocus [50,1];    
	life_IDCamera camCommit 0;

	sleep 6;	
	_message = "";
	_id_name ctrlSetStructuredText parseText format["%1",_message];
	_id_faction ctrlSetStructuredText parseText format["%1",_message];

	life_IDCamera cameraEffect ["TERMINATE","BACK"];
	camDestroy life_IDCamera;

	if (!isNil "OldHead") then 
	{
		_civ addheadgear OldHead;
	};

	if (!isNil "OldGoggles") then 
	{
		_civ addgoggles OldGoggles;
	};
} else {

	["Nie udalo mi sie sprawdzic dowodu!", false] spawn domsg;
};
"colorCorrections" ppEffectEnable false;	
[] spawn {
	//fail safe
	uisleep 14;
	if(!life_gather_info) then {
		"colorCorrections" ppEffectEnable false;	
		life_gather_info = true;
	};
};
