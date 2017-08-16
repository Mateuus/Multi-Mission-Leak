private["_handle"];

if(playerside != civilian) exitWith {};

if(life_exp < 0) then {life_exp = 50};
if(life_exp >= 50 && life_exp < 1500) then {life_level = 1};
if(life_exp >= 1500 && life_exp < 5000) then {life_level = 2};
if(life_exp >= 5000 && life_exp < 10000) then {life_level = 3};
if(life_exp >= 10000 && life_exp < 25000) then {life_level = 4};
if(life_exp >= 25000 && life_exp < 50000) then {life_level = 5};
if(life_exp >= 50000 && life_exp < 100000) then {life_level = 6};
if(life_exp >= 100000 && life_exp < 350000) then {life_level = 7};
if(life_exp >= 350000 && life_exp < 750000) then {life_level = 8};
if(life_exp >= 750000 && life_exp < 1300000) then {life_level = 9};
if(life_exp >= 1300000 && life_exp < 2000000) then {life_level = 10};
if(life_exp >= 2000000 && life_exp < 3000000) then {life_level = 11};
if(life_exp >= 3000000 && life_exp <= 3100000) then {life_level = 12};
if(life_exp > 3100000) then {life_level = 12; life_exp = 3100000};

[] spawn life_fnc_hudUpdate;

if(life_firstspawn) exitWith {
if(life_level >= 1) then {level1 = true;};
if(life_level >= 2) then {level2 = true;};
if(life_level >= 3) then {level3 = true;};
if(life_level >= 4) then {level4 = true;};
if(life_level >= 5) then {level5 = true;};
if(life_level >= 6) then {level6 = true;};
if(life_level >= 7) then {level7 = true;};
if(life_level >= 8) then {level8 = true;};
if(life_level >= 9) then {level9 = true;};
if(life_level >= 10) then {level10 = true;};
if(life_level >= 11) then {level11 = true;};
if(life_level == 12) then {level12 = true;};
};

if(life_level == 1 && !level1) then {[9] spawn life_fnc_levelAnnounce;};
if(life_level == 2 && !level2) then {[0] spawn life_fnc_levelAnnounce;};
if(life_level == 3 && !level3) then {[1] spawn life_fnc_levelAnnounce;};
if(life_level == 4 && !level4) then {[2] spawn life_fnc_levelAnnounce;};
if(life_level == 5 && !level5) then {[3] spawn life_fnc_levelAnnounce;};
if(life_level == 6 && !level6) then {[4] spawn life_fnc_levelAnnounce;};
if(life_level == 7 && !level7) then {[5] spawn life_fnc_levelAnnounce;};
if(life_level == 8 && !level8) then {[6] spawn life_fnc_levelAnnounce;};
if(life_level == 9 && !level9) then {[7] spawn life_fnc_levelAnnounce;};
if(life_level == 10 && !level10) then {[8] spawn life_fnc_levelAnnounce;};
if(life_level == 11 && !level11) then {[10] spawn life_fnc_levelAnnounce;};
if(life_level == 12 && !level12) then {[11] spawn life_fnc_levelAnnounce;};