#include <macro.h>
/*
	File: fn_playerTags.sqf
	
	
	Description:
	Adds the tags above other players heads when close and have visible range.
*/
private["_ui","_units"];
#define iconID 78000
#define scale 0.9

500 cutText["","PLAIN"];
if(visibleMap OR {deadPlayer} OR {dialog}) exitWith {
};

_ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
if(isNull _ui) then {
	500 cutRsc["Life_HUD_nameTags","PLAIN"];
	_ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
};

_units = nearestObjects [player, ["Man"], 6];

{
	private["_text"];
	_pos = [visiblePosition _x select 0, visiblePosition _x select 1, ((_x modelToWorld (_x selectionPosition "head")) select 2)+.5];
	_sPos = worldToScreen _pos;
	_distance = _x distance player;
	_name = _x getVariable ["realname", name _x];

	if(!(lineIntersects [eyePos player, eyePos _x, player, _x]) && count _sPos > 1 && _distance < 7 && isPlayer _x) then {

		if(_x getVariable ["tf_isSpeaking",false] && !(_x getVariable ["dead",false])) then {
			if(!isNil {(group _x) getVariable "gang_name"}) then {
				_groupname = (group _x) getVariable ["gang_name",""];
				_text = format["<t color='#FFFFFF' font='puristaMedium'>%1</t> <img size='1' image='cg_mission_files\icons\smalltalk.paa'/> <br/><t size='0.8' font='puristaMedium' color='#B6B6B6'>%2</t>",_name,_groupname];
			} else {
				_text = format["<t color='#FFFFFF' font='puristaMedium'>%1</t> <img size='1' image='cg_mission_files\icons\smalltalk.paa'/>",_name];								
			};

			if (goggles _x IN GoggleList || headgear _x IN HatList ) then {
				_text = format["<t color='#FFFFFF' font='puristaMedium'>Masked</t> <img size='1' image='cg_mission_files\icons\smalltalk.paa'/>"];				
			};

			if ((_x getVariable["gagged", false])) then {
				_text = "<t color='#FFFFFF' font='puristaMedium'>Gagged</t>";
			};


			if (uniform _x IN ["U_C_Scientist","TRYK_U_B_woodR_CombatUniformTshirt"] || phone_s_1 ) then {
				_text = "";
			};
		} else {
			if(!isNil {(group _x) getVariable "gang_name"}) then {
				_groupname = (group _x) getVariable ["gang_name",""];
				_text = format["<t color='#FFFFFF' font='puristaMedium'>%1</t><br/><t size='0.8' color='#B6B6B6'>%2</t>", _name, _groupname];
			} else {
				_text = format["<t color='#FFFFFF' font='puristaMedium'>%1</t>",_name];
			};

			if (goggles _x IN GoggleList || headgear _x IN HatList ) then {
				_text = "<t color='#FFFFFF' font='puristaMedium'>Masked</t>";
			};

			if ((_x getVariable["gagged", false])) then {
				_text = "<t color='#FFFFFF' font='puristaMedium'>Gagged</t>";
			};

			if (uniform _x IN ["U_C_Scientist","TRYK_U_B_woodR_CombatUniformTshirt"] || phone_s_1 ) then {
				_text = "";
			};
		};
		_idc = _ui displayCtrl (iconID + _forEachIndex);
		_idc ctrlSetStructuredText parseText _text;
		_idc ctrlSetPosition [_sPos select 0, _sPos select 1, 0.4, 0.65];
		_idc ctrlSetScale scale;
		_idc ctrlSetFade 0;
		_idc ctrlCommit 0;
		_idc ctrlShow true;
	};
} foreach _units - [player];

if(marker_on) then {
	_distance = floor( getpos player distance posinext );     
	_distance = format ["%1 | %2",drawmessage, _distance];
	drawIcon3D ["\A3\ui_f\data\map\markers\military\pickup_ca.paa", [1,1,1,1], posinext, 0.7, 0.7, 5, _distance, 1, 0.036, "PuristaLight"];  
};