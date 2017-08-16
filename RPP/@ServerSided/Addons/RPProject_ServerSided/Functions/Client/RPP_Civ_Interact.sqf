/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Civ_Interact.sqf

Description:
Interact with other players
*/
["RPP_Civilian_Rob", {
	private ["_Target"];
	_Target = cursorTarget;
	if (player distance _Target > 15) exitWith {
		_msg = "To far away from the player";
		_color = RPP_Red;
		[_msg,_Color] call RPP_MessageSystem;
	};
	if(isNull _Target) exitWith {
		_msg = "Not a valid player!";
		_color = RPP_Red;
		[_msg,_Color] call RPP_MessageSystem;
	};
	if(!(_Target isKindOf "Man")) exitWith {
		_msg = "No players was found!";
		_color = RPP_Red;
		[_msg,_Color] call RPP_MessageSystem;
	};
	if (!(call RPP_isArmed)) exitWith {
		_msg = "You need to be Armed to rob.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	[[player], "RPP_Civilian_Rob_Get",_Target] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_Civilian_Rob";

["RPP_Civilian_Rob_Get", {
	private ["_robber","_GetCash"];
	_robber = _this select 0;
	_GetCash = round (random RPP_Cash);

	[_GetCash] call RPP_AntiCheat_RemoveMoney;

	_msg = format ["You have been robbed for $%1",_GetCash];
	_color = RPP_Red;
	[_msg,_Color] call RPP_MessageSystem;

	[[_GetCash], "RPP_Civilian_Rob_Return", _robber] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_Civilian_Rob_Get";

["RPP_Civilian_Rob_Return", {
	private ["_RobbedAmount"];
	_RobbedAmount = _this select 0;

	[_RobbedAmount] call RPP_AntiCheat_AddMoney;

	_msg = format ["You robbed them for $%1 and now have $%2 on you.",_RobbedAmount,RPP_Cash];
	_color = RPP_Green;
	[_msg,_Color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_Civilian_Rob_Return";

["RPP_Civilian_CabelCuff", {
	private ["_target"];
	_target = cursorTarget;
	if (player distance _target > 10) exitWith {
		_msg = "To far away from the player!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (!(_target isKindOf "man")) exitWith {
		_msg = "Not a player!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (["CabelCuff"] call RPP_Inventory_Count == 0) exitWith {
		_msg = "You need a cable cuffed to do this.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (!(call RPP_isArmed)) exitWith {
		_msg = "You need to be Armed to cable cuffed.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	[[player], "RPP_Civilian_CabelCuff_Get", _Target] call BIS_FNC_MP;
	if (_Target getVariable "RPP_CableCuff") then {
		_msg = "You just cable cuffed him!";
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;
	} else {
		_msg = "You just released him!";
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;
	};
}] call RPP_Function;
publicVariable "RPP_Civilian_CabelCuff";

["RPP_Civilian_CabelCuff_Get", {
	private ["_cop","_vehp"];
 	if (RPP_isCop) exitWith {};
	_cop = _this select 0;
	if (player getVariable "RPP_CableCuff") exitWith {
		player setVariable ["RPP_CableCuff",false,true];
		player switchmove "Normal";
		_msg = "You have been uncuffed!";
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;

		[] call RPP_Client_Actions;
		[] call RPP_S_Actions;
	};
	player setVariable ["RPP_CableCuff",true,true];
	removeAllActions player;
	_msg = "You have been Handcuffed!";
	_color = RPP_Yellow;
	[_msg,_color] call RPP_MessageSystem;
	while {player getVariable "RPP_CableCuff"} do {
		player playmove "AmovPercMstpSnonWnonDnon_Ease";
		_vehp = vehicle player;
		waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getvariable "RPP_CableCuff") || vehicle player != _vehp};

		if (!Alive player) exitWith {
			player setVariable ["RPP_CableCuff",false,true];
		};
		if(vehicle player != player) then
		{
			if (driver (vehicle player) == player) then {
				player action["eject",vehicle player];
			};
		};
	};
}] call RPP_Function;
publicVariable "RPP_Civilian_CabelCuff_Get";

["RPP_Civilian_Drag", {
	private ["_target"];
	_target = cursorTarget;
	if (player distance _target > 10) exitWith {
		_msg = "To far away from the player!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (!(_target isKindOf "man")) exitWith {
		_msg = "Not a player!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_target getVariable "RPP_CableCuff") then {
		if (_target getVariable "RPP_Escorting") then {
			[[], "RPP_Civilian_Undrag",RPP_PlayerAttached] call BIS_FNC_MP;
			detach RPP_PlayerAttached;
			detach player;

			RPP_PlayerAttached = "";
		} else {
			_target setVariable ["RPP_Escorting",true,true];
			RPP_PlayerAttached = _target;
			RPP_PlayerAttached attachto [player,[0.7,0.3,0]];
		};
	} else {
		_msg = "This player is not cable cuffed!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
}] call RPP_Function;
publicVariable "RPP_Civilian_Drag";

["RPP_Civilian_Undrag", {
	detach player;
	player setVariable ["RPP_Escorting",false,true];
}] call RPP_Function;
publicVariable "RPP_Civilian_Undrag";

["RPP_Civilian_AskforName", {
	private ["_target"];
	_target = cursorTarget;
	if (player distance _target > 10) exitWith {
		_msg = "To far away from the player!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (!(_target isKindOf "man")) exitWith {
		_msg = "Not a player!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	[[player], "RPP_Civilian_AskforName_Get",_target] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_Civilian_AskforName";

["RPP_Civilian_AskforName_Get", {
	private ["_p","_ui","_Text"];
	RPP_Asker = _this select 0;
	createDialog "RPP_Askforname";
	buttonSetAction [1600,"[] call RPP_Civilian_AskforName_Give;"];
	buttonSetAction [1601,"[] call RPP_Civilian_AskforName_Cancel;"];
	disableSerialization;
	_ui = uiNameSpace getVariable ["RPP_Askforname",displayNull];
	_Text = _ui displayCtrl 1000;
	_Text ctrlSetText format["%1 want's to know your name.",name RPP_Asker];
}] call RPP_Function;
publicVariable "RPP_Civilian_AskforName_Get";

["RPP_Civilian_AskforName_Give", {
	[[player], "RPP_Civilian_AskforName_Give_Return", RPP_Asker] call BIS_FNC_MP;
	_msg = "You just gave your name to them!";
	_Color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;

	closeDialog 1;		
}] call RPP_Function;
publicVariable "RPP_Civilian_AskforName_Give";

["RPP_Civilian_AskforName_Cancel", {
	[[], "RPP_Civilian_AskforName_Cancel_Return", RPP_Asker] call BIS_FNC_MP;
	_msg = "You did not give your name";
	_Color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;

	closeDialog 1;		
}] call RPP_Function;
publicVariable "RPP_Civilian_AskforName_Cancel";

["RPP_Civilian_AskforName_Give_Return", {
	private ["_p"];
	_p = _this select 0;

	_msg = format ["His name is %1",name _p];
	_color = RPP_Yellow;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_Civilian_AskforName_Give_Return";

["RPP_Civilian_AskforName_Cancel_Return", {
	_msg = "They did not want to share there name with you.";
	_color = RPP_Yellow;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_Civilian_AskforName_Cancel_Return";