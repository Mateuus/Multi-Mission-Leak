#include "..\..\script_macros.hpp"
/*
	File: fn_seizeVehAction.sqf

	Description:
	Seize the vehicle
*/
private["_vehicle","_type","_time","_value","_vehicleData","_upp","_ui","_progress","_pgText","_cP","_filters","_impoundValue","_price","_seizeMultiplier"];
_vehicle = param [0,ObjNull,[ObjNull]];
_filters = ["Car","Air","Ship"];
if(!((KINDOF_ARRAY(_vehicle,_filters)))) exitWith {};
if(player distance cursorObject > 10) exitWith {};
if(_vehicle getVariable "NPC") exitWith {hint localize "STR_NPC_Protected"};
if(FETCH_CONST(life_coplevel) < 2) exitWith {hint localize "STR_NOTF_LowRank";};

_vehicleData = _vehicle GVAR ["vehicle_info_owners",[]];
if(EQUAL((count _vehicleData),0)) exitWith {deleteVehicle _vehicle}; //Bad vehicle.
_vehicleName = FETCH_CONFIG2(getText,CONFIG_VEHICLES,(typeOf _vehicle),"displayName");
_price = M_CONFIG(getNumber,CONFIG_LIFE_VEHICLES,(typeOf _vehicle),"price");
[0,"STR_NOTF_Seizure",true,[SEL(SEL(_vehicleData,0),1),_vehicleName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
life_action_inUse = true;

_upp = localize "STR_NOTF_SeizingVeh";
//Setup our progress bar.
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = GVAR_UINS "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

for "_i" from 0 to 1 step 0 do {
	sleep 0.09;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {};
	if(player distance _vehicle > 10) exitWith {};
	if(!alive player) exitWith {};
};

5 cutText ["","PLAIN"];

if(player distance _vehicle > 10) exitWith {hint localize "STR_NOTF_SeizureCancel"; life_action_inUse = false;};
if(!alive player) exitWith {life_action_inUse = false;};

if(EQUAL(count crew _vehicle,0)) then {
	if(!(KINDOF_ARRAY(_vehicle,_filters))) exitWith {life_action_inUse = false;};
	_type = FETCH_CONFIG2(getText,CONFIG_VEHICLES,(typeOf _vehicle),"displayName");

	life_seize_inuse = true;

	if(life_HC_isActive) then {
		[_vehicle,true,player] remoteExec ["HC_fnc_vehicleDead",HC_Life];
	} else {
		[_vehicle,true,player] remoteExec ["TON_fnc_vehicleDead",RSERV];
	};

	life_seize_inuse = false;
	if(playerSide == west) then {
			_seizeMultiplier = LIFE_SETTINGS(getNumber,"vehicle_cop_seize_multiplier");
			_value = _price * _seizeMultiplier;
			[0,"STR_NOTF_SeizedVehBy",true,[profileName,SEL(SEL(_vehicleData,0),1),_vehicleName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
			hint format[localize "STR_NOTF_SeizurePayout",[_value] call life_fnc_numberText,_type];
			ADD(BANK,_value);
			[1] call SOCK_fnc_updatePartial;
	};
} else {
	hint localize "STR_NOTF_SeizureCancel";
};

life_action_inUse = false;