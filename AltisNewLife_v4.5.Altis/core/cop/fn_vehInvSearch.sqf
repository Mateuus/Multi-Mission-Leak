#include <macro.h>
private["_vehicle","_vehicleInfo","_value","_illegalValue"];
_vehicle = cursorTarget;
_list = ["Air","Ship","LandVehicle"];
if(isNull _vehicle OR {!(KINDOF_ARRAY(_vehicle,_list))}) exitWith {};
_vehicleInfo = _vehicle GVAR ["Trunk",[]];
if(count _vehicleInfo == 0) exitWith {hint "Ce vehicule est vide"};
_value = 0;
_illegalValue = 0;
{
	_var = SEL(_x,0);
	_val = SEL(_x,1);
	_illegalItemVar = M_CONFIG(getText,"ANL_VItems",_var,"variable");
	_illegalPrice = M_CONFIG(getNumber,"ANL_VItems",_var,"sellPrice");
	_isIllegalItem = M_CONFIG(getNumber,"ANL_VItems",_var,"illegal");
	if(_isIllegalItem == 1 ) then{
		_illegalValue = _illegalValue + (round(_val * _illegalPrice / 2));
	};
} foreach (SEL(_vehicleInfo,0));
_value = _illegalValue;
if(_value > 0) then
{
	[[0,format["Ce vehicule était recherché et contenait pour %1€ en drogue et marchandises illégales.",[_value] call life_fnc_numberText]],"life_fnc_broadcast",true,false] call life_fnc_MP;
	compte_banque = compte_banque + _value;
	_vehicle SVAR["Trunk",[],true];
}
	else
{
	if (!isNull _vehicle) then {
		closeDialog 0;
		uiSleep 0.01;
		[_vehicle] call life_fnc_openInventory;
		hint "Forcer l'ouverture du véhicule";
	} else {
		hint "Le coffre doit etre coincé..";
	};
};