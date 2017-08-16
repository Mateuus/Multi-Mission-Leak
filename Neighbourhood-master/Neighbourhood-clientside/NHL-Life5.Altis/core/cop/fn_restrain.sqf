/*
	File: fn_restrain.sqf
	Author: Bryan "Tonic" Boardwine
	EDIT: Distrikt41-Dscha
	Description:
	Retrains the client --- Since Tonic's Timer was crap - started EVERYTIME and stopped only when Timer ran out, so it was possible to unrestrain, when restrained 1s-4:59min earlier - i remade it...
	HALLO PHIL UND LARGO. WIE IHR SEHEN KÖNNT IST DAS HIER VON DISTRIKT 41 UND NICHT VON SYNCED41!
*/
private["_cop","_player","_maskiert"];
_cop = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_player = player;
//if(isNull _cop) exitWith {};
player unassignItem "ItemGPS";
player unassignItem "ItemMap";
player removeItem "ItemGPS";
player removeItem "ItemMap";
//Timer neu geschrieben
[] spawn
{
	private["_time"];
	while {true} do
	{
		
		if([west,getPos player,30] call life_fnc_nearUnits) then {life_HC_Timer = 0;}; // timer reset wenn ein Cop in der nähe ist
		if(life_HC_Timer == 0) then {_time = time; life_HC_Timer = 1;};
		if(!(player getVariable["restrained",false])) exitWith {life_HC_Timer = 0;};
		if((player getVariable ["escorting",TRUE])) then {life_HC_Timer = 0;};
		
		if((time - _time) > (5 * 60)) then
			{
				if(!(player getVariable["restrained",FALSE])) exitWith {life_HC_Timer = 0;};
				
				if (side player == civilian) then
				{
					if(!([west,getPos player,30] call life_fnc_nearUnits) && !([civilian,getPos player,20] call life_fnc_nearUnits) && (player getVariable["restrained",FALSE]) && vehicle player == player) exitWith
					{
						player setVariable["restrained",FALSE,TRUE];
						player setVariable["Escorting",FALSE,TRUE];
						player setVariable["transporting",false,true];
						detach player;
						life_HC_Timer = 0;
						titleText["Du wurdest Automatisch befreit, da Du die maximale Zeit erreicht hast, ohne das direkte Interaktion mit Dir betrieben wurde.","PLAIN"];
					};
				};
				
				if (side player == west) then
				{
					if(!([civilian,getPos player,20] call life_fnc_nearUnits) && (player getVariable["restrained",FALSE]) && vehicle player == player) exitWith
					{
						player setVariable["restrained",FALSE,TRUE];
						player setVariable["Escorting",FALSE,TRUE];
						player setVariable["transporting",false,true];
						detach player;
						life_HC_Timer = 0;
						titleText["Du wurdest Automatisch befreit, da Du die maximale Zeit erreicht hast, ohne das direkte Interaktion mit Dir betrieben wurde.","PLAIN"];
					};
				};
				
		
				life_HC_Timer = 0;
			};
		uisleep 10;
	};
};

if((player getVariable["surrender",FALSE])) then { player setVariable["surrender",FALSE,TRUE]; player switchMove ""; };
titleText[format[localize "STR_Cop_Retrained",_cop getVariable["realname",name _cop]],"PLAIN"];
player say3D "cuff";

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

	if(!alive _cop) exitWith {
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
	player say3D "cuff";
	
	player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
	player setVariable ["Escorting",false,true];
	player setVariable ["transporting",false,true];
	detach player;
};