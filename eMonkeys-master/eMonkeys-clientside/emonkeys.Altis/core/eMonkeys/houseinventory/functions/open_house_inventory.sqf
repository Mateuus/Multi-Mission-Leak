/**
* houseMenu [*,*,*,HOUSE_NAME]
* Calls house menu  EXEC
*/

private["_house_name"];

_house_name = _this select 0;

["EMonkeys_fnc_open_house_inventory", _house_name, []] call EMonkeys_fnc_houseRequestCommand;
