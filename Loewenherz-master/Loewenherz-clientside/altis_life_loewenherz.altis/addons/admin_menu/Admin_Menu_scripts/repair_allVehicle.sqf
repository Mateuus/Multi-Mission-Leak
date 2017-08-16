{
	_vehicle = _x;
	_vehicle setDamage 0;
	_vehicle setVehicleAmmo 1;
	_vehicle setFuel 1;

	_vehicle setVectorUp [0,0,1];
	_vehicle setvelocity [0,0,1];


	cutText [format["%1 repaired",_x], "PLAIN DOWN"];

} forEach vehicles;

hint "REPAIRED ALL VEHICLE";
cutText [format["REPAIRED ALL VEHICLE"], "PLAIN DOWN"];
[["admin",(format["%1 with UID %2 repairs all Vehicles on the Server",name player,getPlayerUID player])],"TON_fnc_externLog",false,false] call lhm_fnc_mp;