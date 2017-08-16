/* 

	Author Shinji
	
*/
//Man muss auf trolle aufpassen... 

while {heli_schule_prog} do {
if (! (alive player)) then { heli_schule_prog = false; heli_schule_gesch = false;};
if (vehicle player == player ) then { heli_schule_prog = false; heli_schule_gesch = false;};
if ((getDammage heli1) >= 0.05) then { heli_schule_prog = false; heli_schule_gesch = false;};
sleep 1;
};

	license_heli_in_use =  false;
	publicVariable "license_heli_in_use";