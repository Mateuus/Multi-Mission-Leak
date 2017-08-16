/*
	@Version: 3.1
	@Author: Kri
	@Edited: 09.13.2014
*/
private ["_name", "_var","_costs","_array"];

_array = _this;
_var = _array select 0;
_name = _array select 1;
_costs = 500;

Hint format ["Herzlichen Glueckwunsch!\n%1 hat die Prüfung bestanden!",_name];

lhm_cash = lhm_cash - _costs;
titleText [format ["Die Fahrpruefung hat dich $ %1 gekostet!", _costs], "PLAIN"];

missionNamespace setVariable [_var, true];
