/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Checks target's licenses
*/

private["_cop","_amount","_val","_player","_inventory","_hasMoneyBags","_hasSpyDocs","_drunk"];
_cop = [_this,0,Objnull,[objNull]] call BIS_fnc_param;
if(isNull _cop) exitWith {};
_inventory = "";
_amount = 0;
_player = player;
_hasMoneyBags = false;
_hasSpyDocs = false;
_drunk = DS_drunk;
if(_drunk == 0)then{_drunk = false}else{_drunk = true};

if(DS_item_spyDocs > 0) then {_hasSpyDocs = true};
if((DS_item_goldBar > 0)||(DS_item_goldBarMedium > 0)||(DS_item_goldBarLarge > 0)) then {_hasMoneyBags = true};

{
	_str = [_x] call DS_fnc_itemStringConfig;
	_val = missionNameSpace getVariable (format ["DS_item_%1",_x]);
	if(_val > 0) then
		{
		if(_x in DS_illegalItemsArray)then
			{
			_inventory = _inventory + format ["%1x %2\n",_val,_str];
			_amount = _amount + ((_val)*500);
			};
		};
} foreach DS_itemArray;

sleep 1;

[player,_inventory,_hasSpyDocs,_hasMoneyBags,_drunk] remoteExec ["DS_cop_searchResults",_cop];