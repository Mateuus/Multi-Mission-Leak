/*
	File: fn_setSkinns.sqf
	Author: CooliMC und cat24max
	
	Description:
	Set Skinnshopeflly Result is more performance
*/

switch(playerSide) do
{
	case west:
	{
		switch(uniform player) do
		{
			case "U_Rangemaster": {
				if (player getVariable "rank" > 3) then {
					systemChat "Diese Uniform ist für deinen Rang nicht geeignet. Sie wurde mit der Korrekten ersetzt.";
					player forceAddUniform "U_B_CombatUniform_mcam";
					if (player getVariable "rank" == 4) then {player setObjectTextureGlobal [0,"skins\human\cop\Lieutenant.paa"]; };
					if (player getVariable "rank" == 5) then {player setObjectTextureGlobal [0,"skins\human\cop\Captain.paa"]; };
					if (player getVariable "rank" == 6) then {player setObjectTextureGlobal [0,"skins\human\cop\Major.paa"]; };
					if (player getVariable "rank" == 7) then {player setObjectTextureGlobal [0,"skins\human\cop\General.paa"]; };
					if (player getVariable "rank" == 8) then {player setObjectTextureGlobal [0,"skins\human\cop\Chief.paa"]; };
					if (player getVariable "rank" == 9) then {player setObjectTextureGlobal [0,"skins\human\cop\Commissioner.paa"]; };
					};
				if (player getVariable "rank" <= 1) then {player setObjectTextureGlobal [0,"skins\human\cop\Rekrut.paa"]; };
				if (player getVariable "rank" == 2) then {player setObjectTextureGlobal [0,"skins\human\cop\Officer.paa"]; };
				if (player getVariable "rank" == 3) then {player setObjectTextureGlobal [0,"skins\human\cop\Sergeant.paa"]; };
			};
			case "U_B_CombatUniform_mcam": {
				if (player getVariable "rank" < 3) then {
					systemChat "Diese Uniform ist für deinen Rang nicht geeignet. Sie wurde mit der Korrekten ersetzt.";
					player forceAddUniform "U_Rangemaster";
					if (player getVariable "rank" <= 1) then {player setObjectTextureGlobal [0,"skins\human\cop\Rekrut.paa"]; };
					if (player getVariable "rank" == 2) then {player setObjectTextureGlobal [0,"skins\human\cop\Officer.paa"]; };
					if (player getVariable "rank" == 3) then {player setObjectTextureGlobal [0,"skins\human\cop\Sergeant.paa"]; };
				};
				if (player getVariable "rank" == 4) then {player setObjectTextureGlobal [0,"skins\human\cop\Lieutenant.paa"]; };
				if (player getVariable "rank" == 5) then {player setObjectTextureGlobal [0,"skins\human\cop\Captain.paa"]; };
				if (player getVariable "rank" == 6) then {player setObjectTextureGlobal [0,"skins\human\cop\Major.paa"]; };
				if (player getVariable "rank" == 7) then {player setObjectTextureGlobal [0,"skins\human\cop\General.paa"]; };
				if (player getVariable "rank" == 8) then {player setObjectTextureGlobal [0,"skins\human\cop\Chief.paa"]; };
				if (player getVariable "rank" == 9) then {player setObjectTextureGlobal [0,"skins\human\cop\Commissioner.paa"]; };
			};

		};
	};
	case independent:
	{
		switch(uniform player) do
		{
			case "U_B_CTRG_1": { player setObjectTextureGlobal [0,"skins\human\medic\medic_uniform.paa"]; };
		};
	
		switch(backpack player) do
		{
			case "B_Kitbag_cbr": { 
				(unitBackpack player) setObjectTextureGlobal [0,"skins\human\medic\adac_backpack.jpg"]; 
			};
			
			case "B_Kitbag_sgg": {
				(unitBackpack player) setObjectTextureGlobal [0,"skins\human\medic\medic_backpack.jpg"];
			};
		};
	};
	case civilian:
	{
		switch (life_gangData select 0) do
		{
			case 398:
			{
				switch(uniform player) do
				{
					case "U_Rangemaster": { player setObjectTextureGlobal [0,"skins\human\civ\qt_uniform.paa"]; };
				};
			};
		};
	};
};