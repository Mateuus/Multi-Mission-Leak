if(!([false,"lockpick",1] call life_fnc_handleInv)) exitWith {hint "Vous n'avez pas les outils !"};
if((vehicle player) != player) exitWith {hint "Pas dans les véhicules"};
player setVariable["restrained",FALSE,TRUE];
player setVariable["Escorting",FALSE,TRUE];
player setVariable["transporting",FALSE,TRUE];
detach player;