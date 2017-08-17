
if!(isNull objectParent player) exitWith {hint "You can not unpack the megaphone in a vehicle!"};

if(isNull life_megaphone) then {
	life_megaphone = "Land_PortableLongRangeRadio_F" createvehicle getpos player;
	life_megaphone attachto [player,[0,0,0.05],"righthand"]; 
	life_megaphone SetVectordirandup [[0,0,2],[0,20,0]];
	
	titleText ["You unpacked the megaphone.","PLAIN"];
	
	life_megaphoneaction1 = player addaction ["Use megaphone",{if(megaphone_played) exitWith {hint "You can only use your megaphone every 30 seconds."}; megaphone_played = true; [player,"megaphone"] remoteexeccall ["say3D",0]; sleep (1*30); megaphone_played = false;}];
	life_megaphoneaction2 = player addaction ["Put megaphone Away",life_fnc_megaphone];

} else {
	
	titleText ["You put the megaphone away","PLAIN"];
	player removeAction life_megaphoneaction1;
	player removeAction life_megaphoneaction2;
	detach life_megaphone;
	deletevehicle life_megaphone;
	life_megaphone = ObjNull;
};