private["_display","_ret","_text","_unit","_prim","_sec","_vest","_uni","_bp","_attach","_tmp","_gang","_totalHours","_totalMinutes"];
_ret = _this;
disableSerialization;
_display = findDisplay 2900;
_text = _display displayCtrl 1000;
_unit = _ret select 3;
_prim = "";
_gang = (group _unit) getVariable ["gangName","Not in a Gang"];
_totalMinutes = ((_ret select 5)select 0);
_totalMinutes = _totalMinutes + ((_ret select 5)select 1);
_totalMinutes = _totalMinutes + ((_ret select 5)select 2);
_totalHours = (floor(_totalMinutes/60));
_totalMinutes = _totalMinutes - (_totalHours*60);
if(primaryWeapon _unit == "")then{_prim = "None"}else{_prim = primaryWeapon _unit};
if(_prim != "")then
	{
	_temp = configFile >> "CfgWeapons" >> _prim;
	_prim = getText(_temp >> "displayName");
	};

_attach = [];
if(primaryWeapon _unit != "") then
{
	{
		if(_x != "") then
		{
			_tmp = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
			_attach set[count _attach,_tmp];
		};
	} foreach (primaryWeaponItems _unit);
};

if(count _attach == 0) then {_attach = "None"};
_text ctrlSetStructuredText parseText format["Name: %1<br/>Bank: %2<br/>Money: %3<br/>Breaking NLR?: %4<br/>Gang: %5<br/>Total Time: %6h %8m<br/>Weapon: %7",
_unit getVariable["name",name _unit],[_ret select 0] call DS_fnc_numberText,[_ret select 1] call DS_fnc_numberText,(_ret select 4),_gang,_totalHours,_prim,_totalMinutes];