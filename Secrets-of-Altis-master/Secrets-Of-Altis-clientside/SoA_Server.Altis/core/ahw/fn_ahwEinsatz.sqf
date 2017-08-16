/*
	File: fn_adacEinsatz.sqf
	
	Description: Zeigt einen Marker auf der Map an.

*/
private["_marker","_nameCaller","_playerPos","_vehicle","_id"];

_mode = _this select 3;

["MedicalRequestEmerg",["Neuer Notruf in der Einsatzzentrale eingegangen!"]] call BIS_fnc_showNotification;

switch(_mode) do {
		
	case "mechaniker": {

		_playerPos = _this select 0;
		_vehicle = _this select 1;
		_nameCaller = _this select 2;
		_id = _this select 4;

		_marker = createMarkerLocal [format["AHWMark%1",_id],(getPos _playerPos)];
		_marker setMarkerColorLocal "ColorYellow";
		_marker setMarkerTextLocal format[" %1 (%2)",_nameCaller,_vehicle];
		_marker setMarkerTypeLocal "mil_warning";
		_marker setMarkerSizeLocal [1,1];
	};

	case "notdienst": {

		_playerPos = _this select 0;
		_nameCaller = _this select 1;
		_id = _this select 4;	

		_marker = createMarkerLocal [format["AHWMark%1",_id],(getPos _playerPos)];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTextLocal format[" %1",_nameCaller];
		_marker setMarkerTypeLocal "loc_Hospital";
		_marker setMarkerSizeLocal [1,1];
	};
};