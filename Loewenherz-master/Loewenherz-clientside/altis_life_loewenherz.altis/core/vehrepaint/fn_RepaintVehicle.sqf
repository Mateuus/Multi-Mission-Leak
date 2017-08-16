
/*
File: fn_RepaintVehicle.sqf
Author: MooN-Gaming

Description: Does the active repaint man....read the title!
*/
private ["_index","_veh","_color","_color_index","_smoke","_baseprice","_vehicleData","_vehOwner","_basePrice","_displayName","_upp","_ui","_progress","_pgText","_cP","_vehicledata"];

if(!isNull (findDisplay 2300)) then {
_veh = nearestObject [position player, "LandVehicle"];
if(!((_veh isKindOf "Car") || (_veh isKindOf "Air") || (_veh isKindOf "Ship"))) exitWith {};
_color = lbcursel 2303;
_color_index = lbValue[2303,_color];
closeDialog 0;

_baseprice = 10000;  //Price for repaint
_vehicleData = _veh getVariable["vehicle_info_owners",[]];
_vehOwner = (_vehicleData select 0) select 0;
if(lhm_cash < _basePrice) exitWith {hint "Das reicht nicht um mich zu bezahlen!"};

if(isNil {_vehicleData}) exitWith {hint "Cheater???"};
if ((getPlayerUID player) != _vehOwner) exitWith {hint "Dies ist nicht dein Fahrzeug... geh weg!"};

		lhm_action_inUse = true;
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_upp = format["repainting %1",_displayName];
		//Setup our progress bar.
		disableSerialization;
		5 cutRsc ["lhm_progress","PLAIN"];
		_ui = uiNameSpace getVariable "lhm_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
		_progress progressSetPosition 0.01;
		_cP = 0.01;

		_smoke = "SmokeShell" createVehicle getPos _veh; // creates some paint smog

		// [[player,"spraycan"],"lhm_fnc_say3d",nil,false] call lhm_fnc_mp;
		playSound "spraycan";

		For "_i" from 0 to 1 step 0 do
		{
			sleep 0.29;

			_cP = _cP + 0.01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
			if(_cP >= 1) exitWith {};
			if(!alive player) exitWith {};
			if(player != vehicle player) exitWith {};
			if(lhm_interrupted) exitWith {};
		};

		lhm_action_inUse = false;
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if(lhm_interrupted) exitWith {lhm_interrupted = false; titleText["Abgebrochen","PLAIN"]; lhm_action_inUse = false;};
		if(player != vehicle player) exitWith {titleText["Zum lackieren musst du das Fahrzeug verlassen","PLAIN"];};

		lhm_cash = lhm_cash - _basePrice;

		deleteVehicle _smoke; // remove the smog

		//Send toDB
		[[_veh,_color_index],"lhm_fnc_vehicleRepaint",false,false] call lhm_fnc_mp;

		//Color vehicle locally
		[_veh,_color_index] call lhm_fnc_colorVehicle;

		[] call SOCK_fnc_updateRequest; //Sync silently because it's obviously silently..

		//hint format["Vehicle: %1 || New Color: %2 || Owner:%3",_veh,_color_index,_vehicledata]; //Deactivated, wrong states there :-(

};