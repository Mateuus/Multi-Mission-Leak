if(vehicle player !=  player) exitWith {["Can't do this in a vehicle!",false,"slow"] call life_fnc_notificationSystem;};
_vehicle = createVehicle ["C_Kart_01_F", position player, [], 0, "NONE"];
waitUntil {!isNil "_vehicle"}; //Warten
player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
[player,"repair"] remoteexeccall ["say3D",0];
[_vehicle] call life_fnc_clearVehicleAmmo;

_vehicle disableTIEquipment true;

kart_placed = 1;
[false,"gokart",1] call life_fnc_handleInv;
[0] call SOCK_fnc_updatePartial;

if (kart_placed == 1) then {
	_vehicle addAction["Destroy your gokart",{deleteVehicle cursorObject},cursorObject,-1,false,false,"",'!isNull cursorObject && (player distance cursorObject) < 4 && (typeOf cursorObject) == "C_Kart_01_F" '];
	//[true,"gokart",1] call life_fnc_handleInv;
	kart_placed = 0;
};
