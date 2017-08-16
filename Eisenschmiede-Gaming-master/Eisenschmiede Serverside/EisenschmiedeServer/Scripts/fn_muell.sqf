private["_control","_muell","_vehicle","_nearVehicles","_price2"];

if(playerSide in [west,independent]) exitWith {hint "Du bist im dienst!";};

if(!DarfMuell) exitWith {hint localize "STR_NOTF_Muell";};
if(DarfMuell) then {
	DarfMuell = false;
	[] spawn {
		sleep 15;
		DarfMuell = true;
	};
};

_muell = nearestObjects[getPos muell,["Land_GarbageContainer_closed_F"],8] select 0;

if(isNil "_muell") exitWith {titleText["Du musst schon müll vorbei bringen damit es Kohle gibt","PLAIN"];};

ES_cash = ES_cash + 50000;

titleText["Du hast eine Mülltone abgeliefert","PLAIN"];



deleteVehicle _muell;