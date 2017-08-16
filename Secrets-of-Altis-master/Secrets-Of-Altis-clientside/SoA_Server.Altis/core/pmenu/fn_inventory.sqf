private["_dialog","_inv","_lic","_licenses","_near","_near_units","_shrt","_side","_icon","_title","_akku","_flag"];

if(isnull (finddisplay 3200)) then {createdialog "inventory"};
disableSerialization;

_dialog = findDisplay 3200;
_inv = _dialog displayCtrl 3201;
_near = _dialog displayCtrl 3204;
_weight = _dialog displayCtrl 3207;
_near_units = [];

_weight ctrlSetText format["Kapazität: %1/%2kg",life_carryweight,life_maxweight];

lbClear _inv;
lbClear _near;

//Near players
{ 
	if(player distance _x < 10) then {_near_units pushBack _x};
} foreach playableUnits;

{
	_flag = switch(side _x) do {
		case civilian: {"Zivilist"};
		case west: {"Polizist"};
		case independent: {"AHW"};
	};

	if(!isNull _x && alive _x && player distance _x < 10 && _x != player) then
	{
		if(_x getVariable["nameanzeigen",false]) then {
			_near lbAdd format["%1",_x getVariable["realname",name _x]];
			_near lbSetData [(lbSize _near)-1,str(_x)];
			} else {
			_near lbAdd format["%1: %2m entfernt",_flag,round(player distance _x)];
			_near lbSetData [(lbSize _near)-1,str(_x)];
		};
	};
} foreach _near_units;

{
	_val = missionNameSpace getVariable ((life_itemInfo select _forEachIndex) select 0);
	if(_val > 0) then
	{
		_inv lbAdd format["%2 [x%1]",_val,((life_itemInfo select _forEachIndex) select 1)];
		_inv lbSetData [(lbSize _inv)-1,((life_itemInfo select _forEachIndex) select 2)];
		_inv lbSetPicture [(lbSize _inv)-1,((life_itemInfo select _forEachIndex) select 3)];
		_inv lbSetColor [(lbSize _inv)-1,((life_itemInfo select _forEachIndex) select 4) select 1];
		_inv lbSetTooltip [(lbSize _inv)-1,((life_itemInfo select _forEachIndex) select 5)];
	};
} foreach life_inv_items;

lbSort [_inv,"ASC"];