/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
For when police interact with the MCU
*/
private ["_function","_mcu","_sleep"];

_function = _this select 0;
_mcu = cursorTarget;
if(typeOf _mcu != "O_Truck_03_covered_F")exitwith{hint "You must first face the MCU"};
if([getPos player,60,west] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not do this when police are nearby","PLAIN"]};
if(DS_doingStuff)exitwith{};
DS_doingStuff = true;
			disableSerialization;
			5 cutRsc ["DS_progress","PLAIN"];
			_ui = uiNamespace getVariable "DS_progress";
			_progressBar = _ui displayCtrl 38201;
			_titleText = _ui displayCtrl 38202;
			_titleText ctrlSetText format["%2 (1%1)...","%","Dismantling MCU"];
			_progressBar progressSetPosition 0.01;
			_cP = 0.01;
			_cpRate = 0.01;
			_sleep = 0.25;
			while {true} do
				{
				sleep _sleep;
				if(isNull _ui) then {
					5 cutRsc ["DS_progress","PLAIN"];
					_ui = uiNamespace getVariable "DS_progress";
					_progressBar = _ui displayCtrl 38201;
					_titleText = _ui displayCtrl 38202;
				};
				_cP = _cP + _cpRate;
				_progressBar progressSetPosition _cP;
				_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%","Dismantling MCU"];
				if(player distance _mcu > 10) exitwith {};
				if((vehicle player) != player) exitwith {};
				if(_cP >= 1 OR !alive player) exitWith {};
				if([getPos player,60,west] call DS_fnc_nearbyPlayers) exitWith {};
				};
			5 cutText ["","PLAIN"];
			player playActionNow "stop";
			closeDialog 0;
			DS_doingStuff = false;
			if([getPos player,60,west] call DS_fnc_nearbyPlayers) exitWith {titleText["Police are nearby, watch out!","PLAIN"]};
			if(player distance _mcu > 10) exitwith {hint "packing cancelled because you moved too far from the vehicle"};
			if((vehicle player) != player) exitwith {};
			if(!alive player) exitWith {};
			hint "Command Unit Dismantled";
			_mcu allowDamage true;
			_mcu setFuel 1;
			{
			  deleteVehicle _x;
			} forEach attachedObjects _mcu;
			_gun = (nearestobjects [getpos player, ["Land_BagFence_Long_F"],  50]);
			{
				deleteVehicle _x;
			} forEach _gun;
			_mcu setVariable ["packed",true,true];
hint "MCU is packed, take this to a chop shop for payment";