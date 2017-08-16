/*
*
* Open house inventory, executed by PIPELINE
*
*/

private ["_house_name", "_display", "_house_data", "_house_args", "_exdata", "_canview", "_house_price", "_house_price_sell",
"_house_current_inv", "_item", "_count", "_index"];

_house_name = _this select 0; //Select argument
_house_args = _this select 1;
_house_data = _this select 2;

eM_action_inUse = false; //done
EMonkeys_house_current_inv_running = false;

hint "Items synchronisiert."

