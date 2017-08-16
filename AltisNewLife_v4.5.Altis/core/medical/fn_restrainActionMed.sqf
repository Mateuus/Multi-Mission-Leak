#include <macro.h>
private["_med","_player"];
_med = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_player = player;
if(isNull _med) exitWith {};
//Monitor excessive restrainment
[] spawn
{
	private["_time"];
	while {true} do
	{
		_time = time;
		waitUntil {(time - _time) > (5 * 60)};
		
		if(!(player GVAR["restrained",FALSE])) exitWith {};
		if(!([independent,getPos player,30] call life_fnc_nearUnits) && (player GVAR["restrained",FALSE]) && vehicle player == player) exitWith {
			player SVAR["restrained",FALSE,TRUE];
			player SVAR["Escorting",FALSE,TRUE];
			player SVAR["transporting",false,true];
			detach player;
			titleText["Vous avez été relaché, votre traitement a l'air de fonctionner","PLAIN"];
		};
	};
};

if((player GVAR["surrender",FALSE])) then { player SVAR["surrender",FALSE,TRUE]; player switchMove ""; };
titleText[format["Vous avez été diagnostiqué comme fou par %1",_med GVAR["realname",name _med]],"PLAIN"];
				
while {player GVAR "restrained"} do
{
	if(vehicle player == player) then {
		player playMove "AmovPercMstpSnonWnonDnon_Ease";
	};
	
	_state = vehicle player;
	waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getvariable "restrained") || vehicle player != _state};
			
	if(!alive player) exitWith
	{
		player SVAR ["restrained",false,true];
		player SVAR ["Escorting",false,true];
		player SVAR ["transporting",false,true];
		detach _player;
	};
	
	if(!alive _med) exitWith {
		player SVAR ["Escorting",false,true];
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
	player SVAR ["Escorting",false,true];
	player SVAR ["transporting",false,true];
	detach player;
};