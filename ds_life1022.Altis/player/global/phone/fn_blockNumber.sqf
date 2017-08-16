/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Blocks a players number to stop harassment
*/

private ["_blockee","_uid","_index"];

if((lbCurSel 2100) isEqualTo -1)exitWith{hint "You have not selected anybody to block"};
_blockee = lbData [2100,lbCurSel 2100];
_blockee = missionNamespace getVariable _blockee;
if((isNil "_blockee")||(isNull _blockee))exitWith{};

_uid = (getPlayerUID _blockee);
_index = DS_blockedCallers find _uid;

if(!(_index isEqualTo -1))then {
	hint "This person is already blocked, they will now be unblocked";
	DS_blockedCallers deleteAt _index;
} else {
	hint "This person will now be blocked from messaging you";
	DS_blockedCallers pushBack _uid;
};