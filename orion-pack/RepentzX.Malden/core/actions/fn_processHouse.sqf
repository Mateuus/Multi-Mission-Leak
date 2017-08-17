#include "..\..\script_macros.hpp"
/*
	File: fn_processRaw.sqf
	Author: blaster
	Clips from: Bryan "Tonic" Boardwine
	
	Description:
	Master handling for processing raw meat.
*/
private["_pos","_upp","_ui","_progress","_pgText","_cP","_generator"];
_pos = (position player);
_generator = cursorTarget;
_chanceExplosion = round(random(99) +1);
_MDMAExplosionTarget = "Land_ClutterCutter_small_F" createVehicle ASLTOATL(visiblePositionASL player);
_MDMAExplosionTarget setPosATL ASLTOATL(visiblePositionASL player);
//Error check

if((life_inv_MDMA < 1))exitwith{hint "You do not have the required ingredients for this, you need MDMA!"};

life_is_processing = true;
//Setup our progress bar.'
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Processing MDMA (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;
[_generator,"generator"] remoteexeccall ["say3D",0];

while{true} do {
		sleep  0.3;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["Processing MDMA (%1%2)...",round(_cP * 100),"%"];
		if(_cP >= 1) exitWith {};
		if(player distance _pos > 10) exitWith {};
	};
	
if(player distance _pos > 10) exitWith {hint "You need to stay within 10m to process."; 5 cutText ["","PLAIN"]; life_action_inUse = false;};
if(_chanceExplosion > 10) exitWith 		
{					
	_bmb = "BO_GBU12_LGB" createVehicle [(getPos _MDMAExplosionTarget select 0)-2,(getPos _MDMAExplosionTarget select 1)+2,0];			
	_bmb = "BO_GBU12_LGB" createVehicle [(getPos _MDMAExplosionTarget select 0)-1,(getPos _MDMAExplosionTarget select 1)+1,0];			
	_bmb = "BO_GBU12_LGB" createVehicle [(getPos _MDMAExplosionTarget select 0)-2,(getPos _MDMAExplosionTarget select 1)+2,0];			
	_bmb = "BO_GBU12_LGB" createVehicle [(getPos _MDMAExplosionTarget select 0),(getPos _MDMAExplosionTarget select 1),0];			
	deleteVehicle _MDMAExplosionTarget; 	
	[0,"Breaking: Witnesses claim a large explosion has just taken place at a residential home of a suspected ecstasy dealer %2!",true,[player getVariable ["realname", name player], profileName]] remoteExecCall ["life_fnc_broadcast",0];
	hint "Holy shit!";					
		_damage = damage player;					
		_damage = _damage + 0.8;					
		player setDamage (_damage);					
		[] call life_fnc_hudUpdate;	
		5 cutText ["","PLAIN"];				
};
if (life_inv_MDMA > 0) then {
	_x = life_inv_MDMA;
	if(!([false,"life_inv_MDMA",_x] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"];};
	if(!([true,"life_inv_ecstasy",_x] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [false,"life_inv_MDMA",_x] call life_fnc_handleInv;};
};

life_is_processing = false;
5 cutText ["","PLAIN"];
titleText["You have processed the MDMA.","PLAIN"];







