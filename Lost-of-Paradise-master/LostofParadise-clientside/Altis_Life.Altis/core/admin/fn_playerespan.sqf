/*
	Author: Sebi
	http://www.lostofparadise.de/
*/
titleText ["••• ESP AKTIV •••","PLAIN",1];
sleep 1;
onEachFrame  {         
	{if(side _x != side player) then     
		{drawIcon3D ["", [0.1, 0.1, 255, 2], position _x, 0.1, 0.1, 45, (format ["%2:%1m",player distance _x, name _x]), 1, 0.04, "default"]    }    
	else    
		{drawIcon3D ["", [3, 0, 255, 2], position _x, 0.1, 0.1, 45, (format ["%2:%1m",player distance _x, name _x]), 1, 0.04, "default"]    };   
	} 
	foreach allunits;  
	};
/*
{if(alive _x && isplayer _x) then {
							deleteMarkerLocal str _x;
							_PlrMark = str _x;
							_PlrMark = createMarkerLocal [_PlrMark, getpos _x];
							_PlrMark setMarkerTypeLocal "waypoint";
							_PlrMark setMarkerPosLocal getPos _x;
							_PlrMark setMarkerSizeLocal [0.5,0.5];
							_PlrMark setMarkerTextLocal format['%1',name _x];
							_PlrMark setMarkerColorLocal ("ColorBlue");
							AH_PrevMarkers = AH_PrevMarkers + [_x];
						};
					} forEach allUnits;

{if((_x iskindof "Air" ) || (_x iskindof "Tank") || (_x isKindOf "Land")) then {
							_VehMark = str _x;
							_VehMark = createMarkerLocal [_VehMark, getPos _x];
							_VehMark setMarkerTypeLocal "waypoint";
							_VehMark setMarkerPosLocal getPos _x;
							_VehMark setMarkerSizeLocal [0.5,0.5];
							_VehMark setMarkerTextLocal format['%1',typeOf _x];
							_VehMark setMarkerColorLocal ("ColorBlue");
							AH_PrevMarkers1 = AH_PrevMarkers1 + [_x];
						};	 
					} forEach vehicles;
*/