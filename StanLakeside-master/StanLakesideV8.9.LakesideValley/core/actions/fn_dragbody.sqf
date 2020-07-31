isdragging = true;
dragging = cursortarget;
if(!(isNull attachedTo dragging)) exitwith { imdragging = false; };
dragging attachTo [player, [0.4, 0.2, 0.12]];
dragging switchMove "AinjPpneMrunSnonWnonDb";
player playAction "grabDrag";

while {isdragging} do {
	uisleep 1;
	dragging switchMove "AinjPpneMrunSnonWnonDb";
	if( !(dragging getVariable["dead",FALSE]) || (isNull attachedTo dragging) || (vehicle player) != player ) exitWith { [] call life_fnc_dropbody; };
};