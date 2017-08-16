     
#include <macro.h>
 if(FETCH_CONST(life_adminlevel) >= 5) then {  disableSerialization; _display = findDisplay 6001; _display call BIS_fnc_configviewer;  } else { hint "That's only for developers!"; }; 