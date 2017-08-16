/*
	file: fn_notenbank.sqf
	author: ibllaclk (Altis4Player)
	Improved by Shriver B.
	
*/
private["_ui","_progress","_notenbank","_pgText","_cp","_this","_countCop"];
_notenbank = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_countCop = (west countSide playableUnits);

	if (_countCop < 1) exitWith { hint "Zu wenig Polizisten im Staat."; };
	if (_countCop == 1) exitWith { hint "Zu wenig Polizisten im Staat. Es Fehlen 4 Polizisten"; };
	if (_countCop == 2) exitWith { hint "Zu wenig Polizisten im Staat. Es Fehlen 3 Polizisten"; };
	if (_countCop == 3) exitWith { hint "Zu wenig Polizisten im Staat. Es Fehlen 2 Polizisten"; };
	if (_countCop == 4) exitWith { hint "Zu wenig Polizisten im Staat. Es Fehlt 1 Polizist"; };
	if (playerSide != civilian) exitWith { hint "Du bist kein Zivilist."; };
	if (player distance _notenbank > 5) exitWith { hint "Bleib gefälligst da!!"; };
	if (currentWeapon player == "") exitWith { hint "Mutig mutig, so ganz ohne Waffe"; };
	if (vehicle player != player) exitWith { hint "Nicht ausm Fahrzeug raus."; };
	if (life_notenbank) exitWith { hint "Der Tresor ist leer."; };
	if (isNull player OR isNull _notenbank) exitWith {};
	if (!alive player) exitWith {};

life_notenbank = true;
publicVariable "life_notenbank";

[_notenbank,"moneybank"] remoteExec ["life_fnc_globalSoundClient",0];
[[1,2],"Die Banknoten Druckerei wird ausgeraubt!!!"] remoteExec ["life_fnc_broadcast",0];

disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Du raubst die Notenbank aus, bleib in der Nähe (5m) (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;

while{true} do
{
	sleep 12;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["Du raubst die Notenbank aus, bleib in der Nähe (5m) (%1%2)...",round(_cP * 100),"%"];
	
	if (!alive player) exitWith {life_notenbank = false; publicVariable "life_notenbank";};
	if (player distance _notenbank > 5) exitWith {hint "Du hast dich zu weit entfernt!"; 5 cutText ["","PLAIN"];life_notenbank = false; publicVariable "life_notenbank";};		
	if(_cP >= 1) exitWith {};
}; 

if (player distance _notenbank > 5) exitWith { hint "Du hast dich zu weit entfernt!";life_notenbank = false;publicVariable "life_notenbank";};

5 cutText ["Du hast die Bank erfolgreich ausgeraubt!","PLAIN"];
life_cash = life_cash + 6000000; 