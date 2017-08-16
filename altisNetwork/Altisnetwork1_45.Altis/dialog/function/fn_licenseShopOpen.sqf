#include "..\..\script_macros.hpp"

private["_available","_side","_list","_displayName","_price"];
disableSerialization;
createDialog 'LicenseShop';
_side = switch(playerSide) do 
{
    case west:{"cop"}; 
    case civilian:{"civ"}; 
    case independent:{"med"};
};
_available = _this select 3;

_list = CONTROL(15000,15001);

//-- 15000: LicenseShop
//-- 15001: life_fnc_buyLicense

{
	_cfg = _x;
	_license = LICENSE_VALUE(_cfg,_side);
	if (!_license) then {

        _displayName = M_CONFIG(getText,"Licenses",_type,"displayName");
        _price = M_CONFIG(getNumber,"Licenses",_type,"price");
        _list lbAdd format["%1",localize _displayName];
		_list lbSetData[(lbSize _list)-1,_cfg];
		_list lbSetValue[(lbSize _list)-1,_price];

	};
}forEach _available;

CONTROL(15000,15003) ctrlEnable false;