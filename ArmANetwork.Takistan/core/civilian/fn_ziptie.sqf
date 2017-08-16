/*
	File: fn_restrain.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_victim","_player"];
_victim = param [0,Objnull,[Objnull]];
_player = player;
if(isNull _victim) exitWith {};
if((player getVariable["surrender",FALSE])) then { player setVariable["surrender",FALSE,TRUE]; player switchMove ""; };

//Monitor excessive restrainment
[] spawn
{
	private["_time"];
	while {true} do
	{
		_time = time;
		waitUntil {(time - _time) > (5 * 60)};

		if(!(player getVariable["restrained",FALSE])) exitWith {};
		if(!([civilian,getPos player,30] call life_fnc_nearUnits) && (player getVariable["restrained",FALSE]) && vehicle player == player) exitWith {
			player setVariable["restrained",FALSE,TRUE];
			player setVariable["restrainedtype",nil];
			player setVariable["Escorting",FALSE,TRUE];
			player setVariable["transporting",false,true];
			detach player;
			titleText[localize "STR_Civ_ExcessiveRestrain","PLAIN"];
		};
	};
};

titleText[format[localize "STR_Civ_Ziptied",_victim getVariable["realname",name _victim]],"PLAIN"];

while {player getVariable "restrained"} do
{
	if(vehicle player == player) then {
		player playMove "AmovPercMstpSnonWnonDnon_Ease";
	};

	_state = vehicle player;
	waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getvariable "restrained") || vehicle player != _state};

	if(!alive player) exitWith
	{
		player setVariable ["restrained",false,true];
		player setVariable ["Escorting",false,true];
		player setVariable ["transporting",false,true];
		detach _player;
	};

	if(!alive _victim) exitWith {
		player setVariable ["Escorting",false,true];
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
	player setVariable ["Escorting",false,true];
	player setVariable ["transporting",false,true];
	detach player;
};
