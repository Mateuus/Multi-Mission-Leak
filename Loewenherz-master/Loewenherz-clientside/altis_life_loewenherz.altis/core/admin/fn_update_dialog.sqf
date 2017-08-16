





private ["_display","_ansehen1","_ansehen2","_ansehen3","_ansehen4","_ansehen5","_ansehen6","_ansehen7","_ansehen8","_ansehen9","_ansehen10","_ansehen11","_ansehen12","_eingabe1","_eingabe2","_eingabe3","_eingabe4","_eingabe5","_eingabe6","_eingabe7","_eingabe8","_eingabe9","_eingabe10","_eingabe11","_eingabe12","_cfg","_tempcode","_tempCodeCompiled"];
disableSerialization;
_display = finddisplay 3577;
_ansehen1 = _display displayCtrl 1100;
_ansehen2 = _display displayCtrl 1101;
_ansehen3 = _display displayCtrl 1102;
_ansehen4 = _display displayCtrl 1103;
_ansehen5 = _display displayCtrl 1104;
_ansehen6 = _display displayCtrl 1105;
_ansehen7 = _display displayCtrl 1106;
_ansehen8 = _display displayCtrl 1107;
_ansehen9 = _display displayCtrl 1108;
_ansehen10 = _display displayCtrl 1109;
_ansehen11 = _display displayCtrl 1110;
_ansehen12 = _display displayCtrl 1111;

_eingabe1 = _display displayCtrl 1402;
_eingabe2 = _display displayCtrl 1403;
_eingabe3 = _display displayCtrl 1404;
_eingabe4 = _display displayCtrl 1405;
_eingabe5 = _display displayCtrl 1406;
_eingabe6 = _display displayCtrl 1407;
_eingabe7 = _display displayCtrl 1408;
_eingabe8 = _display displayCtrl 1409;
_eingabe9 = _display displayCtrl 1410;
_eingabe10 = _display displayCtrl 1411;
_eingabe11 = _display displayCtrl 1412;
_eingabe12 = _display displayCtrl 1413;


_cfg = [[_eingabe1,_ansehen1],[_eingabe2,_ansehen2],[_eingabe3,_ansehen3],[_eingabe4,_ansehen4],[_eingabe5,_ansehen5],[_eingabe6,_ansehen6],[_eingabe7,_ansehen7],[_eingabe8,_ansehen8],[_eingabe9,_ansehen9],[_eingabe10,_ansehen10],[_eingabe11,_ansehen11],[_eingabe12,_ansehen12]];

{
	_temp = profileNamespace getVariable[format["Script-Konsole-Watch-%1",_foreachindex],""];
	(_x select 0) ctrlsettext _temp;


} foreach _cfg;

while {true} do
{
	if(isnull (finddisplay 3577)) exitWith {};
	{
		if(isnull (finddisplay 3577)) exitWith {};
		if((ctrltext (_x select 0)) != "") then {
			_tempcode = ctrltext (_x select 0);
			profileNamespace setVariable[format["Script-Konsole-Watch-%1",_foreachindex],_tempcode];
			_tempCodeCompiled = call compile _tempcode;
			if(!isnil "_tempCodeCompiled") then {
				(_x select 1) ctrlSetStructuredText parseText str _tempCodeCompiled;
			};
			_tempCodeCompiled = nil;
		} else
		{
			(_x select 1) ctrlSetStructuredText parseText "";
			profileNamespace setVariable[format["Script-Konsole-Watch-%1",_foreachindex],""];
		};
	} foreach _cfg;
	sleep 1;
};



