/* 

	Author: Don Richter
	
*/

if(life_musikan) exitwith{hint "Das Megaphone wird bereits benutzt oder die cooldown Zeit ist nocht nicht abgelaufen..."};
life_musikan = true;
[false,"megaphone",1] call life_fnc_handleInv;
[player, "megaphone", 50] call life_fnc_globalsound;
sleep 30;
life_musikan = false; 

