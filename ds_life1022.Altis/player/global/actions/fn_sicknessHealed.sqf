/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
    Heals a sickness from someone
*/

player setVariable ["DS_sick_infection",false,true];
[12] call DS_fnc_alterStats;
player setDamage 0;
systemchat "Your sickness has been treated";
hint "Your sickness has been treated";
player enableFatigue false;