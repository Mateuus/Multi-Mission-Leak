/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Switches the stance and shooting mode of a sharpshooter
*/

player removeAction DS_copAction1;
player removeAction DS_copAction2;
player removeAction DS_copAction3;
player removeAction DS_copAction4;
player removeAction DS_copAction5;

DS_copAction1 = player addAction ["<t color='#FF8000'>Switch Stance</t>",{DS_sharpShooterAction = true;},[],1001,false,false,"",
	'(!DS_sharpShooterAction) && {(player getVariable ["policeSquad",""]) isEqualTo "Sharp Shooter"}'];

DS_copAction2 = player addAction ["<t color='#FF8000'>Switch to Mode (Lethal)</t>",DS_cop_switchStance,[1],1001,false,false,"",
	'((DS_sharpShooter == 0)||(DS_sharpShooter == 2)) && {(player getVariable ["policeSquad",""]) isEqualTo "Sharp Shooter"} && {DS_sharpShooterAction}'];

DS_copAction3 = player addAction ["<t color='#FF8000'>Switch to Mode (Injure)</t>",DS_cop_switchStance,[2],1001,false,false,"",
	'((DS_sharpShooter == 0)||(DS_sharpShooter == 1)) && {(player getVariable ["policeSquad",""]) isEqualTo "Sharp Shooter"} && {DS_sharpShooterAction}'];

DS_copAction4 = player addAction ["<t color='#FF8000'>Switch to Normal Mode</t>",DS_cop_switchStance,[0],1001,false,false,"",
	'((DS_sharpShooter == 2)||(DS_sharpShooter == 1)) && {(player getVariable ["policeSquad",""]) isEqualTo "Sharp Shooter"} && {DS_sharpShooterAction}'];

DS_copAction5 = player addAction ["<t color='#FF8000'>Pack Go Kart</t>",DS_fnc_packItem,["C_Kart_01_Blu_F","Portable Kart",civilian,"goKart"],1001,false,false,"",
	'(!isNull cursorTarget) && {(typeOf cursorTarget) isEqualTo "C_Kart_01_Blu_F"} && {(player distance cursorTarget) < 3} && {(DS_currentWeight + (["goKart",1] call DS_fnc_itemWeight)) <= DS_maxWeight}'];