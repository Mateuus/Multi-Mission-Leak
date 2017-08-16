/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Fixes a players stamina for a number of reasons
*/
private ["_prestigeAmounts","_speed"];

player enableStamina false;
_exit = false;

if(playerside isEqualTo civilian)then {
	DS_prestigeAmounts = ((DS_infoArray select 31) + (DS_infoArray select 32) + (DS_infoArray select 33));
	DS_speed = 1 + (DS_prestigeAmounts*0.025);
	player setAnimSpeedCoef DS_speed;
	if((getAnimSpeedCoef player) > 1.25)then{
		player setAnimSpeedCoef 1.25;
	};
} else {
	if(playerside == west)then {
		if((DS_infoArray select 21) > 22)then {
			player setAnimSpeedCoef 1.1;
		};
		if((DS_infoArray select 21) > 35)then {
			player setAnimSpeedCoef 1.2;
		};
	};
};

if(playerSide isEqualTo west)then {
	if(((player getVariable ["policeSquad",""]) == "Sharp Shooter")&&(DS_sharpShooter != 0))then{player setCustomAimCoef 0.05;_exit = true;};
};
if(_exit)exitwith{};

if((DS_infoArray select 17) > 35)exitwith {
	player setCustomAimCoef 0.2;
	if(DS_realMode)then	 {
		player setCustomAimCoef 0.1;
	};
};

if(DS_moral < 200)exitwith {
	if(DS_medicRevived)then {
		player setCustomAimCoef 0.2;
		if(DS_realMode)then {
			player setCustomAimCoef 0.1;
		};
	} else {
		player setCustomAimCoef 2;
		if(DS_realMode)then	 {
			player setCustomAimCoef 1;
		};
		if((DS_infoArray select 17) > 19)exitwith {
			player setCustomAimCoef 1;
			if(DS_realMode)then	 {
				player setCustomAimCoef 0.5;
			};
		};
	};
};

if(DS_moral < 500)exitwith {
	if(DS_medicRevived)then {
		player setCustomAimCoef 0.2;
		if(DS_realMode)then	 {
			player setCustomAimCoef 0.1;
		};
	} else {
		player setCustomAimCoef 1;
		if(DS_realMode)then	 {
			player setCustomAimCoef 0.5;
		};
		if((DS_infoArray select 17) > 19)exitwith {
			player setCustomAimCoef 0.5;
			if(DS_realMode)then	 {
				player setCustomAimCoef 0.25;
			};
		};
	};
};

if(DS_moral < 750)exitwith {
	if(DS_medicRevived)then {
		player setCustomAimCoef 0.2;
		if(DS_realMode)then {
			player setCustomAimCoef 0.1;
		};
	} else {
		player setCustomAimCoef 0.5;
		if(DS_realMode)then	 {
			player setCustomAimCoef 0.25;
		};
		if((DS_infoArray select 17) > 19)exitwith {
			player setCustomAimCoef 0.25;
			if(DS_realMode)then	 {
				player setCustomAimCoef 0.125;
			};
		};
	};
};

if(DS_moral > 749)exitwith {
	player setCustomAimCoef 0.2;
	if(DS_realMode)then	 {
		player setCustomAimCoef 0.1;
	};
};