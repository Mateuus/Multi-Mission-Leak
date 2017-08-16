/*
	File: fn_playerTags.sqf
	Author: John "Paratus" VanderZwet & Bryan "Tonic" Boardwine

	Description:
	Adds the tags above other players heads when close and have visible range.
*/

private["_ui","_units","_masks","_text"];

disableSerialization;

if(visibleMap OR {!alive player} OR {dialog}) exitWith {
	500 cutText["","PLAIN"];
};

_ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
if(isNull _ui) then {
	500 cutRsc["Life_HUD_nameTags","PLAIN"];
	_ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
};

if (life_adminxray == 1) then {
	{
		if (isPlayer _x) then {
			 life_tag_units pushBack _x;
		};
	} forEach allUnits;
};

if (life_targetTag) then
{
	if (!isNull cursorTarget && {cursorTarget isKindOf "Man" || cursorTarget isKindOf "Car" || cursorTarget isKindOf "Air" || cursorTarget isKindOf "Ship"} && {!(cursorTarget in life_tag_units)}) then
	{
		life_tag_units pushBack cursorTarget;
	};
};

{
	_idc = _ui displayCtrl (78000 + _forEachIndex);

	if (!(lineIntersects [eyePos player, eyePos _x, player, _x]) && alive _x || life_adminxray == 1) then
	{
		_pos = [visiblePosition _x select 0, visiblePosition _x select 1, ((_x modelToWorld (_x selectionPosition "head")) select 2)+.5];
		_sPos = worldToScreen _pos;
		_distance = _pos distance player;
		_maxDistance = if (goggles _x in life_masks) then { 5 } else { 20 };

		if (count _sPos > 1 && !(_x getVariable["isInvisible",false]) && {(_distance <= _maxDistance) || {life_targetTag && _x == cursorTarget} || life_adminxray == 1}) then
		{
			if !(!(_x isKindOf "Man") && count (crew _x) == 0) then
			{
				_icon = switch (true) do
				{
					case !(_x isKindOf "Man"): { format["<img image='%1' size='1'></img>  ", getText (configFile >> "CfgVehicles" >> typeOf _x >> "picture")] };
					case (side _x == independent): { "<img image='a3\ui_f\data\map\MapControl\hospital_ca.paa' color='#FF0000' size='1'></img>  " };
					case (side _x == west):
					{
						switch (_x getVariable["copLevel", 0]) do
						{
							case (1) : {format["<img image='%1' size='1'></img>  ", [0,"texture"] call BIS_fnc_rankParams]};
							case (2) : {format["<img image='%1' size='1'></img>  ", MISSION_ROOT + "icons\pfc_gs.paa"]};
							case (3) : {format["<img image='%1' size='1'></img>  ", [1,"texture"] call BIS_fnc_rankParams]};
							case (4) : {format["<img image='%1' size='1'></img>  ", [2,"texture"] call BIS_fnc_rankParams]};
							case (5) : {format["<img image='%1' size='1'></img>  ", [3,"texture"] call BIS_fnc_rankParams]};
							case (6) : {format["<img image='%1' size='1'></img>  ", [4,"texture"] call BIS_fnc_rankParams]};
							default { "" };
						};
					};
					case (_x getVariable["activeBounty", false]): { format["<img image='%1icons\police.paa' size='1'></img>  ", MISSION_ROOT] };
					case (getPlayerUID _x == (life_configuration select 0)): { format["<img image='%1icons\govern.paa' color='#FF0000' size='1'></img>  ", MISSION_ROOT] };
					default { "" };
				};

				_text = switch (true) do
				{
					case (side _x == west):
					{
						switch (_x getVariable["copLevel", 0]) do
						{
							case (1) : {format["Police Cadet %1", name _x]};
							case (2) : {format["Police Constable %1", name _x]};
							case (3) : {format["Police Corporal %1", name _x]};
							case (4) : {format["Police Sergeant %1", name _x]};
							case (5) : {format["Police Lieutenant %1", name _x]};
							case (6) : {format["Police Captain %1", name _x]};
							default { name _x };
						};
					};
					case !(_x isKindOf "Man"):
					{
						_name = "";
						{
							_extra = if (_forEachIndex > 0) then {", "} else {""};
							_name = _name + _extra + name _x;
						} forEach (crew _x);
						_name;
					};
					default {name _x};
				};
				if (_x getVariable ["life_title",""] != "") then { _text = format[_x getVariable "life_title", _text]; };
				if(!isNil {_x getVariable "gangName"}) then { _text = format["%1<br/><t size='0.8' align='center' color='#B6B6B6'>%2</t>", _text, _x getVariable "gangName"]; };

				_color = switch (true) do
				{
					case (_x in (units group player) && playerSide == civilian): {"00FF00"};
					case (!isPlayer _x && {_x isKindOf "Man"}): {"CCCCCC"};
					case ((_x getVariable ["gang","0"]) in life_gang_wars || (_x getVariable ["aggressive",-300]) > (time - 300)): { "FF0000" };
					default {
						switch (_x getVariable ["life_title",""]) do
						{
							case "The Prominent %1": { "999900" };
							case "Tycoon %1": { "CCCC00" };
							case "The Eminent %1": { "FFFF00" };
							case "%1 the Punisher": { "9E8080" };
							default { "FFFFFF" };
						};
					};
				};

				_idc ctrlSetStructuredText parseText format["<t align='center'>%3<t color='#%2'>%1</t></t>", _text, _color, _icon];
				_idc ctrlSetPosition [(_sPos select 0) - 0.27, _sPos select 1]; // 235
				_idc ctrlSetScale 0.9;
				_idc ctrlSetFade 0;
				_idc ctrlCommit 0;
				_idc ctrlShow true;
			}
			else
			{
				_idc ctrlShow false;
			};
		}
		else
		{
			_idc ctrlShow false;
		};
	}
	else
	{
		_idc ctrlShow false;
	};
} foreach life_tag_units;

if (count life_tag_cache > count life_tag_units) then
{
	for "_i" from (count life_tag_units) to (count life_tag_cache)-1 do
	{
		_idc = _ui displayCtrl (78000 + _i);
		_idc ctrlShow false;
	};
};
