if(!isNil "LHM_Event_Flagpos")then{


	LHM_Event_Flagpos = nil;
	publicVariable "LHM_Event_Flagpos";



	eventflag1 setPosATL [3655.287598,13113.0458984,-100];
	eventflag2 setPosATL [12651.202148,14397.347656,-100];
	eventflag3 setPosATL [14039.955078,18752.667969,-100];
	eventflag4 setPosATL [14252.862305,16296.251953,-100];
	eventflag5 setPosATL [16822.646484,12712.227539,-100];
	eventflag6 setPosATL [25702.164063,21362.708984,-100];

	deleteMarker "ef1marker";
	deleteMarker "ef2marker";
	deleteMarker "ef3marker";
	deleteMarker "ef4marker";
	deleteMarker "ef5marker";
	deleteMarker "ef6marker";

	titletext["Fahnen und Marker entfernt.","PLAIN"];
[["admin",(format["%1 with UID %2 deactivates the EventFlags",name player,getPlayerUID player])],"TON_fnc_externLog",false,false] call lhm_fnc_mp;

}else{
	getPosATL player;
	LHM_Event_Flagpos = getPosATL player;
	publicVariable "LHM_Event_Flagpos";

	eventflag1 setPosATL [3655.287598,13113.0458984,0];
	eventflag2 setPosATL [12651.202148,14397.347656,0];
	eventflag3 setPosATL [14039.955078,18752.667969,0];
	eventflag4 setPosATL [14252.862305,16296.251953,0];
	eventflag5 setPosATL [16822.646484,12712.227539,0];
	eventflag6 setPosATL [25702.164063,21362.708984,0];



	_ef1marker = createMarker ["ef1marker",position eventflag1];
	_ef1marker setMarkerType "hd_destroy";
	_ef1marker setMarkerColor "ColorBlue";
	_ef1marker setMarkerText "Eventfahne";

	_ef2marker = createMarker ["ef2marker",position eventflag2];
	_ef2marker setMarkerType "hd_destroy";
	_ef2marker setMarkerColor "ColorBlue";
	_ef2marker setMarkerText "Eventfahne";

	_ef3marker = createMarker ["ef3marker",position eventflag3];
	_ef3marker setMarkerType "hd_destroy";
	_ef3marker setMarkerColor "ColorBlue";
	_ef3marker setMarkerText "Eventfahne";

	_ef4marker = createMarker ["ef4marker",position eventflag4];
	_ef4marker setMarkerType "hd_destroy";
	_ef4marker setMarkerColor "ColorBlue";
	_ef4marker setMarkerText "Eventfahne";

	_ef5marker = createMarker ["ef5marker",position eventflag5];
	_ef5marker setMarkerType "hd_destroy";
	_ef5marker setMarkerColor "ColorBlue";
	_ef5marker setMarkerText "Eventfahne";

	_ef6marker = createMarker ["ef6marker",position eventflag6];
	_ef6marker setMarkerType "hd_destroy";
	_ef6marker setMarkerColor "ColorBlue";
	_ef6marker setMarkerText "Eventfahne";
	titletext["Fahnen erstellt und Marker gesetzt.","PLAIN"];
	[["admin",(format["%1 with UID %2 activates the EventFlags",name player,getPlayerUID player])],"TON_fnc_externLog",false,false] call lhm_fnc_mp;
};


