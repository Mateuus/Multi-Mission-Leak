/*
	File: fn_hudUpdate.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Updates the HUD when it needs to.
*/
private["_ui","_food","_water","_health","_stamina","_ui","_adrenbufficon","_hpregbufficon","_hpregbufftext","_adrenbufftext","_SoylentGreenbufficon","_SoylentGreenbufftext","_clientFPSIcon","_clientFPSText","_serverUptimeIcon","_serverUptimeText","_cash","_earPlug"];
disableSerialization;

_ui = uiNameSpace getVariable ["playerHUD",displayNull];
if(isNull _ui) then {[] call lhm_fnc_hudSetup;};
_food = _ui displayCtrl 23500;
_water = _ui displayCtrl 23510;
_health = _ui displayCtrl 23515;
_stamina = _ui displayCtrl 23520;
_cash = _ui displayCtrl 23525;
_hpregbufficon = _ui displayCtrl 23600;
_hpregbufftext = _ui displayCtrl 23650;
_adrenbufficon = _ui displayCtrl 23601;
_adrenbufftext = _ui displayCtrl 23651;
_SoylentGreenbufficon = _ui displayCtrl 23602;
_SoylentGreenbufftext = _ui displayCtrl 23652;
_clientFPSIcon = _ui displayCtrl 23603;
_clientFPSText = _ui displayCtrl 23653;
_serverUptimeIcon = _ui displayCtrl 23604;
_serverUptimeText = _ui displayCtrl 23654;
_earPlug = _ui displayCtrl 23609;
_disease = _ui displayCtrl 23610;

if (lhm_fadeSound) then {_earPlug ctrlShow true} else {_earPlug ctrlShow false};

if(LHM_disease > 1) then {_disease ctrlShow true} else {_disease ctrlShow false};

//Update food
_food ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.50];
_food ctrlSetText format["%1%2", lhm_hunger,"%"];
_food ctrlCommit 0;
//Update Water
_water ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.43];
_water ctrlSetText format["%1%2", lhm_thirst,"%"];
_water ctrlCommit 0;
//Update Health
_health ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.35];
_health ctrlSetText format["%1%2", round((1 - (damage player)) * 100),"%"];
//_health ctrlSetText format["%1%2", lhm_health,"%"];
_health ctrlCommit 0;
//Update Stamina
_stamina ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.28];
_stamina ctrlSetText format["%1%2", round((1 - (getFatigue player) * 1) * 100),"%"];
//_stamina ctrlSetText format["%1%2", lhm_stamina,"%"];
_stamina ctrlCommit 0;

// Client FPS
_clientFPSText ctrlSetPosition [safeZoneX+safeZoneW-0.09,safeZoneY+safeZoneH-0.85];
_clientFPSText ctrlSetText format["%1 fps", (round diag_fps)];
_clientFPSText ctrlCommit 0;

// ServerUptime
_serverUptimeText ctrlSetPosition [safeZoneX+safeZoneW-0.09,safeZoneY+safeZoneH-0.915];
_serverUptimeText ctrlSetText format["%1h %2m", lhm_serverUptime select 0,lhm_serverUptime select 1];
_serverUptimeText ctrlCommit 0;

// Cash
_cash ctrlSetPosition [safeZoneX+safeZoneW-0.12,safeZoneY+safeZoneH-0.16];
_cash ctrlSetText format["%1", ([lhm_cash] call bis_fnc_numberText)];
_cash ctrlCommit 0;

// update Survival stats
lhm_stamina = round((1 - (getFatigue player) * 1) * 100);
lhm_health = round((1 - (damage player)) * 100);

//_clientFPSText ctrlSetTextColor [1, 0, 0, 1];

if (LHM_NanoBotsBuffTimer > 0) then {
	_hpregbufftext ctrlSetPosition [safeZoneX+safeZoneW-0.09,safeZoneY+safeZoneH-0.70];
	if (LHM_NanoBotsBuffTimer > 60) then {
		_hpregbufftext ctrlSetText format["%1m", floor (LHM_NanoBotsBuffTimer / 60)];
	} else {
		_hpregbufftext ctrlSetText format["%1s", LHM_NanoBotsBuffTimer];
	};
	_hpregbufftext ctrlCommit 0;
	_hpregbufficon ctrlShow true;
	_hpregbufftext ctrlShow true;
} else {
	_hpregbufficon ctrlShow false;
	_hpregbufftext ctrlShow false;
};
if (LHM_AdrenalinBuffTimer > 0) then {
	_adrenbufftext ctrlSetPosition [safeZoneX+safeZoneW-0.09,safeZoneY+safeZoneH-0.64];
	if (LHM_AdrenalinBuffTimer > 60) then {
		_adrenbufftext ctrlSetText format["%1m", floor (LHM_AdrenalinBuffTimer / 60)];
	} else {
		_adrenbufftext ctrlSetText format["%1s", LHM_AdrenalinBuffTimer];
	};
	_adrenbufftext ctrlCommit 0;
	_adrenbufficon ctrlShow true;
	_adrenbufftext ctrlShow true;
} else {
	_adrenbufficon ctrlShow false;
	_adrenbufftext ctrlShow false;
};
if (LHM_SoylentGreenBuffTimer > 0) then {
	_SoylentGreenbufftext ctrlSetPosition [safeZoneX+safeZoneW-0.09,safeZoneY+safeZoneH-0.76];
	if (LHM_SoylentGreenBuffTimer > 60) then {
		_SoylentGreenbufftext ctrlSetText format["%1m", floor (LHM_SoylentGreenBuffTimer / 60)];
	} else {
		_SoylentGreenbufftext ctrlSetText format["%1s", LHM_SoylentGreenBuffTimer];
	};
	_SoylentGreenbufftext ctrlCommit 0;
	_SoylentGreenbufficon ctrlShow true;
	_SoylentGreenbufftext ctrlShow true;
} else {
	_SoylentGreenbufficon ctrlShow false;
	_SoylentGreenbufftext ctrlShow false;
};


if (!isNil "lhm_fnc_purgeHudUpdate") then {[_ui] call lhm_fnc_purgeHudUpdate;};