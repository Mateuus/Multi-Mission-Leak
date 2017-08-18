_query = "SELECT list FROM zones WHERE id = '1'";

_queryResult = [_query,2] call DB_fnc_asyncCall;
life_capture_list = _queryResult select 0;
publicVariable "life_capture_list";
{
if((life_capture_list select _x) select 2 >= 0.99) then {
	_string = (life_capture_list select _x) select 0;
	_marker = format["capture_label_%1",(_x + 1)];
	_marker setMarkerText format["%1 - %2",(life_capture_list select _x) select 1,_string];
};
} forEach [0,1,2,3];
KBW_fnc_handleCapture = {
	while{count list (_this select 0) > 0} do {
		_point = _this select 1;
		_groupsArr = [];
		uiSleep 25;
		_units = list (_this select 0); //Total units inside the zone
		_nonUnits = [];
		{if(!isPlayer _x || (((group _x) getVariable["gang_name",""]) == "") || (_x getVariable["zipTie",false]) || ((primaryWeapon _x == "") && (handgunWeapon _x == ""))) then {_nonUnits pushBack _x};} forEach _units; //Remove non-units and non-gang players
		_units = _units - _nonUnits;
		if(count _units == 0) exitWith {};
		//begin gathering information on different groups in the zone
		while {count _units > 0} do {
			_GroupName = (group (_units select 0)) getVariable["gang_name",""];
			if(_GroupName != "") then {
			_Groupunits = units (_units select 0);
			_GroupCount = count _Groupunits;
			_units = _units - _Groupunits;
			_groupsArr pushBack [_GroupName,_GroupCount];
			};
		};
		highest = ((_groupsArr select 0) select 0);
		_highNum = ((_groupsArr select 0) select 1);
		for [{_x=0},{_x < count _groupsArr},{_x=_x+1}] do
		{
			if((_groupsArr select _x) select 1 > _highNum) then {
				highest = ((_groupsArr select _x) select 0);
				_highNum = ((_groupsArr select _x) select 1);
			};
		};
		{if(_highNum == (_x select 1) && highest != (_x select 0)) exitWith {highest = "";};} forEach _groupsArr; //Check that 2 groups didn't tie in units
		
		if(highest != "") then {
			toModify = life_capture_list select _point;
			if((toModify) select 0 == "Contested") then {
				toModify set[0,highest];
				toModify set[2,0.05];
			} else {
				if((highest == (toModify select 0)) && !((toModify select 2) >= 0.99)) then {
					toModify set[2,((toModify select 2) + 0.05)];
					if((toModify select 2) >= 0.99) then {
						toModify set[2,1];
						_winners = [];
						{if(group _x getVariable["gang_name",""] == (toModify select 0)) then {_winners pushBack _x}} forEach playableUnits;
						{[[toModify select 1,true],"life_fnc_capNotice",_x,false] spawn life_fnc_MP} forEach _winners;
						[[0,format["The gang known as %1 has successfully captured the %2!",(toModify select 0),(toModify select 1)]],"life_fnc_broadcast",true] spawn life_fnc_MP;
					};
				} else {
					if(highest != (toModify select 0) && !((toModify select 2) <= 0.01)) then {
						toModify set[2,((toModify select 2) - 0.05)];
						_group = grpNull;
						{if((toModify select 0) == (_x getVariable["gang_name",""])) exitWith {_group = _x}} forEach allGroups;
						if(!isNull _group) then { {[[toModify select 1,false,highest],"life_fnc_capNotice",_x,false] spawn life_fnc_MP;} forEach (units _group); };
					};
				};
			};
			if(toModify select 2 <= 0.01) then {toModify set[0,"Contested"]; toModify set[2,0]};
			life_capture_list set[_point,toModify];
			publicVariable "life_capture_list";
			[] spawn {
				_query = format["UPDATE zones SET list='%1' WHERE id='1'",life_capture_list];
				[_query,1] call DB_fnc_asyncCall;
			};
			{if(isPlayer _x) then {[nil,"life_fnc_updateCaptureUI",_x,false] spawn life_fnc_MP};} forEach (list(_this select 0));
		};
		_marker = format["capture_label_%1",(_point + 1)];
		_string = "";
		if(((life_capture_list select _point) select 2) >= 0.99) then {
			_string = (life_capture_list select _point) select 0;
		} else {
			_string = "Contested";
		};
		_name = switch((life_capture_list select _point) select 1) do {
			case "Arms Dealer": {format["Arms Dealer - %1",_string]};
			case "Cocaine Cartel": {format["Cocaine Cartel - %1",_string]};
			case "Meth Cartel": {format["Meth Cartel - %1",_string]};
			case "Heroin Cartel": {format["Heroin Cartel - %1",_string]};
		};
		_marker setMarkerText format["%1",_name];
	};
};
capturePoints = [capture_1,capture_2,capture_3,capture_4];
_exit = false;
_point = capture_1;
_pointNum = 0;
while{true} do 
{
	while{true} do {
		uiSleep 1; 
		{if(count (list _x) > 0) exitWith {
			_exit = true; 
			_point = _x; 
			_pointNum = switch(_point) do {
				case capture_1: {0};
				case capture_2: {1};
				case capture_3: {2};
				case capture_4: {3};
			};
		;};} forEach capturePoints; 
		if(_exit) exitWith {_exit = false;};
	};
	capturePoints = capturePoints - [_point];
	[_point,_pointNum] spawn {
		_handle = [_this select 0,_this select 1] spawn KBW_fnc_handleCapture;
		waitUntil{uiSleep 1; scriptDone _handle};
		capturePoints pushBack (_this select 0);
	};
};