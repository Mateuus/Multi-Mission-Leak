/*
*
* After tired buying a house
*
*/

private ["_house_name", "_house_data", "_house_args", "_datawritten", "_price"];

_house_name = _this select 0; //Select argument
_house_args = _this select 1;
_return = _this select 2;

/*_return = call compile format["%1", _return]; //compile data

//TODO
_datawritten = (((_return select 0) select 0) select 0) == "1";*/

_datawritten = _return;

_price = _house_args select 0; //for refund

if(_datawritten) then
{
	hint "Haus wurde erfolgreich verkauft.";
	[[0,format["%1 hat sein Haus verkauft.", name player]],"EMonkeys_fnc_broadcast",true,false] call EMonkeys_fnc_mp;

}
else
{
	hint "Haus konnte nicht verkauft werden.";
	
	uisleep 2;
	
	hint "Geld wird zurückgezogen.";
	
	EMonkeys_a164 = EMonkeys_a164 - _price;
	uisleep 10;
	[1] call SOCK_fnc_updatePartial; //update money
};

//hint (((_return select 0) select 0) select 0);


