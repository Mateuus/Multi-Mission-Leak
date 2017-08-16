
_vehicle = _this select 0;

_vehicle setobjecttextureglobal [0,""]; 
_vehicle setobjecttextureglobal [1,""]; 
_rollator = "Land_PalletTrolley_01_yellow_F" createvehicle [0,0,0];
_rollatorreifen1 = "Land_helicopterwheels_01_disassembled_F" createvehicle [0,0,0];
_rollatorreifen2 = "Land_helicopterwheels_01_disassembled_F" createvehicle [0,0,0];
_rollatorlicht = "Land_portablehelipadlight_01_F" createvehicle [0,0,0];
_rollatorstuhl = "Land_CampingChair_V1_F" createvehicle [0,0,0];

_rollatorreifen1 attachto[_vehicle,[0,0.2,-1.3]]; 
_rollatorreifen2 attachto[_vehicle,[0,-0.9,-1.3]];
_rollatorreifen2 setdir 180;
_rollatorlicht attachto [_vehicle,[0,0.3,-0.25]];
_rollatorstuhl attachto[_vehicle,[0,-0.3,-0.8]]; 
_rollatorstuhl setdir 180;
_rollator attachto [_vehicle,[0,-0.3,-0.8]];  
_rollator setdir 90;