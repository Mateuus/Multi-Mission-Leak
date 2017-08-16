scriptName "fn_saveTuningToDB";
/*--------------------------------------------------------------------
	Author: Maverick (ofpectag: MAV)
    File: fn_saveTuningToDB.sqf

	<Maverick Applications>
    Written by Maverick Applications (www.maverick-apps.de)
    You're not allowed to use this file without permission from the author!
--------------------------------------------------------------------*/
#define __filename "fn_saveTuningToDB.sqf"

_vehicleID = param[0,-1,[-1]];
_data = param[1,[],[[]]];
if (_vehicleID == -1) exitWith {};
if (!isServer && hasInterface) exitWith {};
if (count _data == 0) exitWith {};
_dataString = [true,str _data] call mav_tuning_fnc_tuning_prepareString;

_query = format["UPDATE vehicles SET tuning_data='%2' WHERE id='%1';",_vehicleID, _dataString];
[_query,1] call DB_fnc_asyncCall;