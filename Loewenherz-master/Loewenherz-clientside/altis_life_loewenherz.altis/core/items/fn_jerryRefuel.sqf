/*
	File: fn_jerryRefuel.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Refuels the vehicle if the player has a fuel can.
*/
private["_vehicle","_displayName","_upp","_ui","_progress","_pgText","_cP","_previousState"];
_vehicle = cursorTarget;
lhm_interrupted = false;
if (lhm_action_inUse) exitWith {};
if ((vehicle player) != player) exitWith {};
if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
if(isNull _vehicle) exitWith {hint localize "STR_ISTR_Jerry_NotLooking"};
if(!(_vehicle isKindOF "LandVehicle") && !(_vehicle isKindOf "Air") && !(_vehicle isKindOf "Ship")) exitWith {};
if(player distance _vehicle > 7.5) exitWith {hint localize "STR_ISTR_Jerry_NotNear"};

if(!([false,"fuelF",1] call lhm_fnc_handleInv)) exitWith {};
lhm_action_inUse = true;
_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

_upp = format[localize "STR_ISTR_Jerry_Process",_displayName];
//Setup our progress bar.
disableSerialization;
5 cutRsc ["lhm_progress","PLAIN"];
_ui = uiNameSpace getVariable "lhm_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

// Animation Fix Test
if((weaponState player select 4) > 0) then {
	player action ["SwitchWeapon", player, player, 100];
};
waitUntil{sleep 2.5;(weaponState player select 4) isEqualTo 0};

For "_i" from 0 to 1 step 0 do
{
	// Animation Fix Test
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
		 player action ["SwitchWeapon", player, player, 100];
		 player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		 player playActionNow "stop";
		 player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		 player playActionNow "stop";
		 player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
	 };
	 // Animation Fix Test
	sleep 0.2;
	if(isNull _ui) then {
		5 cutRsc ["lhm_progress","PLAIN"];
		_ui = uiNamespace getVariable "lhm_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(lhm_interrupted) exitWith {};
};
lhm_action_inUse = false;
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player) exitWith {};
if(lhm_interrupted) exitWith {lhm_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"];};


switch (true) do
{
	case (_vehicle isKindOF "LandVehicle"):
	{
		if(!local _vehicle) then
		{
			// [[_vehicle,(Fuel _vehicle) + 0.5],"lhm_fnc_setFuel",_vehicle,false] call lhm_fnc_mp;
			[[_vehicle,(Fuel _vehicle) + 0.05],"lhm_fnc_setFuel",_vehicle,false] call lhm_fnc_mp; // LHM
		}
			else
		{
			//_vehicle setFuel ((Fuel _vehicle) + 0.5);
			_vehicle setFuel ((Fuel _vehicle) + 0.05); // LHM
		};
	};

	case (_vehicle isKindOf "Air"):
	{
		if(!local _vehicle) then
		{
			// [[_vehicle,(Fuel _vehicle) + 0.2],"lhm_fnc_setFuel",_vehicle,false] call lhm_fnc_mp;
			[[_vehicle,(Fuel _vehicle) + 0.05],"lhm_fnc_setFuel",_vehicle,false] call lhm_fnc_mp; // LHM
		}
			else
		{
			//_vehicle setFuel ((Fuel _vehicle) + 0.2);
			_vehicle setFuel ((Fuel _vehicle) + 0.05); // LHM
		};
	};

	case (_vehicle isKindOf "Ship"):
	{
		if(!local _vehicle) then
		{
			// [[_vehicle,(Fuel _vehicle) + 0.35],"lhm_fnc_setFuel",_vehicle,false] call lhm_fnc_mp;
			[[_vehicle,(Fuel _vehicle) + 0.2],"lhm_fnc_setFuel",_vehicle,false] call lhm_fnc_mp; // LHM
		}
			else
		{
			//_vehicle setFuel ((Fuel _vehicle) + 0.35);
			_vehicle setFuel ((Fuel _vehicle) + 0.2); // LHM
		};
	};
};
titleText[format[localize "STR_ISTR_Jerry_Success",_displayName],"PLAIN"];
[true,"fuelE",1] call lhm_fnc_handleInv;