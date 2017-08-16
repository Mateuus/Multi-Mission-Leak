/*
	Tortures the player
*/
private["_unit","_rand","_damage", "_fatigue"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
if(playerSide == west) exitWith {};
if(eM_action_inUse) exitWith {};

if(player distance _unit > 5 || ((!alive player) || (player getVariable["onkill",FALSE])) || ((!alive _unit) || (_unit getVariable["onkill",FALSE]))) exitWith {hint "Du kannst die Person nicht foltern."};

eM_action_inUse = true;


_rand = round(random 4);

switch(_rand) do 
{
	case 0:
	{
		hintSilent "Du hast dem Spieler in den Magen geschlagen.";
		
		[[_unit,0],"EMonkeys_fnc_tortured",_unit,false] call EMonkeys_fnc_mp;
		
		//Fatigure unit
		_fatigue = getFatigue _unit;
		_fatigue = _fatigue + 0.2;
		
		if(_fatigue >= 1) then { _fatigue = 1; };
		
		_unit setFatigue _fatigue;
		

		_unit say3D "punch";

	};
	case 1:
	{
		hintSilent "Du hast dem Spieler ins Gesicht geschlagen.";
		
		[[_unit,1],"EMonkeys_fnc_tortured",_unit,false] call EMonkeys_fnc_mp;
		
		//Fatigure unit
		_fatigue = getFatigue _unit;
		_fatigue = _fatigue + 0.25;
		
		if(_fatigue >= 1) then { _fatigue = 1; };
		
		
		_unit say3D "punch";

	};
	case 2:
	{
		hintSilent "Du hast dem Spieler getreten.";
		
		[[_unit,2],"EMonkeys_fnc_tortured",_unit,false] call EMonkeys_fnc_mp;
		
		//Fatigure unit
		_fatigue = getFatigue _unit;
		_fatigue = _fatigue + 0.1;
		
		if(_fatigue >= 1) then { _fatigue = 1; };
		

		_unit say3D "punch_break";
	};
	case 3:
	{
		hintSilent "Du hast dem Spieler in die Eier getreten.";
		
		[[_unit,3],"EMonkeys_fnc_tortured",_unit,false] call EMonkeys_fnc_mp;
		
		_unit setFatigue 1;
		_unit say3D "punch_balls";

	};
	default
	{
		hintSilent "Du hast dem Spieler einige Zähne ausgeschlagen.";
		
		[[_unit,4],"EMonkeys_fnc_tortured",_unit,false] call EMonkeys_fnc_mp;
		
		//Fatigure unit
		_fatigue = getFatigue _unit;
		_fatigue = _fatigue + 0.1;
		
		if(_fatigue >= 1) then { _fatigue = 1; };

		_unit say3D "punch";
	};
};


eM_action_inUse = false;

[[getPlayerUID player,name player,"",["Folter",800]],"EMonkeys_fnc_wantedAdd",false,false] call EMonkeys_fnc_mp;
