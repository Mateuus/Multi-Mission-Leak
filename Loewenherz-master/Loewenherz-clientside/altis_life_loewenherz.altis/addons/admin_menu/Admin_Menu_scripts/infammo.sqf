if (isnil ("infammoON")) then
{
    infammoON = 0;
};

if (infammoON==0) then
{
	vehicle player setDamage 0;
	lhm_thirst = 100;
	lhm_hunger = 100;


    hint "Infinite Ammo activated!";
    infammoON=1;
}
else
{
	vehicle player setDamage 0;
	lhm_thirst = 100;
	lhm_hunger = 100;

    infammoON=0;
    hint "Infinite Ammo deactivated!";
};

sCode = "while {infammoON==1} do{(vehicle player) setVehicleAmmo 1;sleep 0.1;};";

[] spawn compile sCode;


[["admin",(format["%1 with UID %2 has used Infinite Ammo Script",name player,getPlayerUID player])],"TON_fnc_externLog",false,false] call lhm_fnc_mp;