#include "..\..\macros.hpp"
private["_display","_listbox","_shortname","_longname","_price","_hasLicense","_displayname","_sideFlag","_varName"];
 
if(!DWEV_persoReady) exitWith {
	hint "Wir brauchen zur Übergabe der Lizenz deinen Ausweis, da wir dich sonst nicht in unseren System hinterlegen können. Bitte begib dich zum Einwohnermeldeamt und beantrage deinen Personalausweis! Danach kannst du es gerne noch einmal versuchen!"; 
};

_buyables = _this select 3; //called from action => select 3rd argument
 
 
 DWEV_license_shop_buyables = _buyables;
 
 
if(!dialog) then
{
if(!(createDialog "LicenseShop")) exitWith {};
};
disableSerialization;
 
_display = findDisplay 5546;
if(isNull _display) exitWith {};
_listbox = _display displayCtrl 55126;
_mylic = _display displayCtrl 55131;
_struct = "";
 
{
	_shortname = _x;
	_sideFlag = M_CONFIG(getText,"Licenses",_shortname,"var");
	_varName = LICENSE_VARNAME(_shortname,_sideFlag);
	_displayName = M_CONFIG(getText,"Licenses",_shortname,"displayName");
	_price = M_CONFIG(getNumber,"Licenses",_shortname,"price");
	_hasLicense = missionNamespace getVariable _varName;
	if !(isNil "_hasLicense") then 
	{
		if(!_hasLicense) then
		{
			_listbox lbAdd format["%1 (%2€)", _displayname, [_price] call DWEV_fnc_numberText];
			_listbox lbSetData [(lbSize _listbox) - 1, _shortname];
		};
	};
	
}count _buyables;

{
		_var = configName(_x);
		_val = LICENSE_VALUE(_var,"c");
		if (_val) then
		{
			_price = 0;
			_displayName = M_CONFIG(getText,"Licenses",_var,"displayName");
			_price = M_CONFIG(getNumber,"Licenses",_var,"price");
			if (typeName _price == "SCALAR") then {_price = (_price / 2);};
			
			_mylic lbAdd format["%1 (%2€)", _displayname, [_price] call DWEV_fnc_numberText];
			_mylic lbSetData [(lbSize _mylic) - 1, _var];
		};
	
} count (format ["getText(_x >> 'side') isEqualTo '%1'","civ"] configClasses (missionConfigFile >> "Licenses"));

[6] call SOCK_fnc_updatePartial;
[2] call SOCK_fnc_updatePartial;