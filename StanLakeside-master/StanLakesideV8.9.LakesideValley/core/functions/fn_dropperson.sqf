
//drop body
_curt = cursortarget;

if(!dialog && cursorTarget isKindOf "Man" && (cursorTarget getVariable["dead",FALSE]) && (player distance cursorTarget) < 3 && (cursorTarget getVariable "drag")) then {
	detach _curt;
	_curt switchMove "AinjPpneMstpSnonWrflDb_release";
	_curt setVariable["drag",false,true];
	player switchAction "";
	player forceWalk false;
};