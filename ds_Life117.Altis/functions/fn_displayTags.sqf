/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Returns information on your cursorTarget
*/
private ["_objects"];
_players = nearestObjects[(visiblePosition player),["Man"],1000];
_objects = nearestObjects[(visiblePosition player),["Man","Land_Pallet_MilBoxes_F","Land_Sink_F","Land_InfoStand_V1_F"],30];
_players = _players - [player];


















#define getControl(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)
#define getSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
private["_ui","_objects"];
#define iconID 78000
#define scale 0.8
if((visibleMap)||(!alive player)||({dialog}))exitWith 
	{
	500 cutText["","PLAIN"];
	};
_ui = uiNamespace getVariable ["DS_displayTags",displayNull];
if(isNull _ui)then 
	{
	500 cutRsc["DS_displayTags","PLAIN"];
	_ui = uiNamespace getVariable ["DS_displayTags",displayNull];
	};
_objects = nearestObjects[(visiblePosition player),["Man","Land_Pallet_MilBoxes_F","Land_Sink_F","Land_InfoStand_V1_F"],50];
_objects = _objects - [player];
{
	private["_text"];
	_idc = _ui displayCtrl (iconID + _forEachIndex);
	if(!(lineIntersects [eyePos player, eyePos _x, player, _x])&&{!isNil {_x getVariable "name"}})then 
		{
		_pos = switch(typeOf _x) do 
			{
			case "Land_InfoStand_V1_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1]};
			case "Land_Pallet_MilBoxes_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1.5]};
			case "Land_Sink_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2]};
			default {[visiblePosition _x select 0, visiblePosition _x select 1, ((_x modelToWorld (_x selectionPosition "head")) select 2)+.5]};
			};
		_sPos = worldToScreen _pos;
		_distance = _pos distance player;
		if(count _sPos > 1 && {_distance < 15}) then {
			_text = switch (true) do {
				case (_x in (units grpPlayer) && playerSide == civilian): {format["<t color='#00FF00'>%1</t>",(_x getVariable ["name",name _x])];};
				case (!isNil {(_x getVariable "rank")}): {format["<img image='%1' size='1'></img> %2",switch ((_x getVariable "rank")) do {
					case 2: {"\a3\ui_f\data\gui\cfg\Ranks\corporal_gs.paa"}; 
					case 3: {"\a3\ui_f\data\gui\cfg\Ranks\sergeant_gs.paa"};
					case 4: {"\a3\ui_f\data\gui\cfg\Ranks\lieutenant_gs.paa"};
					case 5: {"\a3\ui_f\data\gui\cfg\Ranks\captain_gs.paa"};
					case 6: {"\a3\ui_f\data\gui\cfg\Ranks\major_gs.paa"};
					case 7: {"\a3\ui_f\data\gui\cfg\Ranks\colonel_gs.paa"};
					case 8: {"\a3\ui_f\data\gui\cfg\Ranks\general_gs.paa"};
					default {"\a3\ui_f\data\gui\cfg\Ranks\private_gs.paa"};
					},_x getVariable ["name",name _x]]};
				default {_x getVariable ["name",name _x];
				};
			};
			
			_idc ctrlSetStructuredText parseText _text;
			_idc ctrlSetPosition [_sPos select 0, _sPos select 1, 0.4, 0.70];
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
} foreach _objects;