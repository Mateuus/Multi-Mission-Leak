/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Configuration.sqf

Description:
Core for the server
*/

["RPP_MessageSystem", {
	private ["_msg","_title","_color","_new", "_i", "_final"];

	_msg = _this select 0;
	_color = _this select 1;
	_i = 0;

	_title = "<t align = 'center' shadow = '1' size='1.3' font='PuristaBold'>Framework<br />Message System</t>";
	_new = "<br /><br /><t align = 'center' shadow = '1' size='1' font='PuristaBold'>New Message</t>";

	_final = "";

	RPP_Messages = [[_msg,_color]] + RPP_Messages;

	{
		if(_i < 5) then {
			_final = format["<br /><br /><t align='center' color='%2'>%1</t>",_x select 0,_x select 1] + _final;

			if(_i == 0) then {
				_final = _new + _final;
			};

			_i = _i + 1;
		};
	} forEach RPP_Messages;

	hint parseText (_title + _final);

	if(count(RPP_Messages) > 5) then { RPP_Messages = []; };
}] call RPP_Function;
publicVariable "RPP_MessageSystem";

["RPP_Server_Log_Compile", {
	private ["_msg"];
	_msg = _this select 0;
	diag_log format ["::RP Project System Log:: %1",_msg];
	diag_log "test123 Log.";
}] call RPP_Function;
publicVariable "RPP_Server_Log_Compile";

["RPP_Server_Log", {
	private ["_msg"];
	_msg = _this select 0;
	[_msg] remoteExec ["RPP_Server_Log_Compile",2];
}] call RPP_Function;
publicVariable "RPP_Server_Log";

["RPP_Message_Global", {
	private ["_msg"];
	_msg = _this select 0;
	[_msg] remoteExec ["RPP_Global_Message_Compile"];
}] call RPP_Function;
publicVariable "RPP_Message_Global";

["RPP_Global_Message_Compile", {
	private ["_msg"];
	_msg = _this select 0;
	systemChat _msg;
}] call RPP_Function;
publicVariable "RPP_Global_Message_Compile";

["RPP_PlaySound_Global_Players", {
	private ["_sound"];
	_sound = _this select 0;
	[_sound] remoteExec ["RPP_Global_PlaySound_Players"];
}] call RPP_Function;
publicVariable "RPP_PlaySound_Global_Players";

["RPP_PlaySound_Global_Object", {
	private ["_sound","_object"];
	_object = _this select 0;
	_sound = _this select 1;
	[_object,_sound] remoteExec ["RPP_Global_PlaySound_Object"];
}] call RPP_Function;
publicVariable "RPP_PlaySound_Global_Object";

["RPP_Global_PlaySound_Object", {
	private ["_sound","_object"];
	_object = _this select 0;
	_sound = _this select 1;
	call compile format ["%1 say3D '%2'",_object,_sound];	
}] call RPP_Function;
publicVariable "RPP_Global_PlaySound_Object";

["RPP_Global_PlaySound_Players", {
	private ["_so"];
	_so = _this select 0;
	player say3D _so;
}] call RPP_Function;
publicVariable "RPP_Global_PlaySound";

["RPP_PlaySound_Global_Player", {
	_player = _this select 0;
	_sound = _this select 1;
	[_player,_sound] remoteExec ["RPP_Global_playSound_Player"];
}] call RPP_Function;
publicVariable "RPP_PlaySound_Global_Player";

["RPP_Global_playSound_Player", {
	_player = _this select 0;
	_sound = _this select 1;
	_player say3d _sound;
}] call RPP_Function;
publicVariable "RPP_Global_playSound_Player";

["RPP_Message_Police", {
	private ["_msg"];
	_msg = _this select 0;
	[_msg] remoteExec ["RPP_Police_Message",west];
}] call RPP_Function;
publicVariable "RPP_Message_Police";

["RPP_Police_Message", {
	private ["_Message"];
	_Message = _this select 0;
	systemChat _Message;
}] call RPP_Function;
publicVariable "RPP_Police_Message";

["RPP_SwitchAnim_Global", {
	private ["_move","_cmd","_player"];
	_move = _this select 0;
	_cmd = _this select 1;
	_player = player;
	[_move,_cmd,_player] remoteExec ["RPP_Global_SwitchAnim"];
}] call RPP_Function;
publicVariable "RPP_SwitchAnim_Global";

["RPP_Global_SwitchAnim", {
	private ["_move","_cmd","_player"];
	_move = _this select 0;
	_cmd = _this select 1;
	_player = _this select 2;

	call compile format ["_player %1 '%2'",_cmd,_move];
}] call RPP_Function;
publicVariable "RPP_Global_SwitchAnim";