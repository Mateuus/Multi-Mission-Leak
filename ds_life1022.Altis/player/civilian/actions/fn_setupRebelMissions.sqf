/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up rebel missions
*/

private ["_shop","_dialog","_list","_missions","_name","_tooltip","_index"];

disableSerialization;

_shop = _this select 0;
_dialog = findDisplay 666667;
_list = _dialog displayCtrl 1501;

ctrlShow [66653,false];
ctrlShow [778,false];
ctrlShow [777,false];
ctrlShow [66654,false];

_missions = [
	["Car Bomb Missions","Get paid to detonate a car bomb",0],
	["Rebel Token Convoy","Complete this mission to receive some rebel tokens",4],
	["Unarmed Thermal Strider Convoy","Complete this convoy to receive an unarmed thermal enabled strider in your garage",1],
	["Thermal Hellcat Convoy","Complete this convoy to receive a thermal enabled hellcat in your garage",2],
	["HMG Strider Convoy","Complete this convoy to receive a strider HMG in your garage",3],
	["Terrorist Mission","Complete this terrorist mission to receive a large payout from terrorist sponsors",5]
];

lbClear _list;

{
	_name = (_x select 0);
	_tooltip = (_x select 1);
	_index = _list lbAdd format ["%1",_name];
	_list lbSetTooltip [_index,_tooltip];
	_list lbSetColor [_index,[0,1,0,0.5]];
	_list lbSetData [_index,format ["%1",(_x select 2)]];
} forEach _missions;