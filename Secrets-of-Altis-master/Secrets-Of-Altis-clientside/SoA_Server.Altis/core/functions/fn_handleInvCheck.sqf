private["_item","_menge"];
_item = _this select 0;
_menge = _this select 1;

if([true,_item,_menge] call life_fnc_handleinv) then {
	[_item] spawn life_fnc_gegenstanderhalten;
} else {
	[2,_item,_menge,"AltisPost GmbH"] call life_fnc_mailbox;
};