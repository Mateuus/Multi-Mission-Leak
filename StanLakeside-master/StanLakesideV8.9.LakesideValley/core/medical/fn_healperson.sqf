/*
	Function to heal person
	fn_healperson.sqf
*/

private["_display","_curTarget"];

_curTarget = cursorTarget;

if(!life_action_inUse) then {
life_action_inUse = true;

	if (isNull objectParent player) then 
	{
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medicUp1";
		
		waitUntil{animationState player != "AinvPknlMstpSnonWnonDnon_medicUp1";};
	};

	if( side player != independent) then {
		player removeMagazine "cg_atf_bandage_i";
		_curTarget setdamage 0.2;
		["Set",0.2] remoteExecCall ["fnc_doHealth",_curTarget];
	} else {
		["Set",0] remoteExecCall ["fnc_doHealth",_curTarget];
	};



};
life_action_inUse = false;	