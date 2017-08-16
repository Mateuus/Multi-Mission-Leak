private["_control","_muellneu","_vehicle","_nearVehicles","_price2"];

if(playerSide in [west,independent]) exitWith {hint "Du bist im dienst!";};

if(!DarfMuell) exitWith {hint localize "STR_NOTF_Muell";};
if(DarfMuell) then {
	DarfMuell = false;
	[] spawn {
		sleep 15;
		DarfMuell = true;
	};
};

_muellneu = nearestObjects[getPos muellneu,["Land_MetalBarrel_F"],8] select 0;

if(isNil "_muellneu") exitWith {titleText["Du musst schon müll vorbei bringen damit es Kohle gibt","PLAIN"];};

ES_cash = ES_cash + 15000;

titleText["Du hast eine Mülltone abgeliefert","PLAIN"];



deleteVehicle _muellneu;