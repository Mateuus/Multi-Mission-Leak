#include "..\..\macros.hpp"
/*
	File: fn_playerTags.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Adds the tags above other players heads when close and have visible range.
*/
private["_ui","_units","_masks"];
#define iconID 78000
#define scale 1.0 // größe einstellen für die ganze reihe

if (isNil "DWEV_var_showHud") then {DWEV_var_showHud = true;};

if(visibleMap OR {!alive player} OR {dialog} OR {!DWEV_var_showHud}) exitWith 
{
	500 cutText["","PLAIN"];
};



_ui = uiNamespace getVariable ["DWEV_HUD_nameTags",displayNull];

if(isNull _ui) then 
{
	500 cutRsc["DWEV_HUD_nameTags","PLAIN"];
	_ui = uiNamespace getVariable ["DWEV_HUD_nameTags",displayNull];
};

//_units = nearestObjects[(visiblePosition player),["Man","Land_Pallet_MilBoxes_F","Land_Sink_F"], 50];
_units = nearestObjects[(visiblePosition player),["Man"], 35];
_units = _units - [player]; // für selbst test

_PlayerinZone = false; //INITIALISIERUNG VERGESSEN!!!! ICH HABS :D
switch (worldName) do  //Bei return wird, wenn keine Rückgabe Null -> Nicht gut!!
{
	case "Altis":
	{
		if(player distance (getMarkerPos "trigger_kavala_markt_weis") < 115) exitWith { _PlayerinZone = true; };
		if(player distance (getMarkerPos "trigger_pyrgos_markt") < 75) exitWith { _PlayerinZone = true; };
		if(player distance (getMarkerPos "trigger_casino") < 60) exitWith { _PlayerinZone = true; };
	};

	case "Tanoa":
	{
		if(player distance (getMarkerPos "trigger_georgetown_weiß") < 85) exitWith { _PlayerinZone = true; };
		if(player distance (getMarkerPos "trigger_bambi") < 600) exitWith { _PlayerinZone = true; };
	};
};

{
	private["_name", "_text", "_icon", "_hasName"];
	_name = getPlayerDName(_x);
	_hasName = if(!isNil {(_x getVariable "realname")}) then {true} else {false};
	_masks = DWEV_SETTINGS(getArray,"clothing_masks");
	
	_idc = _ui displayCtrl (iconID + _forEachIndex);

	if(!(lineIntersects [eyePos player, eyePos _x, player, _x]) && {_hasName} && ((vehicle player) == player)) then
	{
		_pos = [visiblePosition _x select 0, visiblePosition _x select 1, ((_x modelToWorld (_x selectionPosition "head")) select 2)+.5];
				
		_sPos = worldToScreen _pos;
		_distance = _pos distance player;

		if(count _sPos > 1 && {_distance < 15}) then 
		{
			_text = "";
			_icon = "";

			_forcedNameTag = _PlayerinZone; //wenn nicht in kavala //-> false -> zeige  erstmal nicht an
			if(!_PlayerinZone) then {  //Abfrage erst , wenn Spieler nahgenug, um PErformance zu sparen!
				if (!((headgear _x) in _masks || (goggles _x) in _masks || (uniform _x) in _masks)) then
				{ 
					_forcedNameTag = true; // wenn nicht maske auf -> zeige an -> true
				}; //sonst bleib bei false
			};

			if(_forcedNameTag) then {

				switch (true) do {
					//Innerhalb der gang
					case (_x in (units grpPlayer) && (side player) == civilian): {
						_text = format["<t color='#00FF00'>%1</t>", _name];
					};

					//Tote Spieler
					case (!alive _x): {
						_icon = "a3\ui_f\data\map\MapControl\hospital_ca.paa";
						_text = format["<t color='#FF0000'><img image='%2' size='1'></img> %1</t>", _name, _icon];
					};

					//Polizei
					case(_x getVariable["coplevel", 0] > 0) : {
						switch (_x getVariable["coplevel", 0]) do {
							case (1) : {_icon = "a3\UI_F\data\GUI\Cfg\Ranks\private_gs.paa"; _text = format["<t color='#009AFF'><img image='%2' size='1'></img> [Ordnungsbeamter] %1</t>", _name, _icon];};
							case (2) : {_icon = "a3\UI_F\data\GUI\Cfg\Ranks\corporal_gs.paa"; _text = format["<t color='#009AFF'><img image='%2' size='1'></img> [Wachtmeister] %1</t>", _name, _icon];};
							case (3) : {_icon = "a3\UI_F\data\GUI\Cfg\Ranks\corporal_gs.paa"; _text = format["<t color='#009AFF'><img image='%2' size='1'></img> [Oberwachtmeister] %1</t>", _name, _icon];};
							case (4) : {_icon = "a3\UI_F\data\GUI\Cfg\Ranks\corporal_gs.paa"; _text = format["<t color='#009AFF'><img image='%2' size='1'></img> [Hauptwachtmeister] %1</t>", _name, _icon];};
							case (5) : {_icon = "a3\UI_F\data\GUI\Cfg\Ranks\sergeant_gs.paa"; _text = format["<t color='#009AFF'><img image='%2' size='1'></img> [Kommissar] %1</t>", _name, _icon];};
							case (6) : {_icon = "a3\UI_F\data\GUI\Cfg\Ranks\lieutenant_gs.paa"; _text = format["<t color='#009AFF'><img image='%2' size='1'></img> [Oberkommissar] %1</t>", _name, _icon];};
							case (7) : {_icon = "a3\UI_F\data\GUI\Cfg\Ranks\captain_gs.paa"; _text = format["<t color='#009AFF'><img image='%2' size='1'></img> [Hauptkommissar] %1</t>", _name, _icon];};
							case (8) : {_icon = "a3\UI_F\data\GUI\Cfg\Ranks\colonel_gs.paa"; _text = format["<t color='#009AFF'><img image='%2' size='1'></img> [Polizeidirektion] %1</t>", _name, _icon];};
							case (9) : {_icon = "a3\UI_F\data\GUI\Cfg\Ranks\colonel_gs.paa"; _text = format["<t color='#009AFF'><img image='%2' size='1'></img> [Polizeipräsident] %1</t>", _name, _icon];};
							default {};
						};
					};
					
					//sani
					case(_x getVariable["mediclevel", 0] > 0) : {
						switch (_x getVariable["mediclevel", 0]) do {
							case (1) : {_icon = "a3\ui_f\data\map\MapControl\hospital_ca.paa"; _text = format["<t color='#FF0000'><img image='%2' size='1'></img> [Feuerwehr-An] %1</t>", _name, _icon];};
							case (2) : {_icon = "a3\ui_f\data\map\MapControl\hospital_ca.paa"; _text = format["<t color='#FF0000'><img image='%2' size='1'></img> [Feuerwehr-H] %1</t>", _name, _icon];};
							case (3) : {_icon = "a3\ui_f\data\map\MapControl\hospital_ca.paa"; _text = format["<t color='#FF0000'><img image='%2' size='1'></img> [Feuerwehr-AG] %1</t>", _name, _icon];};
							case (4) : {_icon = "a3\ui_f\data\map\MapControl\hospital_ca.paa"; _text = format["<t color='#FF0000'><img image='%2' size='1'></img> [Feuerwehr-TF] %1</t>", _name, _icon];};
							case (5) : {_icon = "a3\ui_f\data\map\MapControl\hospital_ca.paa"; _text = format["<t color='#FF0000'><img image='%2' size='1'></img> [Feuerwehr-Ma] %1</t>", _name, _icon];};
							case (6) : {_icon = "a3\ui_f\data\map\MapControl\hospital_ca.paa"; _text = format["<t color='#FF0000'><img image='%2' size='1'></img> [Feuerwehr-GF] %1</t>", _name, _icon];};
							case (7) : {_icon = "a3\ui_f\data\map\MapControl\hospital_ca.paa"; _text = format["<t color='#FF0000'><img image='%2' size='1'></img> [Feuerwehr-HF] %1</t>", _name, _icon];};
							case (8) : {_icon = "a3\ui_f\data\map\MapControl\hospital_ca.paa"; _text = format["<t color='#FF0000'><img image='%2' size='1'></img> [Feuerwehr-ZF] %1</t>", _name, _icon];};
							case (9) : {_icon = "a3\ui_f\data\map\MapControl\hospital_ca.paa"; _text = format["<t color='#FF0000'><img image='%2' size='1'></img> [Feuerwehr-Leitung] %1</t>", _name, _icon];};
							default {};
						};
					};
					
					/*
					case(_x getVariable["opforlevel", 0] > 0) : {
						switch (_x getVariable["opforlevel", 0]) do {
							case (1) : {_icon = "a3\UI_F\data\GUI\Cfg\Ranks\general_gs.paa"; _text = format["<t color='#FFFF00'><img image='%2' size='1'></img> [Sicherheitsdienst] %1</t>", _name, _icon];};
							default {};
						};
					};
					*/
					
					//Admins wenn wir wollen
	//				case(_x getVariable["adminlevel", 0] > 0): {
	//					_icon = "a3\UI_F\data\GUI\Cfg\Ranks\general_gs.paa";
	//					_text = format["<t color='#FFFF00'><img image='%2' size='1'></img> [Admin] %1</t>", _name, _icon];
	//				};				

					//Zivilisten
					default 
					{
						//Zivi mit Gang
						if(!isNil {(group _x) getVariable "gang_name"}) then 
						{
							_groupname = (group _x) getVariable ["gang_name",""];
							_text = format["<t color='#FFFFFF'>%1</t><br/><t size='0.7' color='#B6B6B6'>%2</t>", _name, _groupname];
						
						} 
						else //Zivi ohne Gang
						{
							_text = format["<t color='#FFFFFF'>%1</t>", _name];
						};
						
						if (_x getVariable["noobschutz",false]) then // Noobschutz
						{
							_text = format["<t color='#FF0000'>%1</t><br/><t size='0.7' color='#FF0000'>%2</t>", _name, "ANFÄNGERSCHUTZ"];
													
						};
							
						//sicherheitsdienst
						if((side _x) == east) then
						{
							_icon = "a3\UI_F\data\GUI\Cfg\Ranks\general_gs.paa";
							_text = format["<t color='#FFFF00'><img image='%2' size='1'></img> [Sicherheitsdienst] %1</t>", _name, _icon];
						};
						
					};
				};

				_idc ctrlSetStructuredText parseText _text;
				_idc ctrlSetPosition [_sPos select 0, _sPos select 1, 0.4, 0.65];
				_idc ctrlSetScale scale;
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
} foreach _units;