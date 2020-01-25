/*
	fn_bandagePlayer.sqf
*/

if(!life_action_inUse) then {
	life_action_inUse = true;

	if (isNull objectParent player) then 
	{
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medicUp3";
		
		waitUntil{animationState player != "AinvPknlMstpSnonWnonDnon_medicUp1";};
	};
	if(isPlayer cursorTarget) then {
		cursorTarget setVariable ["bleedingon",1,true]; 
	} else {
		_blah = "Target moved, procedure failed.";
		[format["%1", _blah], false] spawn domsg;
	};

};
life_action_inUse = false;	