/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Lockpick.sqf

Description:
For lockpicking vehicles
*/
["RPP_Lockpick_Start", {
	[] spawn {
		private ["_Target","_Chance","_uid","_Lockpick","_Chance_Break","_c"];
		_Target = cursorTarget;
		_uid = getPlayerUID player;
		_Chance = round(random 100);
		_Chance_Break = round(random 50);
		_Keys = _Target getVariable "RPP_Vehicle_Owners";
		_c = true;

		if (!(_Target isKindOf "LandVehicle") or (_Target isKindOf "Air")) exitWith {
			_msg = "You are not able to lockpick this.";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
			["Lockpick",1] call RPP_Inventory_Add;
		};
		if (player distance _Target > 5) exitWith {
			_msg = "You are to far away from the target.";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
			["Lockpick",1] call RPP_Inventory_Add;
		};
		{
			if (_uid isEqualTo _x) exitWith {
				_c = false;
			};
		} count _Keys;
		if (!(_c)) exitWith {
			_msg = "You already got the keys for this vehicle.";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
			["Lockpick",1] call RPP_Inventory_Add;
		};
		if (_Target getVariable "RPP_Lockpick_inProgress") exitWith {
			_msg = "Someone is already trying to lockpick this vehicle.";
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
			["Lockpick",1] call RPP_Inventory_Add;
		};

		_Target setVariable ["RPP_Lockpick_inProgress",true,true];

		["AinvPknlMstpSnonWnonDnon_medic_1","playmove"] call RPP_SwitchAnim_Global;
		sleep 3;
		if (_Chance <= 80) exitWith {
			if (_Chance_Break < 50) then {
				_msg = "You Failed to lockpick this Vehicle and Your lockpick broke.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				_Target setVariable ["RPP_Lockpick_inProgress",false,true];
			} else {
				_Target setVariable ["RPP_Lockpick_inProgress",false,true];
				_msg = "You Failed to lockpick this Vehicle.";
				_color = RPP_Red;
				[_msg,_color] call RPP_MessageSystem;
				["Lockpick",1] call RPP_Inventory_Add;
			};
		};
	
		_Lockpick = _Target getVariable "RPP_Vehicle_Owners";
		_Lockpick = _Lockpick + [_uid];
		_Target setVariable ["RPP_Vehicle_Owners",_Lockpick,true];

		_msg = "You Successfully lockpicked this vehicle.";
		_color = RPP_Green;
		[_msg,_color] call RPP_MessageSystem;

		_Target setVariable ["RPP_Lockpick_inProgress",false,true];
	};
}] call RPP_Function;
publicVariable "RPP_Lockpick_Start";