/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Punishes killers for different things
*/

private ["_type","_player","_tempVal","_targets"];

_type = _this select 0;
_player = _this select 1;
_tempVal = (DS_atmCoin/5);

if(_tempVal > 10000000)then{_tempVal = 10000000};

if(_type == 1)then
	{
	if(!(playerSide isEqualTo civilian))exitwith{};
	if(_tempVal < 500000)exitWith
		{
		["restrained but kicked from server",(name player),_tempVal,player] remoteExec ["HUNT_fnc_reportBug",2];
		hint format ["!~! WARNING !~!\n\nYou killed a restrained person, this is against the rules\n\n\nYou are being auto kicked from the server",[_tempVal] call DS_fnc_numberText];
		systemchat format ["!~! WARNING !~! You killed a restrained person, this is against the rules. You are being auto kicked from the server",[_tempVal] call DS_fnc_numberText];
		player say3D "fail";

		_targets = allPlayers select {_x getVariable ["DSAdmin",false]};
		if(!(_targets isEqualTo []))then{[(name player),"Killed a restrained civilian but didn't have much money so got kicked"] remoteExecCall ["DS_fnc_DarkSide_ShowAll",_targets];};

		disableUserInput true;
		sleep 3;
		removeAllWeapons player;
		player setDamage 1;
		[] call DS_fnc_compileData;
		["quickKick",false,true] call BIS_fnc_endMission;

		_targets = allPlayers select {((side _x) isEqualTo west)||(_x getVariable ["security",false])||(_x getVariable ["DSAdmin",false])};
		if(!(_targets isEqualTo []))then {
			[0,format["%1 has been kicked from the server - Reason : Killing a restrained person (Auto Kick)",(name player),_reason]] remoteExecCall ["DS_fnc_globalMessage",_targets];
		};

		sleep 10;
		disableUserInput false;
		disableUserInput true;
		disableUserInput false;
		};
	player say3D "fail";
	DS_atmCoin = DS_atmCoin - _tempVal;
	[(_tempVal/30),"Has killed a restrained person",(name player)] remoteExec ["DS_fnc_copRewards",west];
	["restrained",(name player),_tempVal,player] remoteExec ["HUNT_fnc_reportBug",2];
	hint format ["!~! WARNING !~!\n\nYou killed a restrained person, this is against the rules\n\n\n$%1 has been taken from your bank account",[_tempVal] call DS_fnc_numberText];
	systemchat format ["!~! WARNING !~! You killed a restrained person, this is against the rules. $%1 has been taken from your bank account",[_tempVal] call DS_fnc_numberText];

	_targets = allPlayers select {_x getVariable ["DSAdmin",false]};
	if(!(_targets isEqualTo []))then{[(name player),"Killed a restrained civilian"] remoteExecCall ["DS_fnc_DarkSide_ShowAll",_targets];};
	};

if(_type == 2)then
	{
	if((player distance shawn1 > 2000)&&(player distance gangflag2 > 500)&&(player distance gangflag1 > 500)&&(player distance gangflag3 > 500))then
		{
		[75,false] call DS_fnc_moralAlter;
		};
	};

if(DS_moral < 0)then{DS_moral = 0};

[] call DS_fnc_compileData;