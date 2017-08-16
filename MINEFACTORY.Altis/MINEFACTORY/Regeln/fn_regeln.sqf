#include "..\..\script_macros.hpp"
/*###############################
#	(c) 2016 PierreAmyf     	#
#								#
#	Author: PierreAmyf		    #
#	Lizenz: Lizenz.txt Lesen!	#
###############################*/

private["_mode","_dialog","_infoList","_infoText","_infos","_displayName","_infoSel","_select"];

disableSerialization;
_mode = [_this,0,0,[0]] call BIS_fnc_param;
_dialog = findDisplay 621000;
_infoList = _dialog displayCtrl 621003;
_infoText = _dialog displayCtrl 621002;

_infos = [
	["Serverregeln","Die Aktuellen <a color='#ff1000' href='http://minefactory.eu/regeln'>Serverregeln</a> sind auf unserer Webseite zu finden!"],
	["HP/FB","<a color='#ff1000' href='http://tinyurl.com/hdmlhr8'>Direckt auf unseren TS³</a><br/><a color='#ff1000' href='http://minefactory.eu/'>Unser Webseite</a>"]
];

switch(_mode) do
{
	case 0:
	{
		{
			_displayName = (_x select 0);
			_infoList lbAdd format["%1",_displayName];
		} forEach _infos;
	};
	
	case 1:
	{
		if(isNull _dialog) exitWith {};
		_infoSel = lbCurSel _infoList;
		_select = _infos select _infoSel;
		_infoText ctrlSetStructuredText parseText (_select select 1);
	};
};