/*

	file: fn_smartphone.sqf
	Author: Silex
	
*/
private["_display","_units","_type","_data","_rowData","_msg"];

_type = [ _this, 0, 0, [0]         ] call BIS_fnc_param;
_data = [ _this, 1, 0, ["", [], 0] ] call BIS_fnc_param;

disableSerialization;
waitUntil {!isNull findDisplay 88888};
_display = findDisplay 88888;
_cPlayerList = _display displayCtrl 88881;
_cMessageList = _display displayCtrl 88882;
_cMessageHeader = _display displayCtrl 88886;
_cMessageHeader ctrlSetText format["Von:                 Nachricht:"];
ctrlEnable[887892,false];

switch(_type) do {
	case 0: {
		lbClear _cPlayerList;
		{
			if( alive _x && _x != player ) then {
				switch(side _x) do {
					case west: {_type = "Cop"};
					case civilian: {_type = "Civ"};
					case independent: {_type = "Med"};
					case east: {_type = "THW"};
				};
				_cPlayerList lbAdd format["%1 (%2)",_x getVariable["realName", name _x],_type];
				_cPlayerList lbSetData [(lbSize _cPlayerList)-1,str(_x)];
			};
		} forEach playableUnits;
		
		[getPlayerUID player, player] remoteExec ["XYDB_fnc_msgRequest", XYDB];
		ctrlEnable[887892,false];
	};
	case 1: {
        {
            _msg = [_x select 2, 40] call KRON_StrLeft;
            _rowData = [ _x select 0, _x select 1, _x select 2, _x select 3 ];
            _cMessageList lnbAddRow[ _x select 3, format["%1 ...",_msg] ];
            _cMessageList lnbSetData[ [((lnbSize _cMessageList) select 0)-1,0],str(_rowData) ];
        } forEach _data;
	};
	case 2: {
		ctrlEnable[887892,true];
		_target = lbData[88881,(lbCurSel 88881)];
		XY_smartphoneTarget = call compile format["%1",_target];
	};	
	case 4: {
		createDialog "XY_dialog_smartphoneWrite";
		ctrlSetText[88886, format["Nachricht an: %1",name XY_smartphoneTarget]];
		if( XY_adminLevel < 1 ) then {
			ctrlShow[888897,false];
		};
	};
};