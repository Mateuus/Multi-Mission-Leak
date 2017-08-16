/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Runs while restrained
*/
private ["_cop"];

_cop = _this select 0;

if(isNull _cop)exitwith{};

[] spawn DS_civ_gangKickPlayer;

[]spawn	
	{
	private ["_time","_waitTime"];
	
	_waitTime = 2;
	if(DS_superRestrained)then{_waitTime = 10;DS_superRestrained = false};
	
	while{true}do
		{
		_time = time + (_waitTime*60);
		waitUntil {time > _time};
		if(!(player getVariable ["cuffed",false]))exitwith{};
		if(!([getPos player,30,west] call DS_fnc_nearbyPlayers)&&(player getVariable["cuffed",FALSE])&&(vehicle player == player)) exitWith
			{
			player setVariable["cuffed",false,true];
			player setVariable["Escorted",false,true];
			player setVariable["cuffedVeh",false,true];
			detach player;
			titleText["You have managed to un-cuff yourself, Run!","PLAIN"];
			};
		};
	};

titleText[format["You have been hand cuffed by %1",_cop getVariable["name",name _cop]],"PLAIN"];
				
while {player getVariable "cuffed"} do
{
	if(vehicle player == player) then 
		{
		player playMove "AmovPercMstpSnonWnonDnon_Ease";
		};
	
	_state = vehicle player;
	waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getVariable "cuffed") || vehicle player != _state};
			
	if(!alive player) exitWith
	{
		player setVariable ["cuffed",false,true];
		player setVariable ["Escorted",false,true];
		player setVariable ["cuffedVeh",false,true];
		detach _player;
	};
	
	if(vehicle player != player) then
	{
		if(driver (vehicle player) == player) then {(vehicle player) engineOn false;player action["eject",vehicle player];};
	};
};
	
if(alive player) then
{
	player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
	player setVariable ["Escorted",false,true];
	player setVariable ["cuffedVeh",false,true];
	detach player;
};
