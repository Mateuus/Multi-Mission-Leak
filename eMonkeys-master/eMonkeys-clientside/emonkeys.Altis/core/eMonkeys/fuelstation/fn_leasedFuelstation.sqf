/*
	Author: DerOnkel & Williams
	Avanix Gaming Community | E-Monkeys.com
	The usage of this file is restricted to Avanix-Gaming.de & E-Monkeys.com
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
	
	Description:
	Leased the Fuelstation (Originalscript buyHouse.sqf by Bryan "Tonic" Boardwine)
*/
private["_fuelstation","_fuelstationOwner","_leasingtime","_action","_fuelstationCfg"];
_id = _this select 0;
_price = _this select 1;

[[getPlayerUID player,_id],"TON_fnc_addFuelstation",false,false] spawn EMonkeys_fnc_MP;

EMonkeys_a164 = EMonkeys_a164 - _price;
["1"] call SOCK_fnc_syncData;
format["fuelstation_%1",_id] setMarkerColorLocal "ColorYellow";
