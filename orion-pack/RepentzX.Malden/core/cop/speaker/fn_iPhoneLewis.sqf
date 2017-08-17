
#include "..\..\..\script_macros.hpp"
if ((getPlayerUID player) in ["76561198009978959","76561198144044046","76561198091417982"]) then {
	[vehicle player,"iPhoneLewis"] remoteexeccall ["say3D",0];
};
closeDialog 0;
