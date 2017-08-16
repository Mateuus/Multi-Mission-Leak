/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_OnKeyPress.sqf

Description:
key binding
*/
["RPP_OnKeyPress",  {
	private ["_key","_shift","_handled"];
	_key     = _this select 1;
	_shift   = _this select 2;
	_handled = false;

	if (!alive player) exitWith {_handled;};
	if (player getVariable "RPP_Revive") exitWith {_handled;};
	if (player getVariable "RPP_Handcuff") exitWith {_handled;};
	if (player getVariable "RPP_CabelCuff") exitWith {_handled;};
	if (player getVariable "RPP_Tased") exitWith {_handled;};
	if (RPP_Action_Use) exitWith {_handled};

	RPP_Action_Use = true;

	switch (_key) do {
		
		case 1: //ESC
		{
			[] call RPP_MySQL_Client_SendStats;
		};
		
		case 4: //Shift + 3
		{
			if (_shift) then {
				if (!(player getVariable "RPP_Handsup")) then {
					["amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon","playmove"] call RPP_SwitchAnim_Global;
					player setVariable ["RPP_Handsup",true,true];
				} else {
					["AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon","switchmove"] call RPP_SwitchAnim_Global;
					player setVariable ["RPP_Handsup",false,true];
				};
			};
			_handled = true;
		};
		case 24: //Shift + O
        {
            if (_shift) then {
                if (soundVolume !=1) then {
                    1 fadeSound 1;
                    _msg = "You Took Your Earplugs Off";
                    _color = RPP_Yellow;
                    [_msg,_color] call RPP_MessageSystem;
                } else {
               	 	1 fadeSound 0.02;
                	_msg = "You Took Your Earplugs On";
                	_color = RPP_Yellow;
                	[_msg,_color] call RPP_MessageSystem;
                };
                _handled = true;
            };
        };
        case 48: //Shift + B
        {
        	if (_shift) then {
        		[] call RPP_Holster_Rifle;
        		_handled = true;
        	};
    	};
		case 20: //Shift + T
		{
			if (_shift) then {
				closeDialog 1;
				[] call RPP_Interacting_Dialog;
			} else {
				closeDialog 1;
				[] call RPP_VehicleMenu_OpenDialog;
			};
			_handled = true;
		};

		case 22: //U
		{
			[] call RPP_VehicleMenu_LockorUnlockVeh;
		};

		case 21: //Y
		{
			if (_shift) then {
				if (!(RPP_IsCop)) exitWith {_handled = true;};
				closeDialog 1;
 				[] call RPP_PoliceDB_Dialog;
 				_handled = true;
			} else {
				closeDialog 1;
				[] call RPP_Inventory_Dialog;
				_handled = true;
			};
		};
		
		case 35: //Shift + H
		{
			if (!(RPP_isCop)) exitWith {_handled = true;};
			if (_shift) then {
				[] call RPP_Police_Handcuff_KeyBind;
				_handled = true;
			};
		};
	};

	RPP_Action_Use = false;

	//systemChat format ["Debug: %1 | %2 | %3",_key,_shift,_handled];

	_handled;
}] call RPP_Function;
publicVariable "RPP_OnKeyPress";

["RPP_KeyDo", {
	[] spawn {
		waitUntil {!isNull findDisplay 46};
		(findDisplay 46) displayAddEventHandler ["KeyDown","_this call RPP_OnKeyPress;false;"];
	};
}] call RPP_Function;
publicVariable "RPP_KeyDo";