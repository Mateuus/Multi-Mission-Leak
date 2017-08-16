/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Sets up the list in a players garage
*/
disableSerialization;

private["_defaultArray","_temp","_shop","_dialog","_vehicleListPrice","_vehicleListStr","_className","_price","_weight","_img","_toolTip","_maxSpeed","_armorRating","_shopArray","_type","_exit","_vehicleArray","_colourArray","_colour","_upgrades"];
_exit = false;
_shop = _this select 0;
_defaultArray = [];
if(_this select 1)then
	{
	_type = [_this,2,"",[""]] call BIS_fnc_param;
	_pid = (getPlayerUID player);
	_side = (playerside);
	_unit = player;
	if((_pid == "")||(_side == sideUnknown)||(_type == "")||(isNull _unit))exitWith
		{
			if(!isNull _unit) then
			{
				[false,false,false,[]] spawn DS_fnc_setupGarage;
				_exit = true;
			};
		};
	_unit = owner _unit;
	_side = switch(_side) do
	{
		case west:{"cop"};
		case civilian: {"civ"};
		case independent: {"med"};
		default {""};
	};
	if(_side isEqualTo "") exitWith 
		{
		[false,false,false,[]] spawn DS_fnc_setupGarage;
		_exit = true;
		};
	_query = format["SELECT id, side, classname, type, pid, alive, active, plate, color, inventory FROM vehicles WHERE pid='%1' AND alive='1' AND active='0' AND side='%2' AND type='%3'",_pid,_side,_type];
	[[player,_query,0],"HUNT_fnc_returnVehicleList",false,false] spawn DS_fnc_MP; 
	_exit = true;
	};
if(_exit)exitwith{};
_vehicleArray = [_this,3,[],[[]]] call BIS_fnc_param;
disableSerialization;
_dialog = findDisplay 666667;
_vehicleList = _dialog displayCtrl 1501;
waitUntil {!isNull (findDisplay 666667)};
lbClear _vehicleList;
ctrlShow[66653,false];
ctrlShow[778,false];
ctrlShow[777,false];
ctrlShow[66654,false];
if(count(_vehicleArray) == 0)exitWith	
	{
	_vehicleList lbAdd "Your garage is empty";
	_vehicleList lbSetData [(lbSize _vehicleList)-1,""];
	};

{
	_toolTip = "";
	_defaultArray = (_x select 9);
	if(count(_defaultArray) == 5)then
		{
		_defaultArray pushBack 0;
		_defaultArray pushBack 0;
		_defaultArray pushBack 0;
		_defaultArray pushBack 0;
		_defaultArray pushBack 0;
		};
	if(((_defaultArray)select 0) isEqualTo 1)then{_toolTip = _toolTip + "| Capacity Upgrade |"};
	if(((_defaultArray)select 0) isEqualTo 2)then{_toolTip = _toolTip + "| Super Capacity Upgrade |"};
	if(((_defaultArray)select 1) isEqualTo 1)then{_toolTip = _toolTip + "| Fuel Consumption Upgrade |"};
	if(((_defaultArray)select 1) isEqualTo 2)then{_toolTip = _toolTip + "| Super Fuel Consumption Upgrade |"};
	if(((_defaultArray)select 2) isEqualTo 1)then{_toolTip = _toolTip + "| Security Upgrade |"};
	if(((_defaultArray)select 2) isEqualTo 2)then{_toolTip = _toolTip + "| Super Security Upgrade |"};
	if(((_defaultArray)select 3) isEqualTo 1)then{_toolTip = _toolTip + "| Thermal Enabled |"};
	if(((_defaultArray)select 3) isEqualTo 2)then{_toolTip = _toolTip + "| Thermal Enabled | BulletProof Body |"};
	if(((_defaultArray)select 4) > 0)then{_toolTip = _toolTip + "| Insured |"};
	if(((_defaultArray)select 5) > 0)then{_toolTip = _toolTip + format ["| Airbags X%1 |",((_defaultArray select 5)/2)];};
	if(((_defaultArray)select 6) > 0)then{_toolTip = _toolTip + "| Extra Ammo |";};
	if(((_defaultArray)select 7) isEqualTo 1)then{_toolTip = _toolTip + "| Animal Sensor System |";};
	if(_toolTip isEqualTo "")then{_toolTip = "No upgrades on this vehicle"};
	_className = (_x select 2);
	_colourArray = [_className,false,playerside] call DS_fnc_vehicleTextures;
	if(_colourArray isEqualTo [])then
		{
		_colour = "";
		}
		else
		{
		if((_x select 8) > 99)then
			{
			_colour = "Repainted";
			}
			else
			{
			_colour = _colourArray select (_x select 8);
			};
		};
	_img = getText(configFile >> "CfgVehicles" >> _className >> "picture");
	_name = getText(configFile >> "CfgVehicles" >> _className >> "displayName");
	_vehicleList lbAdd format ["%1  %2",_colour,_name];
	_vehicleList lbSetTooltip [(lbSize _vehicleList)-1, _toolTip];
	_vehicleList lbSetPicture [(lbSize _vehicleList)-1, _img];
	_vehicleList lbSetColor [(lbSize _vehicleList)-1, [0, 1, 0, 0.5]];
	_tmp = [_x select 2,_x select 8];
	_tmp = str(_tmp);
	_vehicleList lbSetData [(lbSize _vehicleList)-1,_tmp];
	_vehicleList lbSetValue [(lbSize _vehicleList)-1,_x select 0];
}forEach _vehicleArray;
