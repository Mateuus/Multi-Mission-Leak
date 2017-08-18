#include <macro.h>
/*
	File: fn_equipGear.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Initializes custom gear textures
*/
switch (true) do {
	case ((uniform player) == "U_Rangemaster" && playerSide == west): {
		switch (__GETC__(life_coplevel)) do {
			case 0: { [player,"textures\uniform\cop\cadet.jpg"] call life_fnc_setUniform;};
			case 1: { [player,"textures\uniform\cop\constable.jpg"] call life_fnc_setUniform;};
			case 2: { [player,"textures\uniform\cop\sergeant.jpg"] call life_fnc_setUniform;};
			case 3: { [player,"textures\uniform\cop\lieutenant.jpg"] call life_fnc_setUniform;};
			case 4: { [player,"textures\uniform\cop\detective.jpg"] call life_fnc_setUniform;};
			case 5: { [player,"textures\uniform\cop\swat.jpg"] call life_fnc_setUniform;};
			case 6: { [player,"textures\uniform\cop\captain.jpg"] call life_fnc_setUniform;};
			case 7: { [player,"textures\uniform\cop\chief.jpg"] call life_fnc_setUniform;};
		};
	};
	
	case ((uniform player) == "U_Competitor" && playerSide == west): {
		switch (__GETC__(life_coplevel)) do {
			case 0: { [player,"textures\uniform\cop\uniform.paa"] call life_fnc_setUniform;};
			case 1: { [player,"textures\uniform\cop\uniform.paa"] call life_fnc_setUniform;};
			case 2: { [player,"textures\uniform\cop\uniform.paa"] call life_fnc_setUniform;};
			case 3: { [player,"textures\uniform\cop\uniform.paa"] call life_fnc_setUniform;};
			case 4: { [player,"textures\uniform\cop\uniform.paa"] call life_fnc_setUniform;};
			case 5: { [player,"textures\uniform\cop\uniform.paa"] call life_fnc_setUniform;};
			case 6: { [player,"textures\uniform\cop\uniform.paa"] call life_fnc_setUniform;};
			case 7: { [player,"textures\uniform\cop\uniform.paa"] call life_fnc_setUniform;};
		};
	};
	
	case ((uniform player) == "U_I_HeliPilotCoveralls" && playerSide == west): {
		switch (__GETC__(life_coplevel)) do {
			case 0: { [player,"textures\uniform\cop\pilot.paa"] call life_fnc_setUniform;};
			case 1: { [player,"textures\uniform\cop\pilot.paa"] call life_fnc_setUniform;};
			case 2: { [player,"textures\uniform\cop\pilot.paa"] call life_fnc_setUniform;};
			case 3: { [player,"textures\uniform\cop\pilot.paa"] call life_fnc_setUniform;};
			case 4: { [player,"textures\uniform\cop\pilot.paa"] call life_fnc_setUniform;};
			case 5: { [player,"textures\uniform\cop\pilot.paa"] call life_fnc_setUniform;};
			case 6: { [player,"textures\uniform\cop\pilot.paa"] call life_fnc_setUniform;};
			case 7: { [player,"textures\uniform\cop\pilot.paa"] call life_fnc_setUniform;};
		};
	};

	//Prisoner
	case ((uniform player) == "U_C_WorkerCoveralls"): {
		[player,"textures\uniform\prisoner\prisoner.jpg"] call life_fnc_setUniform;
	};
	
	//Lumberjack
	case ((uniform player) == "U_C_Poloshirt_stripped"): {
		[player,"textures\uniform\civilian\lumberjack.paa"] call life_fnc_setUniform;
	};
};

if (playerSide == west) then {
	player setVariable ["coplevel",__GETC__(life_coplevel)];
};