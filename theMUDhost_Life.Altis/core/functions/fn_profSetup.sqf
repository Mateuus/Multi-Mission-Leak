/*
	File: fn_profSetUp.sqf
	Author: Jacob "PapaBear" Tyler
	 
	Description:
	Opens gui and fills info
*/
 
createDialog "life_prof_dialog";
disableSerialization;
 
//fill text block profs
//format
// NAME LVL:1 EXP: xxx/yyyy
//character count? or 2 different textboxes
 
_dialog = findDisplay 7730;
_Names = _dialog displayCtrl 7731;
_Lvls = _dialog displayCtrl 7732;
_Exp = _dialog displayCtrl 7733;
_struct = "";
_struct2 = "";
_struct3 = "";
_spacesTill = 20;
{
	_numSpaces = 0;
	_profText = [_x select 0] call life_fnc_profType;
	_charCount = count _profText;
	_numSpaces = _spacesTill - _charCount;
	_data = missionNamespace getVariable (_x select 0);
	_profLevel = _data select 0;
	_profExp = _data select 1;
	 
	_nextLevel = 0;
	_nextLevel = 4 * ( _profLevel^3 ) ;
	_nextLevel2 =  6 * ( _profLevel^2 ) ;
	_nextLevel = _nextLevel - _nextLevel2;
	_nextLevel3 = 20 * _profLevel ;
	_nextLevel = _nextLevel + _nextLevel3 + 200 ;
	_struct3 = _struct3 + (format["Exp: %1/%2<br/>", _profExp,_nextLevel ]);
	_struct2 = _struct2 + (format["LvL: %1<br/>",_profLevel]);
	_struct = _struct + format["%1<br/>",_profText];
} foreach life_prof;
 
_Names ctrlSetStructuredText parseText format["<t size='0.8px'>%1</t>",_struct];
_Lvls ctrlSetStructuredText parseText format["<t size='0.8px'>%1</t>",_struct2];
_Exp ctrlSetStructuredText parseText format["<t size='0.8px'>%1</t>",_struct3];