/*
	Author: ColinM9991
	
	Description:
	Checks the cursor target and tells the player whether it has a bomb or not.
*/
private["_bObject"];
_bObject = cursorTarget;
if(isNull cursorTarget) exitWith {}; //Bad object
if(!([false,"bombdetect",1] call life_fnc_handleInv)) exitWith { hint "You do not have a Bomb Detection kit"; }; //Error?

[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 5;
if(_bObject getVariable["dchargeplaced",false]) then {
	hint "Somebody has rigged this to blow; Run or Defuse!";
	_bObject setVariable["dchargefound",true,true];
} else { hint "There is no bomb here, stop being paranoid!" };