/*
			Author: Shawn "Huntah" Macgillivray
	
			Description:
			Runs when a player is ziptied
*/
private["_state","_time","_attacker","_victim","_counter","_gangName"];
_attacker = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_victim = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
if((isNull _attacker)||(isNull _victim))exitWith{};
_gangName = "";
_counter = 0;

_victim setVariable["cuffed",true,true];	
_victim setVariable["ziptied",true,true];
titleText["You Have been Ziptied!","PLAIN"];
hint "You have been Ziptied!";
player say3D "zip";

_gangName = (group player) getVariable ["gangName",""];
if(_gangName != "")then
	{
	[] spawn DS_civ_gangKickPlayer;
	};

[_attacker]spawn
	{
	private ["_time"];
	while {true} do
		{
		_time = time + 10;
		waitUntil {time > _time};
		if(!(player getVariable ["ziptied",false]))exitwith{};
		if(!(player getVariable ["cuffed",false]))exitwith{};
		if((!alive (_this select 0))||(!alive player)||((_this select 0) distance player > 60))exitWith
			{
			player playMoveNow "AmovPercMstpSnonWnonDnon";
			player setVariable["cuffed",false,true];
			player setVariable["cuffedVeh",false,true];
			player setVariable["ziptied",false,true];
			player setVariable["escorted",false,true];
			detach player;
			};
		};
	};
	
while {player getVariable ["ziptied",false]} do
	{
	if(vehicle player == player)then
		{
		player playMove "AmovPercMstpSnonWnonDnon_Ease";
		};
	_state = vehicle player;
	waitUntil {((animationState player != "AmovPercMstpSnonWnonDnon_Ease") || (!(player getVariable ["ziptied",false])) || (vehicle player != _state))};
	if(!alive player) exitWith
		{
		player setVariable ["cuffed",false,true];
		player setVariable ["escorted",false,true];
		player setVariable ["cuffedVeh",false,true];
		player setVariable ["ziptied",false,true];
		detach _victim;
		};
	if(vehicle player != player) then
		{
		if(driver (vehicle player) == player) then {(vehicle player) engineOn false;player action["getOut",vehicle player];};
		};
	};
if(alive player) then
	{
	player setAmmo [currentWeapon player, 0];
	player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
	player setVariable ["cuffed",false,true];
	player setVariable ["escorted",false,true];
	player setVariable ["cuffedVeh",false,true];
	player setVariable ["ziptied",false,true];
	detach _victim;
	};
	
player setVariable ["hostage",false,true];