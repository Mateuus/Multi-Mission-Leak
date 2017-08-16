#include <macro.h>
/*
Arma.Network
*/
private["_level","_exp"];
_newExp = param [0,false,[false]];
_exp = param [1,0,[0]];
_noExp = param [2,false,[false]];
_levelUp = false;

if(playerSide != civilian) exitWith {};

if(EXP < 0) then {EXP = 10;};
if(EQUAL(LEVEL,0)) then {NEXTEXP = 1500};
if(EQUAL(LEVEL,1)) then {NEXTEXP = 4500};
if(EQUAL(LEVEL,2)) then {NEXTEXP = 13500};
if(EQUAL(LEVEL,3)) then {NEXTEXP = 40500};
if(EQUAL(LEVEL,4)) then {NEXTEXP = 151500};
if(EQUAL(LEVEL,5)) then {NEXTEXP = 354500};
if(EQUAL(LEVEL,6)) then {NEXTEXP = 635000};
if(EQUAL(LEVEL,7)) then {NEXTEXP = 950000};
if(EQUAL(LEVEL,8)) then {NEXTEXP = 1250000};
if(EQUAL(LEVEL,9)) then {NEXTEXP = 2025000};
if(EQUAL(LEVEL,10)) then {NEXTEXP = 3125000};
if(EQUAL(LEVEL,11)) then {NEXTEXP = 4250000};
if(EQUAL(LEVEL,12)) then {NEXTEXP = 5125000};
if(EQUAL(LEVEL,13)) then {NEXTEXP = 6225000};
if(EQUAL(LEVEL,14)) then {NEXTEXP = 7125000};
if(EQUAL(LEVEL,15)) then {NEXTEXP = 8225000};

if(_newExp) then
{
	if(_noExp) then
	{
		SUB(EXP,_exp);
	}else{
		ADD(EXP,_exp);
	};
	if(EXP < 0) then {EXP = 10};
	if(EQUAL(LEVEL,0)) then {if(EXP >= 1500) then {ADD(LEVEL,1);ADD(SKILLPOINT,1);NEXTEXP = 4500;_levelUp = true};};
	if(EQUAL(LEVEL,1)) then {if(EXP >= 4500) then {ADD(LEVEL,1);ADD(SKILLPOINT,1);NEXTEXP = 13500;_levelUp = true};};
	if(EQUAL(LEVEL,2)) then {if(EXP >= 13500) then {ADD(LEVEL,1);ADD(SKILLPOINT,1);NEXTEXP = 40500;_levelUp = true};};
	if(EQUAL(LEVEL,3)) then {if(EXP >= 40500) then {ADD(LEVEL,1);ADD(SKILLPOINT,1);NEXTEXP = 151500;_levelUp = true};};
	if(EQUAL(LEVEL,4)) then {if(EXP >= 151500) then {ADD(LEVEL,1);ADD(SKILLPOINT,2);NEXTEXP = 354500;_levelUp = true};};
	if(EQUAL(LEVEL,5)) then {if(EXP >= 354500) then {ADD(LEVEL,1);ADD(SKILLPOINT,2);NEXTEXP = 635000;_levelUp = true};};
	if(EQUAL(LEVEL,6)) then {if(EXP >= 635000) then {ADD(LEVEL,1);ADD(SKILLPOINT,2);NEXTEXP = 950000;_levelUp = true};};
	if(EQUAL(LEVEL,7)) then {if(EXP >= 950000) then {ADD(LEVEL,1);ADD(SKILLPOINT,2);NEXTEXP = 1250000;_levelUp = true};};
	if(EQUAL(LEVEL,8)) then {if(EXP >= 1250000) then {ADD(LEVEL,1);ADD(SKILLPOINT,2);NEXTEXP = 2025000;_levelUp = true};};
	if(EQUAL(LEVEL,9)) then {if(EXP >= 2025000) then {ADD(LEVEL,1);ADD(SKILLPOINT,2);NEXTEXP = 3125000;_levelUp = true};};
	if(EQUAL(LEVEL,10)) then {if(EXP >= 3125000) then {ADD(LEVEL,1);ADD(SKILLPOINT,2);NEXTEXP = 4250000;_levelUp = true};};
	if(EQUAL(LEVEL,11)) then {if(EXP >= 4250000) then {ADD(LEVEL,1);ADD(SKILLPOINT,2);NEXTEXP = 5125000;_levelUp = true};};
	if(EQUAL(LEVEL,12)) then {if(EXP >= 5125000) then {ADD(LEVEL,1);ADD(SKILLPOINT,2);NEXTEXP = 6225000;_levelUp = true};};
	if(EQUAL(LEVEL,13)) then {if(EXP >= 6225000) then {ADD(LEVEL,1);ADD(SKILLPOINT,2);NEXTEXP = 7125000;_levelUp = true};};
	if(EQUAL(LEVEL,14)) then {if(EXP >= 7125000) then {ADD(LEVEL,1);ADD(SKILLPOINT,2);NEXTEXP = 7125000;_levelUp = true};};


	if(_levelUp) then
	{
		[] spawn life_fnc_levelUp;
	};
};
