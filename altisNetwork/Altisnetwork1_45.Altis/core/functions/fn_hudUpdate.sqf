#include "..\..\script_macros.hpp"
/*
#define IDC_LIFE_BAR_SeatBelt 4203

private["_ui","_healthbar","_foodbar","_waterbar","_Fatiguebar","_food","_water","_health","_Fatigue"];
disableSerialization;

_ui = uiNameSpace getVariable ["playerHUD",displayNull];

if(isNull _ui) then {
    [] call life_fnc_hudSetup;
    };

_health = _ui displayCtrl 5100;
_healthbar = _ui displayCtrl 5101;
_food = _ui displayCtrl 5102;
_foodbar = _ui displayCtrl 5103;
_water = _ui displayCtrl 5104;
_waterbar = _ui displayCtrl 5105;
_Weight = _ui displayCtrl 5106;
_Weightbar = _ui displayCtrl 5107;
//_Fatigue = _ui displayCtrl 5108;
//_Fatiguebar = _ui displayCtrl 5109;
//_fatigue2 = getFatigue player;
//_mutedIcon = _ui displayCtrl 23523;



_water ctrlCommit 0;
_waterbar progressSetPosition (life_thirst / 100);

_food ctrlCommit 0;
_foodbar progressSetPosition (life_hunger / 100);

_health ctrlCommit 0;
_healthbar progressSetPosition (-(damage player - 1));

_Weightbar ctrlCommit 0;
_Weight progressSetPosition (life_carryWeight / life_maxWeight);
//Update Bounty
//_bounty ctrlSetPosition [safeZoneX+safeZoneW-0.26,safeZoneY+safeZoneH-0.132];
//_FatigueBar ctrlCommit 0;
//_Fatigue progressSetPosition _fatigue2;
//_bountybar progressSetPosition (100);

if(!isNil "life_seatbelt") then {
    if ( vehicle player != player ) then {
        if(life_seatbelt) then {
            LIFEctrl(IDC_LIFE_BAR_SeatBelt) ctrlSetText "icons\H_seatbeltOn.paa";
        } else {
            LIFEctrl(IDC_LIFE_BAR_SeatBelt) ctrlSetText "icons\H_seatbeltOff.paa";
        };
    };
};

// -- Disable hud 
if (life_disablehud || !isNull(findDisplay 49) || visibleMap) then {
    _health ctrlshow false;
    _healthbar ctrlshow false;
    _food ctrlshow false;
    _foodbar ctrlshow false;
    _water ctrlshow false;
    _waterbar ctrlshow false;
    _Weight ctrlshow false;
    _Weightbar ctrlshow false;
    life_cfnrm_hud_disabled = true;
} else {
    if (life_cfnrm_hud_disabled) then {
    _health ctrlshow true;
    _healthbar ctrlshow true;
    _food ctrlshow true;
    _foodbar ctrlshow true;
    _water ctrlshow true;
    _waterbar ctrlshow true;
    _Weight ctrlshow true;
    _Weightbar ctrlshow true;
    life_cfnrm_hud_disabled = false;
    };
};
*/