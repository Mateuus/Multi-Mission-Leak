#include <macro.h>
private["_ui","_units","_goggles","_uniform","_headgear"];
#define iconID 78000
#define scale 0.8
if(visibleMap OR {!alive player} OR {dialog}) exitWith {
	500 cutText["","PLAIN"];
};

_ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
if(isNull _ui) then {
	500 cutRsc["Life_HUD_nameTags","PLAIN"];
	_ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
};

//_units = nearestObjects[(visiblePosition player),["Man","Land_Pallet_MilBoxes_F","Land_Sink_F"], 50];
_units = nearestObjects[(visiblePosition player),["Man"], 10];
_units = _units - [player];

{
	private["_name", "_text", "_hasName","_icon"];
	_name = _x getVariable ["realname", name _x];
	_hasName = if(!isNil {(_x getVariable "realname")}) then {true} else {false};
	_idc = _ui displayCtrl (iconID + _forEachIndex);

	if(!(lineIntersects [eyePos player, eyePos _x, player, _x]) && {!isNil {_x getVariable "realname"}}) then {
		_dist = 10;
		_pos = switch(typeOf _x) do {
			//case "Land_Pallet_MilBoxes_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1.5]};
			//case "Land_Sink_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2]};
			default {[visiblePosition _x select 0, visiblePosition _x select 1, ((_x modelToWorld (_x selectionPosition "head")) select 2)+.5]};
		};
		_sPos = worldToScreen _pos;
		_distance = _pos distance player;
		if(count _sPos > 1 && {_distance < _dist}) then {
		    _text = "";
			
		switch (true) do {	
			//MASQUE
			case (uniform _x in ["U_I_GhillieSuit","U_B_GhillieSuit","U_O_GhillieSuit"]): {_text = format["<t color='#FFFFFF'>?</t>", _name];};
			case (goggles _x in ["G_Bandanna_aviator","g_balaclava_combat","G_Bandanna_beast","G_Bandanna_tan","G_Bandanna_sport","G_Bandanna_blk","G_Bandanna_oli","G_Bandanna_shades","G_Balaclava_blk","G_Balaclava_lowprofile","G_Balaclava_combat","G_Balaclava_oli"]): {_text = format["<t color='#FFFFFF'>?</t>", _name];};
			case (headgear _x in ["H_Shemag_olive","H_Shemag_khk","H_ShemagOpen_tan","H_ShemagOpen_khk"]): {_text = format["<t color='#FFFFFF'>?</t>", _name];};
			//GROUPE
			case (_x in (units grpPlayer) && playerSide == civilian): {_text = format["<t color='#00FF00'>%1</t>", _name];};
			//GENDARME
			case (!isNil {(_x getVariable "coplevel")}): {
				switch (_x getVariable "coplevel") do {
					case 4: {_icon = "a3\ui_f\data\gui\cfg\Ranks\corporal_gs.paa"}; 
					case 5: {_icon = "a3\ui_f\data\gui\cfg\Ranks\sergeant_gs.paa"};
					case 6: {_icon = "a3\ui_f\data\gui\cfg\Ranks\major_gs.paa"};
					case 7: {_icon = "a3\ui_f\data\gui\cfg\Ranks\lieutenant_gs.paa"};
					case 8: {_icon = "a3\ui_f\data\gui\cfg\Ranks\captain_gs.paa"};
					case 9: {_icon = "a3\ui_f\data\gui\cfg\Ranks\colonel_gs.paa"};
					case 10: {_icon = "a3\ui_f\data\gui\cfg\Ranks\colonel_gs.paa"};
					case 11: {_icon = "a3\ui_f\data\gui\cfg\Ranks\colonel_gs.paa"};					
					case 12: {_icon = "a3\ui_f\data\gui\cfg\Ranks\general_gs.paa"};
					default {_icon = "a3\ui_f\data\gui\cfg\Ranks\private_gs.paa"};
				};
				_text = format["<img image='%2' size='1'></img> <t color='#0683B9'>%1</t>", _name, _icon];
			};
			//MEDECIN
			case ((!isNil {_x getVariable "name"} && playerSide == independent)): {_text = format["<t color='#FF0000'><img image='a3\ui_f\data\map\MapControl\hospital_ca.paa' size='1.5'></img></t> %1", _name]};
			//ADMIN
			case ((!isNil {_x getVariable "name"} && playerSide == east)): {_text = format["<t color='#FFFF00'><img image='a3\ui_f\data\gui\cfg\Ranks\colonel_gs.paa' size='1.5'></img></t> [ADMIN] %1",_name];};
			//MORT
			case (!alive _x): {_text = format["<t color='#000000'>%1</t>", _name];};
			default {
			//GANG
				if(!isNil {(group _x) getVariable "gang_name"}) then {
					_groupname = (group _x) getVariable ["gang_name",""];
					_text = format["%1<br/><t size='0.8' color='#B6B6B6'>%2</t>", _name, _groupname];
			//CIVIL
				} else {
					_text = format["<t color='#FFFFFF'>%1</t>", _name];
					};
				};
		};			
			_idc ctrlSetStructuredText parseText _text;
			_idc ctrlSetPosition [_sPos select 0, _sPos select 1, 0.4, 0.65];
			_idc ctrlSetScale scale;
			_idc ctrlSetFade 0;
			_idc ctrlCommit 0;
			_idc ctrlShow true;
		} else {
			_idc ctrlShow false;
		};
	} else {
		_idc ctrlShow false;
	};
} foreach _units;