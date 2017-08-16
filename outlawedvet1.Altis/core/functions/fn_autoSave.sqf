#include "..\..\script_macros.hpp"
/*
RPGforYOU

Description:
Autosave + gangbonus system

*/

while {true} do {
uiSleep 300;

//Rpg-Weird cash you have there mate
if(CASH > 20000000) then {
titleText ["BANNED", "BLACK OUT", 3];
uiSleep 2;
[53] call SOCK_fnc_updatePartial;
["PERMBAN",false,true] call BIS_fnc_endMission;
};

if (playerside isequalto west) then {
	
	    if (uniform player isEqualTo "U_B_CombatUniform_mcam") then {
		player setObjectTextureGlobal [0,"textures\uniforms\swat_shirt.paa"];
		};
			
	    if (uniform player isEqualTo "U_O_GhillieSuit") then {
		player setObjectTextureGlobal [0,"textures\uniforms\swat_shirt.paa"];
		};
		
        if (uniform player isEqualTo "U_Rangemaster") then {
		_texture = 
		switch (FETCH_CONST(life_coplevel)) do
				{
					case 0: {"textures\uniforms\police.jpg"};
					case 1: {"textures\uniforms\police.jpg"};
					case 2: {"textures\uniforms\police.jpg"};
					case 3: {"textures\uniforms\police.jpg"};
					case 4: {"textures\uniforms\police.jpg"};
					case 5: {"textures\uniforms\police.jpg"};
					case 6: {"textures\uniforms\police.jpg"};
					case 7: {"textures\uniforms\police.jpg"};
					case 8: {"textures\uniforms\police.jpg"};
					case 9: {"textures\uniforms\police.jpg"};
				};
				
		player setObjectTextureGlobal [0,_texture];
		};
};

if (playerside isequalto independent) then {
        if (uniform player isEqualTo "U_B_CombatUniform_mcam_worn") then {
            player setObjectTextureGlobal [0, "textures\uniforms\medic.paa"];
        };
};

/*
RPGforYOU

Description:
Gang hideouts money capture system
*/

if (playerside isequalto civilian) then {
private["_group1","_group2","_group3","_group4","_hideout1","_hideout2","_hideout3","_hideout4","_gangbonus"];
_gangbonus = 0;

if (isNil {group player getVariable "gang_name"}) then {
} else {

_hideout1 = (nearestObjects[(getmarkerpos "gang_area_1"),["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F","Land_Barracks_01_camo_F"],25]) select 0;
_hideout2 = (nearestObjects[(getmarkerpos "gang_area_2"),["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F","Land_Barracks_01_camo_F"],25]) select 0;
_hideout3 = (nearestObjects[(getmarkerpos "gang_area_3"),["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F","Land_Barracks_01_camo_F"],25]) select 0;
_hideout4 = (nearestObjects[(getmarkerpos "gang_area_5"),["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F","Land_Barracks_01_camo_F"],25]) select 0;

_group1 = _hideout1 getVariable ["gangOwner",grpNull];
_group2 = _hideout2 getVariable ["gangOwner",grpNull];
_group3 = _hideout3 getVariable ["gangOwner",grpNull];
_group4 = _hideout4 getVariable ["gangOwner",grpNull];

if (_group1 isequalto group player) then {_gangbonus = _gangbonus + 7000;};
if (_group2 isequalto group player) then {_gangbonus = _gangbonus + 7000;};
if (_group3 isequalto group player) then {_gangbonus = _gangbonus + 7000;};
if (_group4 isequalto group player) then {_gangbonus = _gangbonus + 7000;};

BANK = BANK + _gangbonus;

if (_gangbonus isequalto 28000) then {
systemchat format['You and your gang captured ALL 4 gang hideouts and receive an additional pay out every 5 minutes of: $ %1',_gangbonus];
	} else {
	if (_gangbonus isequalto 21000) then {
	systemchat format['You and your gang captured 3 gang hideouts and receive an additional pay out every 5 minutes of: $ %1',_gangbonus];
		} else {
			if (_gangbonus isequalto 14000) then {
			systemchat format['You and your gang captured 2 gang hideouts and receive an additional pay out every 5 minutes of: $ %1',_gangbonus];
			}else {
				if (_gangbonus isequalto 7000) then {
				systemchat format['You and your gang captured 1 gang hideout and receive an additional pay out every 5 minutes of: $ %1',_gangbonus];
				}else{
				};
			};
		};
	};
};
} else {
if (playerside isequalto west) then {
private["_hideout1","_hideout2","_hideout3","_hideout4","_gangbonus"];
_gangbonus = 0;

_hideout1 = false;
_hideout2 = false;
_hideout3 = false;
_hideout4 = false;

if(getMarkerColor "gangmarker1" isEqualTo "ColorBlue") then {_hideout1 = true;} else {_hideout1 = false;};
if(getMarkerColor "gangmarker2" isEqualTo "ColorBlue") then {_hideout2 = true;} else {_hideout2 = false;};
if(getMarkerColor "gangmarker3" isEqualTo "ColorBlue") then {_hideout3 = true;} else {_hideout3 = false;};
if(getMarkerColor "gangmarker4" isEqualTo "ColorBlue") then {_hideout4 = true;} else {_hideout4 = false;};

if (_hideout1 isequalto true) then {_gangbonus = _gangbonus + 7000;};
if (_hideout2 isequalto true) then {_gangbonus = _gangbonus + 7000;};
if (_hideout3 isequalto true) then {_gangbonus = _gangbonus + 7000;};
if (_hideout4 isequalto true) then {_gangbonus = _gangbonus + 7000;};

BANK = BANK + _gangbonus;

if (_gangbonus isequalto 28000) then {
systemchat format['You and the police force secured ALL 4 gang hideouts and receive an additional pay out every 5 minutes of: $ %1',_gangbonus];
	} else {
	if (_gangbonus isequalto 21000) then {
	systemchat format['You and the police force secured 3 gang hideouts and receive an additional pay out every 5 minutes of: $ %1',_gangbonus];
		} else {
			if (_gangbonus isequalto 14000) then {
			systemchat format['You and the police force secured 2 gang hideouts and receive an additional pay out every 5 minutes of: $ %1',_gangbonus];
			}else {
				if (_gangbonus isequalto 7000) then {
				systemchat format['You and the police force secured 1 gang hideout and receive an additional pay out every 5 minutes of: $ %1',_gangbonus];
				}else{
				};
			};
		};
	};
};
};

[] call life_fnc_saveGear;
[] call SOCK_fnc_updateRequest;
hint parseText format["<t color='#FF0000'><t align='center'><t size='1'>GAME AUTOSAVED"];
};


