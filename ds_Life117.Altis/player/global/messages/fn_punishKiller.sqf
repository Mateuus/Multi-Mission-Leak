/*
	File: fn_punishKiller.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Punishes killers for different things
*/
private["_type","_tempVal"];

_type = _this select 0;
_player = _this select 1;
_tempVal = (DS_atmcoin/5);

if(_tempVal > 10000000)then{_tempVal = 10000000};

if(_type == 1)then
	{
	if(_tempVal < 100000)exitWith
		{
		[["restrained but kicked from server",(name player),_tempVal,player],"HUNT_fnc_reportBug",false,false] spawn BIS_fnc_MP;
		hint format ["!~! WARNING !~!\n\nYou killed a restrained person, this is against the rules\n\n\nYou are being auto kicked from the server",[_tempVal] call DS_fnc_numberText];
		systemchat format ["!~! WARNING !~! You killed a restrained person, this is against the rules. You are being auto kicked from the server",[_tempVal] call DS_fnc_numberText];
		player say3D "fail";
		{
			if(_x getVariable ["DSAdmin",false])then
				{
				[[(name player),"Killed a restrained civilian but didn't have much money so got kicked"],"DS_fnc_DarkSide_ShowAll",_x,false] spawn DS_fnc_MP;
				};
		}forEach playableUnits;
		disableUserInput true;
		sleep 3;
		removeAllWeapons player;
		player setDamage 1;
		[] call DS_fnc_compileData;
		["quickKick",false,true] call BIS_fnc_endMission;
		[[0,format["%1 has been kicked from the server - Reason : Killing a restrained person (Auto Kick)",(name player),_reason]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
		sleep 10;
		disableUserInput false;
		};	
	player say3D "fail";	
	DS_atmcoin = DS_atmcoin - _tempVal;
	[[(_tempVal/30),"Has killed a restrained person",(name player)],"DS_fnc_copRewards",west,false] spawn BIS_fnc_MP;
	[["restrained",(name player),_tempVal,player],"HUNT_fnc_reportBug",false,false] spawn BIS_fnc_MP;
	hint format ["!~! WARNING !~!\n\nYou killed a restrained person, this is against the rules\n\n\n$%1 has been taken from your bank account",[_tempVal] call DS_fnc_numberText];
	systemchat format ["!~! WARNING !~! You killed a restrained person, this is against the rules. $%1 has been taken from your bank account",[_tempVal] call DS_fnc_numberText];
		{
			if(_x getVariable ["DSAdmin",false])then
				{
				[[(name player),"Killed a restrained civilian"],"DS_fnc_DarkSide_ShowAll",_x,false] spawn DS_fnc_MP;
				};
		}forEach playableUnits;
	};
	
if(_type == 2)then
	{
	if((player distance shawn1 > 4000)&&(player distance gangflag2 > 500)&&(player distance gangflag1 > 500)&&(player distance gangflag3 > 500))then
		{
		[75,false] call DS_fnc_moralAlter;
		};
	};
	
if(DS_moral < 0)then{DS_moral = 0};
	
[] call DS_fnc_compileData;