/*
	File: fn_unflip.sqf

	Description:
	Unflip the vehicle.
*/

private ["_vehicle","_vehicles"];
if(player != vehicle player) exitWith {titleText[localize "STR_NOTF_RepairingInVehicle","PLAIN"];};

_vehicles = player nearEntities [["Car","Air","Ship"], 10];
	if (count _vehicles > 0) then {
		_vehicle = _vehicles select 0;
		if (_vehicle in life_vehicles OR playerSide in [west,independent]) then {
			if (speed _vehicle < 5 && getPos _vehicle select 2 < 5) then {
				life_action_inUse = true;
				_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
				_upp = format["Obracanie Pojazdu %1",_displayName];
				//Setup our progress bar.
				disableSerialization;
				5 cutRsc ["life_progress","PLAIN"];
				_ui = uiNameSpace getVariable "life_progress";
				_progress = _ui displayCtrl 38201;
				_pgText = _ui displayCtrl 38202;
				_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
				_progress progressSetPosition 0.01;
				_cP = 0.01;

				for "_i" from 0 to 1 step 0 do {
					uiSleep 0.010;
					_cP = _cP + 0.01;
					_progress progressSetPosition _cP;
					_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
					if(_cP >= 1) exitWith {};
					if(!alive player) exitWith {};
					if(player != vehicle player) exitWith {};
					if(life_interrupted) exitWith {};
				};

				life_action_inUse = false;
				5 cutText ["","PLAIN"];
				player playActionNow "stop";
				if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
				if(player != vehicle player) exitWith {titleText[localize "STR_NOTF_RepairingInVehicle","PLAIN"];};
				_dir = getDir _vehicle;
				_vehicle setPos [getPos _vehicle select 0, getPos _vehicle select 1, 1];
				_vehicle setDir _dir;
				_vehicle setVelocity [0,0,0];
				titleText["Obróciłeś Pojazd","PLAIN"];
			};
		} else {
			hint "Możesz obrócić tylko swój pojazd!";
		};
	};