_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {};
if(!(_curTarget isKindOf "Man") || {alive _curTarget}) exitWith {}; //Bad side check?

ES_pInact_curTarget = _curTarget;

[
	"Wiederbeleben Menu",
	[
		["Wiederbeleben","[ES_pInact_curTarget] spawn ES_fnc_revivePlayer; closeDialog 0;"],
		["Info über opfer","[ES_pInact_curTarget] spawn ES_fnc_openMedipad; closeDialog 0;"]
	]
] call ES_fnc_interactionMenuOpen;