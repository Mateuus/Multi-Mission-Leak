/*
Author: Stig
Version: 1.0
Description: HUD Setup for my HUD script. Its perfect.
*/
#include "..\script_macros.hpp"


if(!isNil "updateHUD")exitWith{};
diag_log "HUD wird gestartet.";

disableSerialization;
_display = {findDisplay 46};

_spielerzahlGesamt = (call _display) ctrlCreate ["RscStructuredText", 13300];
_spielerzahlGesamt ctrlSetText "Zivs";
_spielerzahlGesamt ctrlSetPosition [0.335 * safezoneW + safezoneX, 0.962 * safezoneH + safezoneY, 0.035 * safezoneW, 0.033 * safezoneH];
_spielerzahlGesamt ctrlSetBackgroundColor [0,0,0,0];
_spielerzahlGesamt ctrlCommit 0;

_spielerzahlZiv = (call _display) ctrlCreate ["RscStructuredText", 13301];
_spielerzahlZiv ctrlSetText "Adac";
_spielerzahlZiv ctrlSetPosition [0.365937 * safezoneW + safezoneX, 0.962 * safezoneH + safezoneY, 0.035 * safezoneW, 0.033 * safezoneH];
_spielerzahlZiv ctrlSetBackgroundColor [0,0,0,0];
_spielerzahlZiv ctrlCommit 0;

_spielerzahlCop = (call _display) ctrlCreate ["RscStructuredText", 13302];
_spielerzahlCop ctrlSetText "Cops";
_spielerzahlCop ctrlSetPosition [0.396875 * safezoneW + safezoneX, 0.962 * safezoneH + safezoneY, 0.035 * safezoneW, 0.033 * safezoneH];
_spielerzahlCop ctrlSetBackgroundColor [0,0,0,0];
_spielerzahlCop ctrlCommit 0;

_spielerzahlMedic = (call _display) ctrlCreate ["RscStructuredText", 13303];
_spielerzahlMedic ctrlSetText "Medic";
_spielerzahlMedic ctrlSetPosition [0.427812 * safezoneW + safezoneX, 0.962 * safezoneH + safezoneY, 0.035 * safezoneW, 0.033 * safezoneH];
_spielerzahlMedic ctrlSetBackgroundColor [0,0,0,0];
_spielerzahlMedic ctrlCommit 0;

_hunger = (call _display) ctrlCreate ["RscStructuredText", 155004];
_hunger ctrlSetPosition [0.530937 * safezoneW + safezoneX, 0.962 * safezoneH + safezoneY, 0.05 * safezoneW, 0.033 * safezoneH];
_hunger ctrlSetBackgroundColor [0,0,0,0];
_hunger ctrlCommit 0;

_leben = (call _display) ctrlCreate ["RscStructuredText", 144004];
_leben ctrlSetPosition [0.45875 * safezoneW + safezoneX, 0.962 * safezoneH + safezoneY, 0.05 * safezoneW, 0.033 * safezoneH];
_leben ctrlSetBackgroundColor [0,0,0,0];
_leben ctrlCommit 0;

_durst = (call _display) ctrlCreate ["RscStructuredText", 144006];
_durst ctrlSetPosition [0.494844 * safezoneW + safezoneX, 0.962 * safezoneH + safezoneY, 0.05 * safezoneW, 0.033 * safezoneH];
_durst ctrlSetBackgroundColor [0,0,0,0];
_durst ctrlCommit 0;

_cash = (call _display) ctrlCreate ["RscStructuredText", 155008];
_cash ctrlSetText "life_cash";
_cash ctrlSetPosition [0.567031 * safezoneW + safezoneX, 0.962 * safezoneH + safezoneY, 0.07 * safezoneW, 0.033 * safezoneH];
_cash ctrlSetBackgroundColor [0,0,0,0];
_cash ctrlCommit 0;

_atm = (call _display) ctrlCreate ["RscStructuredText", 155009];
_atm ctrlSetText "life_atmbank";
_atm ctrlSetPosition [0.613437 * safezoneW + safezoneX, 0.962 * safezoneH + safezoneY, 0.1 * safezoneW, 0.033 * safezoneH];
_atm ctrlSetBackgroundColor [0,0,0,0];
_atm ctrlCommit 0;





updateHUD =
{
comment "Playercounter";
_cop = playersNumber west;
_civ = (playersNumber civilian) + (playersNumber east);
_med = playersNumber independent;
_all = _cop + _civ + _med;
(findDisplay 46 displayCtrl 13300) ctrlSetStructuredText parseText format ["<img image='icons\hud\players.paa'></img>%1", _all];
(findDisplay 46 displayCtrl 13301) ctrlSetStructuredText parseText format ["<img image='icons\hud\ZIV.paa'></img>%1", _civ];
(findDisplay 46 displayCtrl 13302) ctrlSetStructuredText parseText format ["<img image='icons\hud\POLIZEI.paa'></img>%1", _cop];
(findDisplay 46 displayCtrl 13303) ctrlSetStructuredText parseText format ["<img image='icons\hud\MED.paa'></img>%1", _med];

comment "leben";
(findDisplay 46 displayCtrl 144004) ctrlSetStructuredText parseText format ["<img image='icons\hud\health.paa'></img>%1%2", ceil(100 - (100 * damage player)),"%"];
comment "hunger";
(findDisplay 46 displayCtrl 155004) ctrlSetStructuredText parseText format ["<img image='icons\hud\food.paa'></img>%1%2", life_hunger,"%"];
comment "durst";
(findDisplay 46 displayCtrl 144006) ctrlSetStructuredText parseText format ["<img image='icons\hud\water.paa'></img>%1%2", life_thirst,"%"];
comment "cash";
(findDisplay 46 displayCtrl 155008) ctrlSetStructuredText parseText format ["<img image='icons\hud\money.paa'></img>%1", [CASH] call life_fnc_numberText];
comment "atmcash";
(findDisplay 46 displayCtrl 155009) ctrlSetStructuredText parseText format ["<img image='icons\hud\bank.paa'></img>%1", [BANK] call life_fnc_numberText];
};

updateHUD_damage =
{
(findDisplay 46 displayCtrl 144004) ctrlSetStructuredText parseText format ["<img image='icons\hud\health.paa'></img>%1%2", ceil(100 - (100 * damage player)),"%"];
};

0 spawn
{
while{true}do
	{
	sleep 5;
	call updateHUD;
	};
};

call updateHUD;