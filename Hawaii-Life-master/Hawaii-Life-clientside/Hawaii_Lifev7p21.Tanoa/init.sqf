#include "script_macros.hpp"
StartProgress = false;

[] execVM "KRON_Strings.sqf";

StartProgress = true;

[] spawn {
	while{true} do {
		sleep 10;
		0 setFog 0;
		sleep 590;
	};
};