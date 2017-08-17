
private["_prizeitemsspecial1","_ressource"];

_prizeitemsspecial1 = [

	"goldenbarz3",
	"volleyball",
	"airhorn"	
];

_ressource = _prizeitemsspecial1 select floor random count _prizeitemsspecial1;
//[_ressource,1] call life_fnc_handleInv;
[true,_ressource,1] call life_fnc_handleInv;

[player,"prize"] remoteexeccall ["say3D",0];
["you have been given a prize, check your inventory!",false,"slow"] call life_fnc_notificationSystem;