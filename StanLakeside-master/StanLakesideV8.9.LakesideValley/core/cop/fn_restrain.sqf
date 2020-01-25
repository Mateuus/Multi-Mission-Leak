/*
	File: fn_restrain.sqf
	
	
	Description:
	Retrains the client.
*/
private["_cop","_player"];
_cop = param [0,Objnull,[Objnull]];
if(isNull _cop) exitWith {};

//Monitor excessive restrainment
[] spawn
{
	private["_time"];
	while {true} do
	{
		_time = time;
		waitUntil {uiSleep 10; ((time - _time) > (5 * 60))};
		
		if(!(player getVariable["restrained",FALSE])) exitWith {};
		if(!([west,getPos player,30] call life_fnc_nearUnits) && (player getVariable["restrained",FALSE]) && isNull objectParent player) exitWith {
			player setVariable["restrained", nil, true];
			player setVariable["Escorting", nil, true];
			player setVariable["transporting", nil, true];
			player setVariable["tied", nil, true];
			detach player;
			[localize "STR_Cop_ExcessiveRestrain", false] spawn domsg;
		};
	};
};

[format[localize "STR_Cop_Retrained",_cop getVariable["realname",name _cop]], false] spawn domsg;

if((player getVariable["surrender",FALSE])) then { player setVariable["surrender",FALSE,TRUE]; };

player switchMove "";

//This is unscheduled
if(isNull objectParent player) then {
	if(player getVariable ["restrained2", false]) then {
		player playMovenow "Acts_AidlPsitMstpSsurWnonDnon_loop";  
	} else {
		player playMove "AmovPercMstpSnonWnonDnon_Ease";
	};
};

//Did this so restrain animation could be played immediately in unscheduled and then loops in scheduled
[_cop] spawn {
	_exit = false;
	_cop = _this select 0;
	while {player getVariable ["restrained", false]} do
	{
		if(isNull objectParent player) then {
			if(player getVariable ["restrained2", false]) then {
				player playMovenow "Acts_AidlPsitMstpSsurWnonDnon_loop";  
			} else {
				player playMove "AmovPercMstpSnonWnonDnon_Ease";
			};
		};
		
		_state = vehicle player;
		waitUntil {(animationState player != "AmovPercMstpSnonWnonDnon_Ease" && animationState player != "Acts_AidlPsitMstpSsurWnonDnon_loop") || !(player getvariable ["restrained", false]) || vehicle player != _state};
				
		if(deadPlayer) exitwith
		{
			waitUntil {!deadPlayer};
			if (life_respawned) exitwith { _exit = true; };
			[player,"handcuff"] spawn life_fnc_nearestSound;	
			player setVariable["restrained",true,true];
			player setVariable["restrained2",true,true];
			[player] call life_fnc_restrain;
		};

		if(_exit) exitwith {};
			
		if((_cop getVariable["Revive",FALSE])) exitWith {
			player setVariable ["Escorting", nil, true];
			detach player;
		};
		
		if(vehicle player != player) then
		{
			if(driver (vehicle player) == player) then {
				player action["eject",vehicle player]
			};
		};
	};
	
	if(!deadPlayer) then
	{
		if(animationState player isEqualTo "Acts_AidlPsitMstpSsurWnonDnon_loop") then {
			player playMoveNow "Acts_AidlPsitMstpSsurWnonDnon_out"
		} else {
			player switchMove ""
		};

		player setVariable ["Escorting", nil, true];
		player setVariable ["transporting", nil, true];
		detach player;
	};
};
