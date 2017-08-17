#include "..\..\script_macros.hpp"
life_fadeSound = !life_fadeSound;

	if (life_fadeSound) then
	{
		1 fadeSound 0.1;
		call life_fnc_hudUpdate;
	} else {
		1 fadeSound 1;
		call life_fnc_hudUpdate;
};
