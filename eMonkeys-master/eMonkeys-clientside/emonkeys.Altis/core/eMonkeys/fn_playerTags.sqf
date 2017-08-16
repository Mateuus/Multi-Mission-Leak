

private["_ui","_units"];
#define iconID 78000
#define scale 0.8
disableSerialization;

_ui = uiNamespace getVariable ["EMonkeys_HUD_nameTags",displayNull];
if(isNull _ui) then {
	500 cutRsc["EMonkeys_HUD_nameTags","PLAIN"];
	_ui = uiNamespace getVariable ["EMonkeys_HUD_nameTags",displayNull];
};

_units = nearestObjects[(visiblePosition player),["Man","Land_Pallet_MilBoxes_F","Land_Sink_F"],50];
_units = _units - [player];

{
	private["_text"];
	_idc = _ui displayCtrl (iconID + _forEachIndex);
	if(!(lineIntersects [eyePos player, eyePos _x, player, _x]) && {!isNil {_x getVariable "realname"}} && (_x getVariable["invisible",false])) then {
		_pos = switch(typeOf _x) do {
			case "Land_Pallet_MilBoxes_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1.5]};
			case "Land_Sink_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2]};
			default {[visiblePosition _x select 0, visiblePosition _x select 1, ((_x modelToWorld (_x selectionPosition "head")) select 2)+.5]};
		};
		_sPos = worldToScreen _pos;
		_distance = _pos distance player;
		if(count _sPos > 1 && {_distance < 15}) then {
			_text = switch (true) do {
				case ((side _x in [civilian,east])): {format["<t color='#FFFFFF'>%1</t>",(_x getVariable ["name",name _x])];};
				case ((side _x == west)): {format["<t color='#FFFFFF'>%1</t>",(_x getVariable ["name",name _x])];};
				case ((!isNil {_x getVariable "name"} && side _x == independent)): {format["<t color='#FA5858'><img image='a3\ui_f\data\map\MapControl\hospital_ca.paa' size='1.5'></img></t> %1",_x getVariable ["name","Unknown Player"]]};


			};
			if(_x getVariable ["speak",false]) then {_text = format ["<img image='\A3\ui_f\data\igui\rscingameui\rscdisplayvoicechat\microphone_ca.paa' size='1'></img>"] + _text;};
			
			
			if (_x getVariable["onkill",FALSE]) then {_text ="<t color='#FA5858'><img image='a3\ui_f\data\map\MapControl\hospital_ca.paa' size='1.5'></img></t>";};
		
			
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
