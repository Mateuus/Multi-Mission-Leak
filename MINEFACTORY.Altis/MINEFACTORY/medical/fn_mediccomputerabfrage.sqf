private["_display","_text","_totenliste","_btn","_name","_Btn1","_Btn2"];disableSerialization;_display = findDisplay 13525;_text = _display displayCtrl 13529;_totenliste = lbData[13526,(lbCurSel 13526)];_totenliste = call compile format["%1", _totenliste];if(isNil "_totenliste") exitwith {};if(isNull _totenliste) exitWith {};

((findDisplay 13525) displayCtrl 13527) ctrlEnable false;
((findDisplay 13525) displayCtrl 13528) ctrlEnable false;

_btn = _totenliste getvariable["saniweg",false];if(_btn) then {
	((findDisplay 13525) displayCtrl 13528) ctrlEnable true;	
	_name = _totenliste getvariable["saniname","unbekannt"];	_text ctrlSetStructuredText parseText format["<t size='1'><br/>Santitäter ist auf dem weg:<br/>%1 </t>",_name];} else{	_text ctrlSetStructuredText parseText format["Keine Info"];	((findDisplay 13525) displayCtrl 13527) ctrlEnable true;
};