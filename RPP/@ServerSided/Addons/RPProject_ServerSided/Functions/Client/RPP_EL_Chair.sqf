/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_EL_Chair.sqf

Description:
execute players
*/
["RPP_EL_Chair_Set", {
	if (RPP_PlayerAttached isEqualTo "") exitWith {
		_msg = "Please attach him to yourself first.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (player distance RPP_PlayerAttached < 5) exitWith {
		systemChat "To far away from him.";
	};
	if (player distance RPP_EL_Chair < 5) exitWith {
		_msg = "To far away from the electric Chair!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (RPP_PlayerAttached getVariable "Handcuff") then {
		[[player], "RPP_EL_Chair_AttachTo",RPP_PlayerAttached] call BIS_FNC_MP;
		_msg = "You Attached him to the electric Chair!";
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;
		RPP_PlayerAttached = "";
	} else {
		_msg = "Please handcuff him first.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
}] call RPP_Function;
publicVariable "RPP_EL_Chair_Set";

["RPP_EL_Chair_AttachTo", {
	_c = _this select 0;
	removeAllWeapons player;   
	player attachto [RPP_EL_Chair,[0,0,-0.2]];    
	player switchmove "HubSittingChairA_idle1";    
	player setdir 6300;     
	_msg = "You have been Attached to the electric chair!";   
	_color = RPP_Red;   
	[_msg,_color] call RPP_MessageSystem;

	[[player], "RPP_EL_Chair_Execute_Action",_c] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_EL_Chair_AttachTo";

["RPP_EL_Chair_Execute_Action", {
	RPP_Execute_Get = _this select 0;
	RPP_EL_Execute = player addAction ["Start Execute",{[] call RPP_EL_Chair_Execute_Start}];
}] call RPP_Function;
publicVariable "RPP_EL_Chair_Execute_Action";

["RPP_EL_Chair_Execute_Start", {
	[[], "RPP_EL_Chair_Execute",RPP_Execute_Get] call BIS_FNC_MP;
	player removeAction RPP_EL_Execute;
	RPP_Execute_Get = "";
	["RPP_EL_ChairEffect",RPP_EL_Chair] call RPP_PlaySound_Global_Object;
}] call RPP_Function;
publicVariable "RPP_EL_Chair_Execute_Start";

["RPP_EL_Chair_Execute", {
	[] spawn {	
		sleep 5;
		player setDamage 0.3;
		sleep 5;
		player setDamage 0.7;
		sleep 4;
		player setDamage 1;

		[] call RPP_Variables;
		sleep 0.5;
		[] call RPP_MySQL_Client_SendStats;
		sleep 1;
		LifeTimer_Minute = 0;
		LifeTimer_Seconds = 2;
		sleep 2;
		[] call RPP_Login_Dialog;
		systemChat "STATS RESETTED!";
		sleep 1.5;
		player setpos (getMarkerPos "respawn_Civilian");
	};	
}] call RPP_Function;
publicVariable "RPP_EL_Chair_Execute";

