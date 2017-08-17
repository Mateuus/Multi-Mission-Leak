
if!(isNull objectParent player) exitWith {hint "You can not unpack the Airhorn in a vehicle!"};

if(isNull life_airhorn) then {
	life_airhorn = "Land_Airhorn_01_F" createvehicle getpos player;
	life_airhorn attachto [player,[0,0,0.05],"righthand"]; 
	life_airhorn SetVectordirandup [[0,0,2],[0,20,0]];
	
	titleText ["You unpacked the Airhorn.","PLAIN"];
	
	life_airhornaction1 = player addaction ["Use Airhorn",{if(airhorn_played) exitWith {hint "You can only use your Airhorn every 30 seconds."}; airhorn_played = true; [player,"airhorn"] remoteexeccall ["say3D",0]; sleep (1*30); airhorn_played = false;}];
	life_airhornaction2 = player addaction ["Put Airhorn Away",life_fnc_airhorn];

} else {
	
	titleText ["You put the Airhorn away","PLAIN"];
	player removeAction life_airhornaction1;
	player removeAction life_airhornaction2;
	detach life_airhorn;
	deletevehicle life_airhorn;
	life_airhorn = ObjNull;
};