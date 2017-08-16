/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Sets up rebel missions
*/
disableSerialization;
private["_shop","_dialog","_vehicleListPrice","_vehicleListStr","_name","_price","_img","_toolTip","_maxSpeed","_armorRating","_shopArray"];

_shop = _this select 0;
disableSerialization;
_dialog = findDisplay 666667;
_vehicleList = _dialog displayCtrl 1501;

ctrlShow[66653,false];
ctrlShow[778,false];
ctrlShow[777,false];
ctrlShow[66654,false];

_missions = [["Car Bomb Missions","Get paid to detonate a car bomb",0],
			["Rebel Token Convoy","Complete this mission to receive 100 rebel tokens",4],
			["Unarmed Thermal Strider Convoy","Complete this convoy to receive an unarmed thermal enabled strider in your garage",1],
			["Thermal Hellcat Convoy","Complete this convoy to receive a thermal enabled hellcat in your garage",2],
			["Thermal HMG Strider Convoy","Complete this convoy to receive a thermal enabled strider HMG in your garage",3],
			["Terrorist Mission","Complete this terrorist mission to receive a large payout from terrorist sponsors",5]];

lbClear _vehicleList;

{
	_name = (_x select 0);
	_toolTip = (_x select 1);
	_vehicleList lbAdd format ["%1",_name];
	_vehicleList lbSetTooltip [(lbSize _vehicleList)-1, _toolTip];
	_vehicleList lbSetColor [(lbSize _vehicleList)-1, [0, 1, 0, 0.5]];
	_temp = format ["%1",(_x select 2)];
	_vehicleList lbSetData [(lbSize _vehicleList)-1,_temp];
}forEach _missions;
