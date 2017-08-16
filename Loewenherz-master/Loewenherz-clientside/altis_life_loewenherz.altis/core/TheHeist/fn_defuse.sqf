/*
	Author: Bryan "Tonic" Boardwine

	Description:
	Defuses blasting charges for the cops?
*/
private["_vault","_ui","_title","_progressBar","_cP","_titleText"];

if(!(fed_bank getVariable["chargeplaced",false])) exitWith {hint localize "STR_ISTR_Defuse_Nothing"};
disableSerialization;
closeDialog 0;
createDialog "KeypadDefuse";
waitUntil {!isnull (findDisplay 5825)};
_display = finddisplay 5825;
_text = _display displayCtrl 1100;




_text ctrlSetStructuredText parsetext "<t size='1.25' font='puristaLight' align='center' color='#FF0000'>INFO</t><br/><t size='0.95' font='puristaLight' align='left' color='#BCF5A9'>Durchtrenne einen der Drähte um die Bombe zu entschärfen oder besorge dir ein Defuse Kit!</t><br/>";

