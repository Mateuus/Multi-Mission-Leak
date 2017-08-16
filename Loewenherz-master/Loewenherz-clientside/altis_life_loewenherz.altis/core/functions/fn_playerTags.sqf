#include <macro.h>
private["_ui","_units","_eventboxes"];
#define iconID 78000
#define scale 0.8
#define yoffset 0.03
#define xoffset 0.15

if(visibleMap OR {!alive player} OR {dialog}) exitWith {
	500 cutText["","PLAIN"];
};

_ui = uiNamespace getVariable ["lhm_HUD_nameTags",displayNull];
if(isNull _ui) then {
	500 cutRsc["lhm_HUD_nameTags","PLAIN"];
	_ui = uiNamespace getVariable ["lhm_HUD_nameTags",displayNull];
};

_units = nearestObjects[(visiblePosition player),["Man","Land_Pallet_MilBoxes_F","Land_Sink_F","Box_NATO_Wps_F","Land_InfoStand_V1_F"],50];
if(!LHM_Own_playertags_on) then {
	_units = _units - [player];
};

{
	private["_text","_bounty"];
	_text = "";
	_bounty = "";
	_idc = _ui displayCtrl (iconID + _forEachIndex);
	if(!(lineIntersects [eyePos player, eyePos _x, player, _x]) && {!isNil {_x getVariable "realname"}}) then {
		_pos = switch(typeOf _x) do {
			case "Land_Pallet_MilBoxes_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1.5]};
			case "Box_NATO_Wps_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1]};
			case "Land_Sink_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2]};
			case "Land_InfoStand_V1_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1.5]};
			default {[visiblePosition _x select 0, visiblePosition _x select 1, ((_x modelToWorld (_x selectionPosition "head")) select 2)+.4]};
		};
		_sPos = worldToScreen _pos;
		_distance = _pos distance player;
		if(count _sPos > 1 && {_distance < 15}) then {
			Private ["_color","_bounty","_val"];
			_val = 0;
			_color = "FFFFFF";
			_bounty = "";

			if (!isNil "LHM_PlayerTag_Addon") then {
				;
				_index = [(getPlayerUID _x),LHM_LOCAL_WANTED_LIST] call TON_fnc_index;
				if((_index != -1) && !((side _x) isEqualTo west)) then
				{
					_data = LHM_LOCAL_WANTED_LIST select _index;
					_val = _data select 3;
					_r = "FF";_g = "FF";_b = "FF";
					if (_val > 0) then {_r = "7F";_g = "FF";_b = "00";};
					if (_val > 2500) then {_r = "99";_g = "FF";_b = "00";};
					if (_val > 5000) then {_r = "B3";_g = "FF";_b = "00";};
					if (_val > 7500) then {_r = "FF";_g = "FF";_b = "00";};
					if (_val > 10000) then {_r = "FF";_g = "B3";_b = "00";};
					if (_val > 12500) then {_r = "FF";_g = "A0";_b = "00";};
					if (_val > 15000) then {_r = "FF";_g = "80";_b = "00";};
					if (_val > 17500) then {_r = "FF";_g = "19";_b = "00";};
					if (_val > 20000) then {_r = "FF";_g = "FF";_b = "00";};
					_color = format["%1%2%3",_r,_g,_b];
					_bounty = format["$%1",_val];
					if (_val > 999999) then {_bounty = format[">$999999"];};
					_bounty = format["<t size='0.8' color='#%2'>%1<br/></t>",_bounty,_color];
				};
			};
			_text = switch (true) do {
				case (_x in (units grpPlayer) && playerSide isEqualTo civilian): {format["<t color='#00FF00'>%1</t>",(_x getVariable ["realname",name _x])];};
				case (!isNil {(_x getVariable "rank")}):
					{format["<img image='%1' size='1.7'></img> %2 %3",switch ((_x getVariable "rank")) do {
						case 2: {"core\textures\icons\ranks\officer.paa"};
						case 3: {"core\textures\icons\ranks\corporal.paa"};
						case 4: {"core\textures\icons\ranks\sergeant.paa"};
						case 5: {"core\textures\icons\ranks\lieutenant.paa"};
						case 6: {"core\textures\icons\ranks\first_lieutenant.paa"};
						case 7: {"core\textures\icons\ranks\captain.paa"};
						case 8: {"core\textures\icons\ranks\colonel.paa"};
						case 9: {"core\textures\icons\ranks\deputy_chief.paa"};
						case 10: {"core\textures\icons\ranks\chief.paa"};
						default {"core\textures\icons\ranks\recruit.paa"};
					},switch ((_x getVariable "rank")) do {
						case 2: {"[Officer]"};
						case 3: {"[Corporal]"};
						case 4: {"[Sergeant]"};
						case 5: {"[Lieutenant]"};
						case 6: {"[First Lieutenant]"};
						case 7: {"[Captain]"};
						case 8: {"[Colonel]"};
						case 9: {"[Deputy Chief]"};
						case 10: {"[Chief]"};
					default {"[Recruit]"};
					},_x getVariable ["realname",name _x]]};

				case (!isNil {(_x getVariable "rankmed")}):
					{format["<img image='%1' size='1.7'></img> %2 %3",switch ((_x getVariable "rankmed")) do {
						case 2: {"core\textures\icons\ranks\medic.paa"};
						case 3: {"core\textures\icons\ranks\facharzt.paa"};
						case 4: {"core\textures\icons\ranks\oberarzt.paa"};
						case 5: {"core\textures\icons\ranks\chefarzt.paa"};
						default {"core\textures\icons\ranks\sani.paa"};
					},switch ((_x getVariable "rankmed")) do {
						case 2: {"[Medic]"};
						case 3: {"Dr."};
						case 4: {"Dr. med."};
						case 5: {"Prof. Dr. med."};
						default {"[Sani]"};
					},_x getVariable ["realname",name _x]]};

				case (!isNil {(_x getVariable "ranksec")}):
					{format["<img image='%1' size='1.7'></img> %2 %3",switch ((_x getVariable "ranksec")) do {
						case 2: {"core\textures\icons\ranks\sec.paa"};
						case 3: {"core\textures\icons\ranks\operator.paa"};
						case 4: {"core\textures\icons\ranks\boss.paa"};
						case 5: {"core\textures\icons\ranks\ceo.paa"};
						default {"core\textures\icons\ranks\tuersteher.paa"};
					},switch ((_x getVariable "ranksec")) do {
						case 2: {"[Operator]"};
						case 3: {"[Agent]"};
						case 4: {"[Special Agent]"};
						case 5: {"[Boss]"};
						default {"[Bodyguard]"};
					},_x getVariable ["realname",name _x]]};

				case ((!isNil {_x getVariable "name"} && playerSide isEqualTo independent)): {format["<t color='#FF0000'><img image='a3\ui_f\data\map\MapControl\hospital_ca.paa' size='1.5'></img></t> %1",_x getVariable ["name","Unknown Player"]]};
				case ((!isNil {_x getVariable "name"} && playerSide isEqualTo east)): {format["<t color='#FF0000'><img image='a3\ui_f\data\map\MapControl\bunker_ca.paa' size='1.5'></img></t> %1",_x getVariable ["name","Unknown Player"]]};
				default {
					if(!isNil {(group _x) getVariable "gang_name"}) then {
						format["<t color='#%3'>%1<br/></t><t size='0.8' color='#B6B6B6'>%2</t>",_x getVariable ["realname",name _x],(group _x) getVariable ["gang_name",""],_color];
					} else {
						format["<t color='#%2'>%1</t>",(_x getVariable ["realname",name _x]),_color];
					};
				};
			};
			if(!isNil {_x getVariable "Abzeichen"}) then {
				_nmr = _x getVariable "Abzeichen";
				_ret = [1,_nmr] call lhm_fnc_RANK_MENU_config;
				_text = format["<img image='%2' size='1.7'></img> %1 ", (_ret select 0),(_ret select 1)] + _text;

			};

			if (playerSide isEqualTo west) then {
				_text = "<t align='center'>" + _bounty + _text + "</t>";
			} else {
				_text = "<t align='center'>" + _text + "</t>";
			};

			if (isObjectHidden _x) then {_text = ""; _bounty = ""}; // disable if a player is invisible
			if ((headgear _x) in lhm_masks) then {_text = ""; _bounty = ""}; // disable if player is masked

			_idc ctrlSetStructuredText parseText _text;
			_idc ctrlSetPosition [(_sPos select 0) - xoffset, (_sPos select 1) - yoffset, 0.4, 0.65];
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
