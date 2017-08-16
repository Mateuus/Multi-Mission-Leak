/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Checks targets licenses
*/

private["_cop","_amount","_val","_player","_inventory","_hasbar","_hasdoc","_drunk"];
_cop = [_this,0,Objnull,[objNull]] call BIS_fnc_param;

if(isNull _cop) exitWith {};
_inventory = "";
_amount = 0;
_player = player;
_hasbar = false;
_hasdoc = false;
_drunk = DS_drunk;
if(_drunk == 0)then{_drunk = false}else{_drunk = true};

if(DS_item_spyDocs > 0) then {_hasdoc = true};
if(DS_item_goldbar > 0) then {_hasbar = true};

{
	_str = [_x] call DS_fnc_itemStringConfig;
	//_shrt = [_x,1] call life_fnc_varHandle;
	_val = missionNameSpace getVariable _x;
	if(_val > 0) then
	{
		if(_x in DS_illegalItemsArray)then
		{
		_inventory = _inventory + format ["%1x $%2<br/>",_val,_str];	
		_amount = _amount + ((_val)*500);
		};
	};
} foreach DS_itemArray;

sleep 1;

[[player,_inventory,_hasdoc,_hasbar,_drunk],"DS_cop_searchResults",_cop,false] spawn BIS_fnc_MP;