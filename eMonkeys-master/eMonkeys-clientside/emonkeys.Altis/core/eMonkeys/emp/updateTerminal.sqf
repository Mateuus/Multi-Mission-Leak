/* 
EMP VEHICLE SCRIPT
File: updateTerminal.sqf
Author: DemoCore
Date: 2014.05.05
Version: 1.01
*/

_listControl = _this select 0;
_vehicle = _this select 1;
while{dialog} do
{
	lbClear _listControl;
	//init dialog (fill Listbox)
	gottenVehicles = [];
	_listBoxIndex = 0;
	{
		//checken ob anderes Fahrzeug in reichweite ist.
		_distance = _vehicle distance _x;
		if((_distance <= empDistance) and !(_x == _vehicle)) then
		{
			//Fahrzeug in die Liste adden
			_vehicPic = getText (configFile >> "cfgVehicles" >> typeOf _x >> "picture");
			_vehicName = getText(configFile >> "cfgVehicles" >> typeOf _x >> "DisplayName");
			_realName = name _x;
			if(_realName == "Error: No unit") then
			{
				_realname = "Unbesetzt";
			};
			if(_vehicPic != "pictureThing") then
			{
				_index = lbAdd [_listControl, format ["%1 - %2m", _vehicName, round(_distance)]];
				lbSetPicture[_listControl, _listBoxIndex, _vehicPic];
				_listBoxIndex = _listBoxIndex + 1;
				gottenVehicles = gottenVehicles + [_x];
			};
		};
	}
	foreach vehicles;
	
	uisleep waitTimeUpdateEmpList;
};