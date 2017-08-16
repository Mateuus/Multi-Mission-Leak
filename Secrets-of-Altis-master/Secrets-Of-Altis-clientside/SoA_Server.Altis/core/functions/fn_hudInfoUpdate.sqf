/*

			fn_hudInfoUpdate.sqf
			Author: G00golplexian
			
			Description: Updates HUD-Infos every x second.
*/
private["_adac","_civ","_cop","_fps","_med","_ui","_expmax","_wert","_GMlist","_exp","_expmax","_expProgress","_gm"];
if(isDedicated) exitWith {};

while{true} do {

	WaitUntil{sleep 1; hudactive};

	disableSerialization;
	_ui = uiNameSpace getVariable ["playerHUD",displayNull];
	_health = _ui displayCtrl 23515;
	_bargeld = _ui displayCtrl 23535;
	_civ = _ui displayCtrl 23545;
	_cop = _ui displayCtrl 23550;
	_med = _ui displayCtrl 23555;
	_adac = _ui displayCtrl 23560;
	_exp = _ui displayCtrl 23570;
	_expProgress = _ui displayCtrl 23575;
	_gm = _ui displayCtrl 23580;

	_GMlist = [];

	//Update Health
	_dam = round((1 - (damage player)) * 100);
	_health ctrlSetText format["%1%2", _dam, "%"];
	_health ctrlSetBackgroundColor [0, 220, 0, 0.5]; 
	if(damage player > 0.5) then { 
		_health ctrlSetBackgroundColor [255, 0, 0, 0.5]; 	
	};
	_health ctrlCommit 0;

	if(playerside != civilian) then {
		_exp CtrlShow false;
		_expProgress CtrlShow false;
	};

	switch(life_level) do {
		case 0: {_expmax = 50};
		case 1: {_expmax = 1500};
		case 2: {_expmax = 5000};
		case 3: {_expmax = 10000};
		case 4: {_expmax = 25000};
		case 5: {_expmax = 50000};
		case 6: {_expmax = 100000};
		case 7: {_expmax = 350000};
		case 8: {_expmax = 750000};
		case 9: {_expmax = 1300000};
		case 10: {_expmax = 2000000};
		case 11: {_expmax = 3000000};
		case 12: {_expmax = 3100000};
		default {_expmax = 0};
	};

	if(playerSide == civilian) then {_wert = (life_exp/_expmax)};

	_bargeld ctrlSetText format["%1€",[life_beatgeld] call life_fnc_numbertext]; 
	_gm ctrlSetText format["%1/%2kg", life_carryweight, life_maxweight];
	_civ ctrlSetText format["Zivi: %1", civilian countSide playableUnits];
	_cop ctrlSetText format["Poli: %1", west countSide playableUnits];
	_med ctrlSetText format["AHW: %1", independent countSide playableUnits];
	_adac ctrlSetText format["GM's: %1",{_x getVariable ["supporter",false]} count playableUnits];
	if(playerSide == civilian) then {_expProgress progressSetPosition _wert;};
	_exp ctrlSetText format["Erfahrung: %1 / %2",[life_exp] call life_fnc_numbertext,[_expmax] call life_fnc_numbertext];
	UIsleep 2;
};