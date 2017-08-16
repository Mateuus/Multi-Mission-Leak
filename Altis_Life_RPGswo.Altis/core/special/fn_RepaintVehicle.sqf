#include "..\..\macros.hpp"
/*
File: fn_RepaintVehicle.sqf
Author: MooN-Gaming

Description: Does the active repaint man....read the title!
*/
private["_index","_veh","_color","_color_index","_vehOwner"];
if(!isNull (findDisplay 2300)) then {
_veh = (nearestObjects [position player,["Car","Air"],10]) select 0;
_color = lbcursel 2303;
_color_index = lbValue[2303,_color];
if (_color == -1) exitWith {hint "Du hast keine Farbe ausgewählt";};
closeDialog 0;

_baseprice = 50000;
_vehicleData = _veh getVariable["vehicle_info_owners",[]];
_vehOwner = (_vehicleData select 0) select 0;
if(dwf_cash < _basePrice) exitWith {hint "Du hast nicht genug Geld bei dir."};

if(isNil {_vehicleData}) exitWith {hint "Fahrzeug gecheatet!?."};
if ((getPlayerUID player) != _vehOwner) exitWith {hint "Du bist nicht der Besitzer des Fahrzeuges!"};

		DWEV_action_inUse = true;
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_upp = format["Lackiere %1",_displayName];
		//Setup our progress bar.
		disableSerialization;
		5 cutRsc ["DWEV_progress","PLAIN"];
		_ui = uiNameSpace getVariable "DWEV_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
		_progress progressSetPosition 0.01;
		_cP = 0.01;
		
		while{true} do
		{
			if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then 
			{
				player action ["SwitchWeapon", player, player, 100]; //EDIT
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1"; //Durée action 6.5 secondes
				player playActionNow "stop";
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
				player playActionNow "stop";
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
			};
			sleep 0.195;

			_cP = _cP + 0.01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];			
			if(_cP >= 1) exitWith {};
			if(!alive player) exitWith {};
			if(player != vehicle player) exitWith {};
			if(DWEV_interrupted) exitWith {};
		};
		
		DWEV_action_inUse = false;
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if(DWEV_interrupted) exitWith {DWEV_interrupted = false; titleText["Abgebrochen","PLAIN"]; DWEV_action_inUse = false;};
		if(player != vehicle player) exitWith {titleText["Du musst aus dem Fahrzeug aussteigen, um es lackieren zu können!","PLAIN"];};

		dwf_cash = dwf_cash - _basePrice;
		[_veh,_color_index] remoteExec ["DWF_fnc_vehicleRepaint",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
		[_veh,_color_index] remoteExec ["DWEV_fnc_colorVehicle"];
		[0] call SOCK_fnc_updatePartial;	
		
		_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		
		hint format["Dein %1\n wurde neu lackiert",_vehicleName];
};