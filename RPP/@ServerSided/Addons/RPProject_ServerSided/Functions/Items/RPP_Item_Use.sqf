/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Item_Use.sqf

Description:
items behing used
*/
["RPP_UseItem_Medkit", {
	[_this select 0] spawn {
		private ['_Type'];
		_Type = _this select 0;
		if (_Type isEqualTo 'Medkit') then {
			player playmove 'AinvPknlMstpSnonWnonDnon_medic_1';
			sleep 2;
			player setDamage 0;
			_msg = 'You successfully healed your self!';
			_color = RPP_Green;
			[_msg,_color] call RPP_MessageSystem;
		};
	};
}] call RPP_Function;
publicVariable 'RPP_UseItem_Medkit';

["RPP_UseItem_Repairkit", {
	[] spawn {
		_target = cursorTarget;
		if (vehicle player !=player) exitWith {
			_msg = 'You are not allowed to use this while inside a vehicle.';
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		if (_Target isKindOf 'man') exitWith {
			_msg = 'This is not a vehicle.';
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		if (player distance _target > 5) exitWith {
			_msg = 'To far away from the vehicle.';
			_color = RPP_Red;
			[_msg,_color] call RPP_MessageSystem;
		};
		player playmove 'AinvPknlMstpSnonWnonDnon_medic_1';
		sleep 4;
		_target setDamage 0;
	};
}] call RPP_Function;
publicVariable 'RPP_UseItem_Repairkit';