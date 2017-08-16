#include <macro.h>

/*
	File: fog.sqf

	Time to see if fog is here.
*/
/*
while { true } do {
    waitUntil { sleep 600; fog > 0 }; // Evaluate the condition once a day
    [[0,[0, 0, 0]], "setFog"] call life_fnc_mp;
};
*/

while {true} do {
	0 setFog 0;
	sleep 600;
};
