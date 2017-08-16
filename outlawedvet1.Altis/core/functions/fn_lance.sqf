#include "..\..\script_macros.hpp"
/*
	File: fn_lance.sqf
	Author: RPGforYOU
	Website: www.outlawed-veterans.com
	
	Description:
	Opens trunk in ship
*/
	private ["_Wreck","_var"];
	// Checks
	if(!alive player) exitWith {hint "You are NOT alive, so ... dead people can't weld!";};
	if (vehicle player != player) exitWith {hint "Can't weld when you are in a vehicle.";};
	if(life_inv_lance < 1) exitWith {hint"You don't have a lance, how are you going to break into the wreck?";};
	if(life_inv_weldingtool < 1) exitWith {hint"You don't have tools to support your lance, this way you can't break into the wreck!";};
	if (playerSide != civilian) exitWith {hint "You are not a civilian! Get to work you!"};
	closedialog 0;
	
	// Look for the object and define
    _Wreck = nearestObjects [player, ["Land_Wreck_Traw_F","Land_Wreck_Traw2_F"], 50];
    if (count _Wreck isequalto 0) exitWith {hint "A ship wreck was not found, make sure you are within 20 meters of a wreck."};
    _Wreck = _Wreck select 0;
     
	// Progress bar
    life_action_inUse = true;
    _upp = "Breaking into contents of the wreck...";
    //Setup our progress bar.
    disableSerialization;
    5 cutRsc ["life_progress","PLAIN"];
    _ui = uiNameSpace getVariable "life_progress";
    _progress = _ui displayCtrl 38201;
    _pgText = _ui displayCtrl 38202;
    _pgText ctrlSetText format["%2 (1%1)...","%",_upp];
    _progress progressSetPosition 0.01;
    _cP = 0.01;
	_time = 0.015;
     
    while{true} do
    {
    uiSleep 0.15;
    _cP = _cP + _time;
    _progress progressSetPosition _cP;
    _pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
    if(_cP >= 1) exitWith {};
    if(!alive player) exitWith {};
    };
     
    life_action_inUse = false;
    5 cutText ["","PLAIN"];
	
	// Change welding tool breaks
    _var=floor(random 2);
	if (_var==1) then {
	[false,"weldingtool",1] call life_fnc_handleInv;
	hint"One of your welding tools broke when opening the wreck!";
	};
	
	
	// Open trunk inventory
    [_Wreck] call life_fnc_openInventory;
	