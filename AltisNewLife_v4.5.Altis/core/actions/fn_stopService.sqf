#define GETC(var) (call var)
if(GETC(life_tafflevel) != 2) exitWith {};
player setVariable ["rsdep",false,true];
player removeAction rsdep_setAsTowerAction;
player removeAction rsdep_unTowAction;
player removeAction rsdep_towAction;
player removeAction rsdep_deleteVehAction;
player removeAction rsdep_lightsAction;
titleText["\n\n\n\n\n\n\n\n\n\n\n\nMerci de votre travail !","PLAIN"];