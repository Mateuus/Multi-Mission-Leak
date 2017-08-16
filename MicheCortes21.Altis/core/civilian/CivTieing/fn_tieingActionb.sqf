/*

*/

private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((_unit getVariable ["blindfolded", false])) exitWith {};

if((life_action_inUse) || (player getVariable ["tied", false]) || (player getVariable ["restrained", false])) exitWith { 
	hintSilent "Du kannst das nicht.";
}; 

if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
//Broadcast!

if(life_inv_blindfold < 1) exitWith {
	hintSilent "Du brauchst eine Augenbinde.";
};

life_inv_blindfold = life_inv_blindfold - 1;


hintSilent "Augen verbinden...";
_cme = 1;
_myposy = getPos player;

while {true} do {
life_action_inUse = true;
	if( player distance _myposy > 2.5 ) exitwith { 
			hint "Du bist zu weit weg !";
	};
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	_cme = _cme + 1;
	if(_cme > 3) exitwith {
		cursorTarget setVariable["blindfolded", true, true];
		[player] remoteExecCall ["life_fnc_tieingb", cursorTarget];
	};
};
life_action_inUse = false;

