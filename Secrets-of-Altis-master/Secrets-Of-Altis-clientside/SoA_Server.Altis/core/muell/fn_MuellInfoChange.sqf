/*#######################################
#	MuellInfo Summe ändern wenn ..		#
#	Author: [MdF] Feindflug				#
#######################################*/

private["_display","_dist","_farbeC"];

waitUntil {!isNull (findDisplay 99992)};
disableSerialization;
_display = findDisplay 99992;
_stadt = _display displayCtrl 99993;
_distance = _display displayCtrl 99994;
_farbe = _display displayCtrl 99995;
_summe = _display displayCtrl 99996;
_dist = call compile format["%1",(lbData[99994,(lbCurSel 99994)])];
_farbeC = call compile format["%1",(lbData[99995,(lbCurSel 99995)])];

if(lbCurSel _distance > 0 && lbCurSel _farbe > 0 && lbCurSel _stadt > 0) then
{
	_farbeSum = (_farbeC select 1);
	_distSum = (_dist select 1);
	_end = _farbesum + _distSum;
	_endSum = _end + muell_InfoPreis;
	_summe ctrlSetText "";
	_summe ctrlSetText format["%1", _endSum];
};