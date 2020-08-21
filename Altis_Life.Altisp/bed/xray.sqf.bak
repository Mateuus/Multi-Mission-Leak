/*

	Author: Fuel Reborn Roleplay

*/
if (playerside != independent) exitWith { hint "Nie jestes Doktorem!" };
if (vehicle player != player) exitWith {};


[] spawn {

		//xraymonitor setObjectTextureGlobal [0, "textures\xrayblank.paa"];

		sleep 3;

		[player,"xray"] remoteExec ["life_fnc_say3D",0];

		sleep 30;

		/*_rndNum = floor(random(4));

		switch (_rndNum) do
		{
			case 0: {xraymonitor setObjectTextureGlobal [0, "textures\xray.paa"];};
			case 1: {xraymonitor setObjectTextureGlobal [0, "textures\xray1.paa"];};
			case 2: {xraymonitor setObjectTextureGlobal [0, "textures\xray2.paa"];};
			default {xraymonitor setObjectTextureGlobal [0, "textures\xray.paa"];};
		};

		//xraymonitor setObjectTextureGlobal [0, "textures\xray.paa"];*/
_xrayimg = ["textures\xrays\xray.paa","textures\xrays\xray1.paa","textures\xrays\xray2.paa","textures\xrays\xray3.paa","textures\xrays\xray4.paa","textures\xrays\xray5.paa","textures\xrays\xray6.paa","textures\xrays\xray7.paa","textures\xrays\xray8.paa","textures\xrays\xray9.paa"];

xraymonitor setObjectTextureGlobal [0, selectRandom _xrayimg];

		sleep 120;

		xraymonitor setObjectTextureGlobal [0, "textures\xrays\xrayblank.paa"];

	};
