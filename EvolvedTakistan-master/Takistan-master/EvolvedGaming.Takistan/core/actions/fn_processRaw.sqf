#include <macro.h>
/*
	File: fn_processRaw.sqf
	Author: blaster
	Clips from: Bryan "Tonic" Boardwine
	
	Description:
	Master handling for processing raw meat.
*/
private["_vendor","_upp","_ui","_progress","_pgText","_cP"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

//Error check
if(isNull _vendor OR (player distance _vendor > 10)) exitWith {};

if!((life_inv_rabbitRaw+life_inv_henRaw+life_inv_roosterRaw+life_inv_goatRaw+life_inv_sheepRaw+life_inv_salemaRaw+life_inv_ornateRaw+life_inv_mackerelRaw+life_inv_tunaRaw+life_inv_mulletRaw+life_inv_catsharkRaw )>=1) exitWith {};

life_is_processing = true;
//Setup our progress bar.'
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Cooking Food (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;

while{true} do {
		sleep  0.3;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["Cooking Food (%1%2)...",round(_cP * 100),"%"];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};
	
if(player distance _vendor > 10) exitWith {hint localize "STR_Process_Stay"; 5 cutText ["","PLAIN"]; life_is_processing = false;};

if (life_inv_rabbitRaw > 0) then {
	_x = life_inv_rabbitRaw;
	if(!([false,"rabbit_raw",_x] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"];};
	if(!([true,"rabbit_grilled",_x] call life_fnc_handleInv)) exitWith{5 cutText ["","PLAIN"]; [false,"rabbit_raw",_x] call life_fnc_handleInv;};
};
if (life_inv_henRaw > 0) then {
	_x = life_inv_henRaw;
	if(!([false,"hen_raw", _x] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"];};
	if(!([true,"hen_fried",_x] call life_fnc_handleInv)) exitWith{5 cutText ["","PLAIN"]; [false,"hen_raw",_x] call life_fnc_handleInv;};
};
if (life_inv_roosterRaw > 0) then {
	_x = life_inv_roosterRaw;
	if(!([false,"rooster_raw", _x] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"];};
	if(!([true,"rooster_grilled",_x] call life_fnc_handleInv)) exitWith{5 cutText ["","PLAIN"]; [false,"rooster_raw",_x] call life_fnc_handleInv;};
};
if (life_inv_goatRaw > 0) then {
	_x = life_inv_goatRaw;
	if(!([false,"goat_raw", _x] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"];};
	if(!([true,"goat_grilled",_x] call life_fnc_handleInv)) exitWith{5 cutText ["","PLAIN"]; [false,"goat_raw",_x] call life_fnc_handleInv;};
};
if (life_inv_sheepRaw > 0) then {
	_x = life_inv_sheepRaw;
	if(!([false,"sheep_raw", _x] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; };
	if(!([true,"sheep_grilled",_x] call life_fnc_handleInv)) exitWith{5 cutText ["","PLAIN"]; [false,"sheep_raw",_x] call life_fnc_handleInv;};
};
if (life_inv_salemaRaw > 0) then {
	_x = life_inv_salemaRaw;
	if(!([false,"salema_raw", _x] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"];};
	if(!([true,"salema_grilled",_x] call life_fnc_handleInv)) exitWith{5 cutText ["","PLAIN"]; [false,"salema_raw",_x] call life_fnc_handleInv;};
};
if (life_inv_ornateRaw > 0) then {
	_x = life_inv_oranateRaw;
	if(!([false,"ornate_raw", _x] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"];};
	if(!([true,"ornate_grilled",_x] call life_fnc_handleInv)) exitWith{5 cutText ["","PLAIN"]; [false,"ornate_raw",_x] call life_fnc_handleInv;};
};
if (life_inv_mackerelRaw > 0) then {
	_x = life_inv_mackerelRaw;
	if(!([false,"mackerel_raw", _x] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"];};
	if(!([true,"mackerel_grilled",_x] call life_fnc_handleInv)) exitWith{5 cutText ["","PLAIN"]; [false,"mackerel_raw",_x] call life_fnc_handleInv;};
};
if (life_inv_tunaRaw > 0) then {
	_x = life_inv_tunaRaw;
	if(!([false,"tuna_raw", _x] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"];};
	if(!([true,"tuna_grilled",_x] call life_fnc_handleInv)) exitWith{5 cutText ["","PLAIN"]; [false,"tuna_raw",_x] call life_fnc_handleInv;};
};
if (life_inv_mulletRaw > 0) then {
	_x = life_inv_mulletRaw;
	if(!([false,"mullet_raw", _x] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"];};
	if(!([true,"mullet_fried",_x] call life_fnc_handleInv)) exitWith{5 cutText ["","PLAIN"]; [false,"mullet_raw",_x] call life_fnc_handleInv;};
};
if (life_inv_catsharkRaw > 0) then {
	_x = life_inv_catsharkRaw;
	if(!([false,"catshark_raw", _x] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"];};
	if(!([true,"catshark_fried",_x] call life_fnc_handleInv)) exitWith{5 cutText ["","PLAIN"]; [false,"catshark_raw",_x] call life_fnc_handleInv;};
};


life_is_processing = false;
5 cutText ["","PLAIN"];
titleText["You have cooked all your raw meat on the fire.","PLAIN"];







