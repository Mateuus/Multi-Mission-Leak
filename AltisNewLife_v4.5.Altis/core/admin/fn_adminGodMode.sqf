#include <macro.h>
if(GETC(bitch_level) < 3) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};
[] spawn {
  while {dialog} do {
   closeDialog 0;
   uiSleep 0.01;
  };
}; 
if(life_god) then {
	life_god = false;
	titleText ["Mode Dieu desactive","PLAIN"]; titleFadeOut 2;
	player allowDamage true;

} else {
	life_god = true;
	titleText ["Mode Dieu active","PLAIN"]; titleFadeOut 2;
	player allowDamage false;
}; 