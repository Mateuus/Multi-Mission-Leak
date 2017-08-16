/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Packs a building box
*/

private ["_cursor","_objects","_pack","_box"];
_cursor = cursorTarget;
_box = true;
if(isNil "DS_copLevel")then{DS_copLevel = 0;};
if((playerside == west)&&(DS_copLevel == 0))exitwith{hint "Public cops can not do this"};
if((!(player getVariable ["medic",false]))&&(!(player getVariable ["mechanic",false]))&&(!(player getVariable ["security",false]))&&(playerside != west))exitwith{hint "You do not have the key to pack this box"};
if(!(_cursor isKindOf "Land_WoodenBox_F"))then{_box = false;};
_pack = true;
_pack = [
	"Are you sure you want to pack these items? (Packing up somebody elses items to troll will get you blacklisted)",
	"Pack Items",
	"Pack",
	"Close"
] call BIS_fnc_guiMessage;
if(!_pack)exitwith{};
_objects = nearestobjects [player,["All"], 150];
//systemchat format ["Objects = %1",_objects];
{
	if(_x getVariable ["buildItem",false])then
		{
		deleteVehicle _x;
		};
}forEach _objects;

if(_box)then
	{
	deleteVehicle _cursor;
	["buildingBox",true,1] call DS_fnc_handleInventory;
	};

