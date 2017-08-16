private ["_item","_index","_objet"];
_item = cursorTarget;
if (isNull _item) then
{
	_item = [_this,3,ObjNull,[ObjNull]] call BIS_fnc_param;
	if (isNull _item) exitWith {};
};
_index = [typeOf _item, ANL_objet] call TON_fnc_index;
if (_index < 0) exitWith {hint "Cet objet ne peut pas etre pris."};
if (isNull (_item getVariable ["owner",objNull])) exitWith { hint "Cet objet n'a pas ete pose par un joueur et ne peut pas etre ramasse." };
_objet = ANL_objet select _index;
if (!([true,_objet select 0,1] call life_fnc_handleInv)) exitWith { hint format["Vous n'avez pas assez de place dans votre inventaire pour %1.", _objet select 2] };
hint format["Vous avez pris %1.", _objet select 2];
deleteVehicle _item;