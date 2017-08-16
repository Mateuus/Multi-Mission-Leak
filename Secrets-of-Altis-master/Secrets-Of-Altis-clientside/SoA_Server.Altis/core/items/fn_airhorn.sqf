
if!(isNull objectParent player) exitWith {hint "Du kannst das Airhorn im Fahrzeug nicht auspacken!"};

if(isNull life_airhorn) then {
	life_airhorn = "Land_Airhorn_01_F" createvehicle getpos player;
	life_airhorn attachto [player,[0,0,0.05],"righthand"]; 
	life_airhorn SetVectordirandup [[0,0,2],[0,20,0]];
	
	titleText ["Du hast das Airhorn ausgepackt.","PLAIN"];
	
	life_airhornaction1 = player addaction ["Airhorn benutzen",{if(airhorn_played) exitWith {hint "Du kannst das Airhorn nur alle 5 Minuten ausführen."}; airhorn_played = true; [player,"airhorn"] remoteexeccall ["say3D",0]; sleep (5*60); airhorn_played = false;}];
	life_airhornaction2 = player addaction ["Airhorn wegpacken",life_fnc_airhorn];

} else {
	
	titleText ["Du hast das Airhorn weggepackt.","PLAIN"];
	player removeAction life_airhornaction1;
	player removeAction life_airhornaction2;
	detach life_airhorn;
	deletevehicle life_airhorn;
	life_airhorn = ObjNull;
};