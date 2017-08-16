#include "..\..\script_macros.hpp"
disableSerialization;
private["_text","_sel","_officer","_zeit","_std","_min"];

_display = findDisplay 6000;
_sel = lbData [6013,lbCurSel 6013];
if (_sel == "") exitwith {hint "fail";};
_valueindex = lbValue[6012,(lbCurSel 6012)]; 
_strafliste = straftat GVAR [life_computergesucht,[]];

for "_i" from 0 to count _strafliste do
{
	if (_strafliste select _i select 0 == _valueindex) exitwith	
	{	
		_strafliste select _i select 1 set [2,[_sel]];				
		if(life_HC_isActive) then {
			[_valueindex,_strafliste select _i select 1] remoteExec ["HC_fnc_update",HC_Life];
		} else {
			[_valueindex,_strafliste select _i select 1] remoteExec ["TON_fnc_update",RSERV];
		};
	};
};
straftat SVAR [life_computergesucht,_strafliste,TRUE];
closedialog 0;
hint "Eintrag wurde aktualisiert !";