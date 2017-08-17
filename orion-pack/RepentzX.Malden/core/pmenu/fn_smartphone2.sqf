#include "..\..\script_macros.hpp"

if (playerSide isEqualTo civilian) then {
createDialog "smartphoneCIV";
};

if (playerSide isEqualTo west) then {
createDialog "smartphoneCOP";
};

if (playerSide isEqualTo independent) then {
createDialog "smartphoneMEDIC";
};
