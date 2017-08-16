#include <macro.h>
/*
ArmA.Network
*/
disableSerialization;
//Buttons to Spawn
_spawnbt1 = ((findDisplay 38500) displayCtrl 2400);
_spawnbt2 = ((findDisplay 38500) displayCtrl 2401);
_spawnbt3 = ((findDisplay 38500) displayCtrl 2402);
_spawnbt4 = ((findDisplay 38500) displayCtrl 2403);
_spawnbt5 = ((findDisplay 38500) displayCtrl 2404);
//ActualSpawnButton
_spawnbutton = ((findDisplay 38500) displayCtrl 2405);
_spawnimage = ((findDisplay 38500) displayCtrl 1201);

_spawnbt1 ctrlEnable true;
_spawnbt2 ctrlEnable true;
_spawnbt3 ctrlEnable true;
_spawnbt4 ctrlEnable true;
_spawnbt5 ctrlEnable true;
_spawnbutton ctrlEnable false;
ctrlShow [1201,false];
switch (playerSide) do {
  case civilian:
  {
    if (Tower2 getVariable "eg_terror") then {
			hint "There is currently a terror attack taking place within Rasman. Spawning there is currently blocked.";
			_spawnbt1 ctrlSetText "Shukukalay";
      _spawnbt1 buttonSetAction "[""civ_spawn_3""] spawn life_fnc_spawnPointSelected;";
      _spawnbt1 ctrlSetTextColor [0, 0, 0, 1];
      _spawnbt2 ctrlEnable false;
      _spawnbt3 ctrlEnable false;
      _spawnbt4 ctrlEnable false;
      _spawnbt5 ctrlEnable false;
      if(license_civ_passport) then {
        _spawnbt2 ctrlEnable true;
        _spawnbt3 ctrlEnable true;
        _spawnbt2 ctrlSetText "Nagara";
        _spawnbt2 ctrlSetTextColor [0, 0, 0, 1];
        _spawnbt2 buttonSetAction "[""civ_spawn_2""] spawn life_fnc_spawnPointSelected;";
        _spawnbt3 ctrlSetText "Karachinar";
        _spawnbt3 ctrlSetTextColor [0, 0, 0, 1];
        _spawnbt3 buttonSetAction "[""civ_spawn_4""] spawn life_fnc_spawnPointSelected;";
  		};
  		if(license_civ_rebel) then {
        _spawnbt4 ctrlEnable true;
  			_spawnbt4 ctrlSetText "Loy Manara";
        _spawnbt4 ctrlSetTextColor [0, 0, 0, 1];
        _spawnbt4 buttonSetAction "[""reb_spawn_1""] spawn life_fnc_spawnPointSelected;";
  		};
		} else {
			hint "No terror reports currently. Spawning is safe.";
      _spawnbt3 ctrlEnable false;
      _spawnbt4 ctrlEnable false;
      _spawnbt5 ctrlEnable false;
			_spawnbt1 ctrlSetText "Rasman";
      _spawnbt1 ctrlSetTextColor [0, 0, 0, 1];
      _spawnbt1 buttonSetAction "[""civ_spawn_1""] spawn life_fnc_spawnPointSelected;";
      _spawnbt2 ctrlSetText "Shukukalay";
      _spawnbt2 ctrlSetTextColor [0, 0, 0, 1];
      _spawnbt2 buttonSetAction "[""civ_spawn_3""] spawn life_fnc_spawnPointSelected;";
      if(license_civ_passport) then {
        _spawnbt3 ctrlEnable true;
        _spawnbt4 ctrlEnable true;
        _spawnbt3 ctrlSetText "Nagara";
        _spawnbt3 ctrlSetTextColor [0, 0, 0, 1];
        _spawnbt3 buttonSetAction "[""civ_spawn_2""] spawn life_fnc_spawnPointSelected;";
        _spawnbt4 ctrlSetText "Karachinar";
        _spawnbt4 ctrlSetTextColor [0, 0, 0, 1];
        _spawnbt4 buttonSetAction "[""civ_spawn_4""] spawn life_fnc_spawnPointSelected;";
  		};
  		if(license_civ_rebel) then {
        _spawnbt5 ctrlEnable true;
  			_spawnbt5 ctrlSetText "Loy Manara";
        _spawnbt5 ctrlSetTextColor [0, 0, 0, 1];
        _spawnbt5 buttonSetAction "[""reb_spawn_1""] spawn life_fnc_spawnPointSelected;";
  		};
    };
  };
  case west:
  {

    if(FETCH_CONST(life_coplevel) > 5) then {
        _spawnbt1 ctrlSetText "UN HQ";
        _spawnbt1 ctrlSetTextColor [0, 0, 0, 1];
        _spawnbt1 buttonSetAction "[""cop_spawn_1""] spawn life_fnc_spawnPointSelected;";
        _spawnbt2 ctrlEnable false;
        _spawnbt3 ctrlEnable false;
        _spawnbt4 ctrlEnable false;
        _spawnbt5 ctrlEnable false;
    } else {
        _spawnbt1 ctrlSetText "TSF HQ";
        _spawnbt1 ctrlSetTextColor [0, 0, 0, 1];
        _spawnbt1 buttonSetAction "[""cop_spawn_2""] spawn life_fnc_spawnPointSelected;";
        _spawnbt2 ctrlEnable false;
        _spawnbt3 ctrlEnable false;
        _spawnbt4 ctrlEnable false;
        _spawnbt5 ctrlEnable false;
    };
  };
  case independent:
  {
    _spawnbt1 ctrlSetText "Rasman Hospital";
    _spawnbt1 ctrlSetTextColor [0, 0, 0, 1];
    _spawnbt1 buttonSetAction "[""medic_spawn_1""] spawn ZoCk_fnc_spawnPointSelected;";
    _spawnbt2 ctrlSetText "Garmsar Regional";
    _spawnbt2 ctrlSetTextColor [0, 0, 0, 1];
    _spawnbt2 buttonSetAction "[""medic_spawn_2""] spawn ZoCk_fnc_spawnPointSelected;";
    _spawnbt3 ctrlSetText "Feruz Abad Clinic";
    _spawnbt3 ctrlSetTextColor [0, 0, 0, 1];
    _spawnbt3 buttonSetAction "[""medic_spawn_3""] spawn ZoCk_fnc_spawnPointSelected;";
    _spawnbt4 ctrlEnable false;
    _spawnbt5 ctrlEnable false;
  };
};
_letsgo = 1;
