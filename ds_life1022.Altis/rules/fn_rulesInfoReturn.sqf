/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Returns server rules
*/
private ["_returnArray"];

_returnArray = [
["Killing players",["Rule Description","How to declare as Civ","How to declare as Cop"]],
["Vehicle Death Match (VDM)",["Sub Cat 3","Sub Cat 4"]]
];

if((_this select 0) isEqualTo 666)exitWith {
	_returnArray;
};

if(_this select 1)exitWith {
	_returnArray = (_returnArray select DS_rulesMenuIndex);
	_returnArray = (_returnArray select 1);
	_returnArray;
};