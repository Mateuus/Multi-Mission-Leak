#include "..\..\script_macros.hpp"
disableSerialization;
private["_text","_sel","_officer","_zeit","_std","_min"];
_text = ctrlText 6058;
_sel = lbData [6057,lbCurSel 6057];
if(_text == "") exitWith {hint "Du hast den Text vergessen";};
if(_sel == "") exitWith {hint "Du musst noch eine Straftat auswählen";};

_officer = player GVAR ["realname",name player];

_std = format ["%1",life_zeit select 0];
_min =  format["%1", life_zeit select 1];

_zeit = [_std,_min];
_datum =[format["%1.%2.%3",life_zeit select 2, life_zeit select 3, life_zeit select 4]];

if(life_HC_isActive) then {
	[life_computergesucht,_zeit,_datum,_sel,_text,_officer] remoteExec ["HC_fnc_insertbericht",HC_Life];
} else {
	[life_computergesucht,_zeit,_datum,_sel,_text,_officer] remoteExec ["TON_fnc_insertbericht",RSERV];
};
	
closedialog 0;
