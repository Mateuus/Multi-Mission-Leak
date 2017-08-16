/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Checks a name for validity
*/

private ["_nameArray","_legalChars","_nameFail"];

_legalChars = [
	"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
	"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
	"1","2","3","4","5","6","7","8","9","0",
	" ","(",")","{","}","[","]","_","-",".","|"
];
_nameArray = [(name player)] call DS_fnc_strToArray;
_nameFail = false;

{
	if(!(_x in _legalChars))exitWith {
		_nameFail = true;
	};
} forEach _nameArray;

if(_nameFail)then {
	player setPos (getMarkerPos "chopDrop");
	["sameName2",false,true] call BIS_fnc_endMission;
	sleep 35;
};