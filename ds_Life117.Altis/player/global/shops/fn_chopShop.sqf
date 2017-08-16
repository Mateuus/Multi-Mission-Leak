/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Sets up the chop shop
*/
disableSerialization;
private["_nearVehicles","_shop","_dialog","_vehicleListPrice","_vehicleListStr","_className","_price","_weight","_img","_toolTip","_maxSpeed","_armorRating","_shopArray"];


if([getPos player,25,civilian] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not rob this when another player is so nearby","PLAIN"];};
if([getPos player,25,west] call DS_fnc_nearbyPlayers) exitWith {titleText["You can not rob this when another player is so nearby","PLAIN"];};
_shop = _this select 0;
disableSerialization;
_dialog = findDisplay 666667;
_vehicleList = _dialog displayCtrl 1501;
_nearVehicles = nearestObjects [getPos player,["Car","Truck","Air"],25];
if(count _nearVehicles == 0) exitWith {titleText["There are no vehicles nearby","PLAIN"];};
ctrlShow[66653,false];
ctrlShow[778,false];
ctrlShow[777,false];
ctrlShow[66654,false];

lbClear _vehicleList;

{
	if(alive _x)then
		{
		_className = (typeOf _x);
		_img = getText(configFile >> "CfgVehicles" >> _className >> "picture");
		_name = getText(configFile >> "CfgVehicles" >> _className >> "displayName");
		_vehicleList lbAdd format ["%1",_name];
		_vehicleList lbSetPicture [(lbSize _vehicleList)-1, _img];
		_vehicleList lbSetColor [(lbSize _vehicleList)-1, [0, 1, 0, 0.5]];
		_vehicleList lbSetData [(lbSize _vehicleList)-1,_className];
		};
}forEach _nearVehicles;
