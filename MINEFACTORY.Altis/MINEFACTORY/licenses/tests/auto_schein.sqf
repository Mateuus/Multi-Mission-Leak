/*
   Author Shiji
*/
private["_vehicle","_wall","_owners","_test_prog","_passed","_counter","_proof"];
player setpos (getmarkerpos "license_car_positioning");
_vehicle = "C_Offroad_luxe_F" createVehicle (getMarkerPos "car_license_spawn");
_owners = getPlayerUID player;
_vehicle setVariable["vehicle_info_owners",_owners,true];
_wall = "Land_HBarrierWall6_F" createVehicle (getMarkerPos "car_license_spawn_wall");
_wall setdir 90;
_vehicle setdir 90;

sleep 1;
player moveindriver _vehicle;

_test_prog = true;
_passed = false;
_proof = false;
_counter = 0;

while {_test_prog} do{
	//WAND ENTFERNEN
   if ((vehicle player distance (getMarkerPos "car_proofer")) <= 8) then {
       _proof = true;
        deletevehicle _wall;
   };
   //SCHADEN
   if ((getdammage vehicle player) >=0.05 || vehicle player == player) then {
       _test_prog = false;
       deletevehicle _wall;
	   hint "Versuche es nochmal..."; _vehicle setDamage 0.5; sleep 8; deletevehicle _vehicle; deletevehicle _wall; player setPos current_position_p;
					license_car_in_use =  false;
					publicVariable "license_car_in_use";
   };
   //COUNTER
	_counter = _counter + 1;
	hintSilent  format ["Verstrichene Zeit: %1 sek. / 60sek.", _counter];
	if (_counter >= 60) exitwith { hint "Zeit zu ende! Versuche es nochmal..."; _vehicle setDamage 0.5; sleep 8; deletevehicle _vehicle; deletevehicle _wall; player setPos current_position_p;
					_test_prog = false;
					license_car_in_use =  false;
					publicVariable "license_car_in_use";
	};   
   //BESTADEN
   if (((vehicle player distance (getMarkerPos "car_license_spawn_wall")) <= 8) && _proof) then {
       _passed = true;
       _test_prog = false;
	   hint "Du hast es geschafft! Du bekommst deine lizenz jetzt."; _vehicle setDamage 0.5; playsound "made_it"; license_civ_driver = true;
	   sleep 4;
		deletevehicle _vehicle; deletevehicle _wall; player setPos current_position_p;
		license_car_in_use =  false;
		publicVariable "license_car_in_use";

   };
sleep 1;
};