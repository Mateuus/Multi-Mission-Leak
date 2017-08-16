/*
	File: fn_playerTags.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Adds the tags above other players heads when close and have visible range.
*/
scopeName "main";
["playerTags", "onEachFrame", 
{
	private["_vis","_pos","_near","_name","_icon","_width","_height","_gang"];

	if (life_adminXray == 1) then {
		{
			if (isPlayer _x) then {
				 _pos = visiblePosition _x;
				 _pos set[2,(getPosATL _x select 2) + 2.2];
				 _name = name _x;
				drawIcon3D ["",[1,1,1,1],_pos,0,0,0,_name,0,0.04];
			};
		} forEach allUnits;
		breakTo "main";
	};

    _near = getPos player nearEntities [["Man","Car","Air","Ship"],10];
    {
		if(!(_x isKindOf "Man")) then 
		{
			_smallIcon = ["B_G_Van_01_fuel_F","C_Van_01_fuel_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_SUV_01_F","C_Van_01_transport_F","B_G_Van_01_transport_F","C_Van_01_box_F","C_Boat_Civil_01_F","C_Boat_Civil_01_police_F","C_Boat_Civil_01_rescue_F","I_SDV_01_F","O_SDV_01_F","B_SDV_01_F"];
			_icon = getText (configFile >> "CfgVehicles" >> typeOf _x >> "picture");
			if (surfaceIsWater (position _x)) then 
					{
						_pos = visiblePositionASL _x;
						_pos set[2,(getPosASL _x select 2) + 2.2];
					} else
					{
						_pos = visiblePosition _x;
						_pos set[2,(getPosATL _x select 2) + 2.2];
					};
			if((typeOf _x) in _smallIcon) then {_width = 1} else {_width = 2};
			_height = 1;
			_color = [1,1,1,0.7];
			_name = "";
			_crew = crew _x;
			if (count _crew > 0 && vehicle player != _x) then
			{
				for "_i" from 0 to (count _crew - 1) do {
					if ((_crew select _i getVariable ["gang","0"]) in life_gang_wars || (_crew select _i getVariable ["aggressive",-300]) > (time - 300)) exitWith { _color = [1,0,0,1]; };
				};
				{
					if(alive _x) then {
						_index = [group _x,life_group_list] call life_fnc_index;
						_gang = if(_index > -1) then {(life_group_list select _index) select 0} else {_x getVariable["gangName",""]};
						_setTag = group _x getVariable["gangTag",""];
						_gangTag = if(_gang == "" && _setTag == "") then {""} else {
							if(_setTag != "") exitWith {_setTag};
							_length = [_gang] call KRON_StrLen;
							_select = false;
							_firstLetter = _gang select [0,1];
							for "_i" from 1 to (_length-1) do {
								_character = _gang select [_i,1];
								if(_select) then {_firstLetter = _firstLetter + _character; _select = false} else {
									if(_character == " ") then {_select = true};
								};	
							};
							_tagLength = [_firstLetter] call KRON_StrLen;
							if(_tagLength == 1) then {_firstLetter = _firstLetter + (_gang select[_length - 1,1])};
							if(_firstLetter == "APD") then {_firstLetter = ""};
							_firstLetter;
						};
						_gname = if(_gangTag != "") then {format["[%1] %2",_gangTag,name _x]} else {name _x};
						_extra = if(_forEachIndex > 0) then {", "} else {""};
						_name = _name + _extra + _gname;
					};
				} forEach _crew;
				drawIcon3D [_icon,_color,_pos,_width,_height,0,_name,0,0.04];
			};
			
		}
		else 
		{
		
			_hidden = ((goggles _x) in ["G_Balaclava_blk","G_Balaclava_combat","G_Balaclava_lowprofile","G_Balaclava_oli","G_Bandanna_aviator","G_Bandanna_beast","G_Bandanna_blk","G_Bandanna_khk","G_Bandanna_oli","G_Bandanna_shades","G_Bandanna_sport","G_Bandanna_tan"]);
			_distance = 15;
			if (_hidden) then { _distance = 3; };
			if((player distance _x) < _distance && isPlayer _x && _x != player && !(_x getVariable["isInvisible",false])) then
			{
				_vis = lineIntersects [eyePos player, eyePos _x,player, _x];
				if(!_vis) then
				{
					_icon = "";
					if (surfaceIsWater (position _x)) then 
					{
						_pos = visiblePositionASL _x;
						_pos set[2,(getPosASL _x select 2) + 2.2];
					} else
					{
						_pos = visiblePosition _x;
						_pos set[2,(getPosATL _x select 2) + 2.2];
					};
					_width = 0.85;
					_height = 0.85;
					_color = [1,1,1,0.7];
					if (!alive _x ) then { _color = [1,0.1,0,1]; };
					if ((_x getVariable ["gang","0"]) in life_gang_wars || (_x getVariable ["aggressive",-300]) > (time - 300)) then { _color = [1,0,0,1]; };
					switch (_x getVariable["copLevel", 0]) do
					{
						case (1) : {_name = format["Police Cadet %1", name _x];_icon = [0,"texture"] call BIS_fnc_rankParams;};
						case (2) : {_name = format["Police Constable %1", name _x];_icon = MISSION_ROOT + "icons\pfc_gs.paa";};
						case (3) : {_name = format["Police Corporal %1", name _x];_icon = [1,"texture"] call BIS_fnc_rankParams;};
						case (4) : {_name = format["Police Sergeant %1", name _x];_icon = [2,"texture"] call BIS_fnc_rankParams;};
						case (5) : {_name = format["Police Lieutenant %1", name _x];_icon = [3,"texture"] call BIS_fnc_rankParams;};
						case (6) : {_name = format["Police Captain %1", name _x];_icon = [4,"texture"] call BIS_fnc_rankParams;};
						default {
							_index = [group _x,life_group_list] call life_fnc_index;
							_gang = if(_index > -1) then {(life_group_list select _index) select 0} else {_x getVariable["gangName",""]};
							_setTag = group _x getVariable["gangTag",""];
							_gangTag = if(_gang == "" && _setTag == "") then {""} else {
								if(_setTag != "") exitWith {_setTag};
								_length = [_gang] call KRON_StrLen;
								_select = false;
								_firstLetter = _gang select [0,1];
								for "_i" from 1 to (_length-1) do {
									_character = _gang select [_i,1];
									if(_select) then {_firstLetter = _firstLetter + _character; _select = false} else {
										if(_character == " ") then {_select = true};
									};
								};
								_tagLength = [_firstLetter] call KRON_StrLen;
								if(_tagLength == 1) then {_firstLetter = _firstLetter + (_gang select[_length - 1,1])};
								if(_firstLetter == "APD") then {_firstLetter = ""};
								_firstLetter;
							};
							_name = if(_gangTag != "") then {format["[%1] %2",_gangTag,name _x]} else {name _x};
							_width = 0;
							_height = 0;
							_gang = _x getVariable["gangName",""];
							if (_gang != "") then {
								_pos2 = +_pos;
								_pos2 set[2,(getPosATL _x select 2) + 2];
								drawIcon3D ["",_color,_pos2,_width,_height,0,format["[%1]", _gang],0,0.02];
							};
						};
					};
					
					if (_x getVariable["activeBounty", false] && side _x == civilian) then
					{
						_width = 0.85;
						_height = 0.85;
						_icon = MISSION_ROOT + "icons\police.paa";
					} else {

					if (getPlayerUID _x == (life_configuration select 0)) then
					{
						_width = 1;
						_height = 1;
						_icon = MISSION_ROOT + "icons\govern.paa";
					};
					};
					if (_x getVariable ["life_title",""] != "") then
					{
						_title = _x getVariable "life_title";
						if(!(_color isEqualTo [1,0,0,1])) then {
							_color = switch (_title) do
							{
								case "The Prominent %1": { [0.6,0.6,0,1] };
								case "Tycoon %1": { [0.8,0.8,0,1] };
								case "The Eminent %1": { [1,1,0,1] };
								case "%1 the Punisher": { [0.62,0.5,0.5,1] };
								default { _color };
							};
						};
						_name = format[_title, _name];
					};
					drawIcon3D [_icon,_color,_pos,_width,_height,0,_name,0,0.04];
				};
			};
		};
    } forEach _near;
	
	if (life_targetTag) then
	{
		if (!isNull cursorTarget && {player distance cursorTarget > 10}) then
		{
			if (cursorTarget isKindOf "Car" || cursorTarget isKindOf "Air" || cursorTarget isKindOf "Ship") exitWith
			{
				_vis = lineIntersects [eyePos player, eyePos cursorTarget,player, cursorTarget];
				if (cursorTarget in _near) then { _vis = true };
				if (!_vis) then
				{
					_pos = visiblePosition cursorTarget;
					_pos set[2,(getPosATLVisual cursorTarget select 2) + 2.2];
					if (surfaceIsWater (position cursorTarget)) then 
					{
						_pos = visiblePositionASL cursorTarget;
						_pos set[2,(getPosASLVisual cursorTarget select 2) + 2.2];
					};
					_height = 1;
					_color = [1,1,1,1];
					_name = "";
					_crew = crew cursorTarget;
					if (count _crew > 0 && vehicle player != cursorTarget) then
					{
						for "_i" from 0 to (count _crew - 1) do {
							if ((_crew select _i getVariable ["gang","0"]) in life_gang_wars || (_crew select _i getVariable ["aggressive",-300]) > (time - 300)) exitWith { _color = [1,0,0,1]; };
						};
						{
							if(alive _x) then {
								_index = [group _x,life_group_list] call life_fnc_index;
								_gang = if(_index > -1) then {(life_group_list select _index) select 0} else {_x getVariable["gangName",""]};
								_setTag = group _x getVariable["gangTag",""];
								_gangTag = if(_gang == "" && _setTag == "") then {""} else {
									if(_setTag != "") exitWith {_setTag};
									_length = [_gang] call KRON_StrLen;
									_select = false;
									_firstLetter = _gang select [0,1];
									for "_i" from 1 to (_length-1) do {
										_character = _gang select [_i,1];
										if(_select) then {_firstLetter = _firstLetter + _character; _select = false} else {
											if(_character == " ") then {_select = true};
										};
									};
									_tagLength = [_firstLetter] call KRON_StrLen;
									if(_tagLength == 1) then {_firstLetter = _firstLetter + (_gang select[_length - 1,1])};
									if(_firstLetter == "APD") then {_firstLetter = ""};
									_firstLetter;
								};
								_gname = if(_gangTag != "") then {format["[%1] %2",_gangTag,name _x]} else {name _x};
								_extra = if(_forEachIndex > 0) then {", "} else {""};
								_name = _name + _extra + _gname;
							};
						} forEach _crew;
						drawIcon3D ["",_color,_pos,0,0,0,_name,1,0.04];
					};
				};
			};
			if (cursorTarget isKindOf "Man") then
			{
				_hidden = ((goggles cursorTarget) in ["G_Balaclava_blk","G_Balaclava_combat","G_Balaclava_lowprofile","G_Balaclava_oli","G_Bandanna_aviator","G_Bandanna_beast","G_Bandanna_blk","G_Bandanna_khk","G_Bandanna_oli","G_Bandanna_shades","G_Bandanna_sport","G_Bandanna_tan"]);
				_vis = lineIntersects [eyePos player, eyePos cursorTarget,player, cursorTarget];
				if (cursorTarget in _near && !_hidden) then { _vis = true };
				if (!_vis) then
				{
					_pos = visiblePosition cursorTarget;
					_pos set[2,((getPosATLVisual cursorTarget) select 2) + 2.2];
					if (surfaceIsWater (position cursorTarget)) then 
					{
						_pos = visiblePositionASL cursorTarget;
						_pos set[2,((getPosASLVisual cursorTarget) select 2) + 2.2];
					};
					_color = [1,1,1,1];
					if ((cursorTarget getVariable ["gang","0"]) in life_gang_wars || (cursorTarget getVariable ["aggressive",-300]) > (time - 300)) then { _color = [1,0,0,1]; };
					_name = name cursorTarget;
					if (!alive cursorTarget ) then { _color = [1,0,0,1]; _name = cursorTarget getVariable ["name", "Unknown Dead Guy"]; };
					switch (cursorTarget getVariable["copLevel", 0]) do
					{
						case (1) : {_name = format["Police Cadet %1", name cursorTarget];};
						case (2) : {_name = format["Police Constable %1", name cursorTarget];};
						case (3) : {_name = format["Police Corporal %1", name cursorTarget];};
						case (4) : {_name = format["Police Sergeant %1", name cursorTarget];};
						case (5) : {_name = format["Police Lieutenant %1", name cursorTarget];};
						case (6) : {_name = format["Police Captain %1", name cursorTarget];};
						default {
							_index = [group cursorTarget,life_group_list] call life_fnc_index;
							_gang = if(_index > -1) then {(life_group_list select _index) select 0} else {cursorTarget getVariable["gangName",""]};
							_setTag = group cursorTarget getVariable["gangTag",""];
							_gangTag = if(_gang == "" && _setTag == "") then {""} else {
								if(_setTag != "") exitWith {_setTag};
								_length = [_gang] call KRON_StrLen;
								_select = false;
								_firstLetter = _gang select [0,1];
								for "_i" from 1 to (_length-1) do {
									_character = _gang select [_i,1];
									if(_select) then {_firstLetter = _firstLetter + _character; _select = false} else {
										if(_character == " ") then {_select = true};
									};
								};
								_tagLength = [_firstLetter] call KRON_StrLen;
								if(_tagLength == 1) then {_firstLetter = _firstLetter + (_gang select[_length - 1,1])};
								if(_firstLetter == "APD") then {_firstLetter = ""};
								_firstLetter;
							};
							_name = if(_gangTag != "") then {format["[%1] %2",_gangTag,name cursorTarget]} else {name cursorTarget};
							if (_hidden && player distance cursorTarget > 20) then { _name = "Unknown" };
							_gang = cursorTarget getVariable["gangName",""];
							if (_gang != "") then {
								_pos2 = +_pos;
								_pos2 set[2,((getPosATL cursorTarget) select 2) + 2];

								drawIcon3D ["",_color,_pos2,0,0,0,format["[%1]", _gang],0.25,0.03];
							};
						};
					};

					if (cursorTarget getVariable ["life_title",""] != "") then
					{
						_title = cursorTarget getVariable "life_title";
						if(!(_color isEqualTo [1,0,0,1])) then {
							_color = switch (_title) do
							{
								case "The Prominent %1": { [0.6,0.6,0,1] };
								case "Tycoon %1": { [0.8,0.8,0,1] };
								case "The Eminent %1": { [1,1,0,1] };
								case "%1 the Punisher": { [0.62,0.5,0.5,1] };
								default { _color };
							};
						};
						_name = format[_title, _name];
					};
					drawIcon3D ["",_color,_pos,0,0,0,_name,1,0.04];
				};
			};
		};
    };
}] call BIS_fnc_addStackedEventHandler;