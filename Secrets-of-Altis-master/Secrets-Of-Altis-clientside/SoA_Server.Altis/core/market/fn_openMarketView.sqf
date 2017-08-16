/*

	Open pack-up dlg

*/
private["_index","_near_units","_flag"];
if(!createDialog "marketView") exitWith {hint "Failed Creating Dialog";};
disableSerialization;
_dialog = finddisplay 39500;
_bank = _dialog displayCtrl 1006;
_bar = _dialog displayCtrl 1007;
_plist = _dialog displayCtrl 1009;
_near_units = [];

_bank ctrlSetText format["%1€",[life_beatbankgeld] call life_fnc_numberText];
_bar ctrlSetText format["%1€",[life_beatgeld] call life_fnc_numberText];

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
			_plist lbAdd format["%1",_x getVariable["realname",name _x]];
			_plist lbSetData [(lbSize _plist)-1,str(_x)];
			} else {
			_plist lbAdd format["%1: %2m entfernt",_flag,round(player distance _x)];
			_plist lbSetData [(lbSize _plist)-1,str(_x)];
		};
	};
} foreach _near_units;

lbClear 1500;
{
	_preicon = [_x select 0,0] call life_fnc_varHandle; 
	_icon = [_preicon] call life_fnc_itemIcon;
	
	_index = lbAdd [1500, [ [_x select 0, 0] call life_fnc_varHandle ] call life_fnc_varToStr ];
	lbSetData [1500, _index, _x select 0];
	lbSetPicture [1500,_index,_icon]; 
} foreach life_market_resources;
lbSetCurSel [1500, 0];