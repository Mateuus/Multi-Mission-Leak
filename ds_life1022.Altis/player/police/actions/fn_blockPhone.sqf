/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Blocks the phone of a civilian from messaging the police
*/

private ["_unit","_index"];

_unit = lbData [2902,lbCurSel 2902];
_unit = missionNamespace getVariable _unit;

_uid = (getPlayerUID _unit);
_index = blockedCallers find _uid;

if(!(_index isEqualTo -1))then {
	hint "This person is already blocked, they will now be unblocked";
	blockedCallers deleteAt _index;
} else {
	hint "This person will now be blocked from calling the police";
	blockedCallers pushBack _uid;
};

publicVariable "blockedCallers";