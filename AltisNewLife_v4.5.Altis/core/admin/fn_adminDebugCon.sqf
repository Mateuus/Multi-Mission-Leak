#include <macro.h>
if(GETC(bitch_level) < 3) exitWith {closeDialog 0; hint "Vous n'avez pas les droits";};
createDialog "RscDisplayDebugPublic";
//[[0,format["Admin %1 a ouvert la console de Debug.",profileName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;