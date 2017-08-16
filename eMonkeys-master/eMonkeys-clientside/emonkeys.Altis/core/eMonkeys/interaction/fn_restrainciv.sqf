/*
	File: fn_restrain.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Retrains the client.
*/
private["_cop","_player"];
_cop = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_player = player;
if(isNull _cop) exitWith {};


//Monitor excessive restrainment
[] spawn
{
	private["_time"];
	while {true} do
	{
		_time = time;
		waitUntil {(time - _time) > (5 * 60)};
		
		if(!(player getVariable["restrainedciv",FALSE])) exitWith {};
		if(!(player getVariable["restrained",FALSE])) exitWith {};
		if(!([west,getPos player,30] call EMonkeys_fnc_nearUnits) && (player getVariable["restrainedciv",FALSE]) && vehicle player == player) exitWith {
			player setVariable["restrainedciv",FALSE,TRUE];
			player setVariable["Escortingciv",FALSE,TRUE];
			player setVariable["transportingciv",false,true];
			detach player;
			titleText["You have been released automatically for excessive restrainment time","PLAIN"];
		};
	};
};
if((player getVariable["surrender",FALSE])) then { player setVariable["surrender",FALSE,TRUE]; player switchMove ""; };
titleText[format["Sie wurden von %1 festgenommen!",_cop getVariable["realname",name _cop]],"PLAIN"];
		player say3D "cuff";
		
while {player getVariable "restrainedciv"} do
{
	if(vehicle player == player) then {
		player playMove "AmovPercMstpSnonWnonDnon_Ease";
	};
	
	_state = vehicle player;
	waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getvariable "restrainedciv") || vehicle player != _state};
			
	if(((!alive player) || (player getVariable["onkill",FALSE]))) exitWith
	{
		player setVariable ["restrainedciv",false,true];
		player setVariable ["Escortingciv",false,true];
		player setVariable ["transportingciv",false,true];
		detach _player;
	};
	
	if(((!alive _cop) || (_cop getVariable["onkill",FALSE]))) exitWith {
		player setVariable ["Escortingciv",false,true];
		detach player;
	};
	
	if(vehicle player != player) then
	{
		//disableUserInput true;
		if(driver (vehicle player) == player) then {player action["eject",vehicle player];};
	};
};

//disableUserInput false;
		
if(alive player) then
{
	player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
	player setVariable ["Escortingciv",false,true];
	player setVariable ["transportingciv",false,true];
	detach player;
	player say3D "cuff";
};