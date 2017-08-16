/*
*	[ID, OWNER, PRICE, GROUP, NAME, MARKER_SPAWN, MARKER_CAR_SPAWN, INVENTORY, OWNED] houseExtractData ( STRING _data)
*
*/

private ["_id","_owner","_price","_group","_name","_marker_spawn","_marker_car_spawn","_inventory","_owned","_price_sell","_data","_arr","_inventory_weight", "_ret", "_ownername","_safe_upgrade","_inventory_maxweight","_safe_inventory","_trustedpersons","_buyable","_VIP"];

_data = _this select 0;




_id = parseNumber (_data select 0);
_owner = _data select 1;
_price = parseNumber (_data select 2);
_group = _data select 3;
_name = _data select 4;

_marker_spawn = _data select 5;
_marker_car_spawn = _data select 6;


_inventory = _data select 7;



if(((_data select 8)) == "True" || (_data select 8) == "1") then
{
	_owned = true;
}
else
{
	_owned = false;
};


_price_sell = parseNumber (_data select 9);
_inventory_weight = parseNumber (_data select 10);



_ownername = _data select 11;

_inventory_maxweight = parseNumber (_data select 12);


_safe_upgrade = (_data select 13) == "True" || (_data select 13) == "1";

_safe_inventory = _data select 14;
_safe_inventory = call compile format["%1", _safe_inventory]; 
if(isNil "_safe_inventory") then { _safe_inventory = []; hint "Safe konnte nicht geladen werden.";};



_trustedpersons = _data select 15;
_trustedpersons = call compile format["%1", _trustedpersons]; 

if(isNil("_trustedpersons")) then
{
  _trustedpersons = [];
};


_buyable = (((_data select 16)) == "True" || (_data select 16) == "1");


_VIP = (((_data select 17)) == "True" || (_data select 17) == "1");

_ret = [_id,_owner,_price,_group,_name,_marker_spawn,_marker_car_spawn,_inventory,_owned,_price_sell,_inventory_weight,_ownername,_inventory_maxweight,_safe_upgrade,_safe_inventory,_trustedpersons,_buyable,_VIP];



EMonkeys_housetest = [_id,_owner,_price,_group,_name,_marker_spawn,_marker_car_spawn,_inventory,_owned,_price_sell,_inventory_weight,_ownername,_inventory_maxweight,_safe_upgrade,_safe_inventory,_trustedpersons,_buyable,_VIP];
_ret;

