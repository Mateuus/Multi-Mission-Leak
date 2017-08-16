/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Animation.sqf

Description:
Animations :D
*/
["RPP_Animation_Config", {
	RPP_Animation_list =
	[	//Text,Anim,cmd
		["Normal","Normal","switchMove"],
		["Hands up","AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon","playmove"],
		["Play Dead","Helper_InjuredRfl","switchMove"]
	];
	publicVariable "RPP_Animation_list";
}] call RPP_Function;
publicVariable "RPP_Animation_Config";

[] call RPP_Animation_Config;

["RPP_Animation_Dialog", {
	closeDialog 1;
	createDialog "RPP_Anims";
	buttonSetAction [1600,"[] call RPP_Animation_Use;"];
	{
		lbAdd [1500, format ["%1",_x select 0]];
	} foreach RPP_Animation_list;
}] call RPP_Function;
publicVariable "RPP_Animation_Dialog";

["RPP_Animation_Use", {
	private ["_msg","_color","_Array","_text","_move","_cmd"];
	if (lbCurSel 1500 isEqualTo -1) exitWith {
		_msg = "Please select an Animation to use.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_Array = RPP_Animation_list select (lbCurSel 1500);
	_text = _Array select 0;
	_move = _Array select 1;
	_cmd = _Array select 2;

	[_move,_cmd] call RPP_SwitchAnim_Global;
}] call RPP_Function;
publicVariable "RPP_Animation_Use";