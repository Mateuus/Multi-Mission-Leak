private["_handled"];

_handled=false;    
if(isNil "ES_lawnActivate")then{
ES_lawnActivate = true;
};

if(!ES_lawnactivate)then{

ES_lawnactivate=true;
_handled=true;


if(true)exitWith{player removeAction (ES_la);};
};


if(_handled)exitWith{player removeAction (ES_la);};
ES_lea=player addEventHandler["killed",{deleteVehicle ES_lawnmower;}];
ES_la=Player addAction["Rasenmäher ausschalten",{player removeAction ES_la;player removeAction (ES_la-1);call ES_fnc_lawnmower;player removeEventHandler ["killed", (ES_lea)]}];

ES_lawnmower= "Land_PowerGenerator_F" createVehicle [0,0,0];
ES_lawnmower attachTo [player,[0,1,0.5]];

if(ES_lawnactivate && !_handled)then{
ES_lawnactivate=false;
};

//[ES_lawnmower,"lawnmowerstart"] call ES_fnc_createSound; //[source,"sound name"]
//[[ES_lawnmower,"lawnmowerstart"],"ES_fnc_createSound",true,false] spawn ES_fnc_MP;
player say3D "rasenmaherstart";
player forceWalk true;
sleep 1;

while{!ES_lawnactivate}do{
//[[ES_lawnmower],"ES_fnc_createSound",true,false] spawn ES_fnc_MP;
//[ES_lawnmower,"lawnmower"] call ES_fnc_createSound; //[source,"sound name"]
player say3D "rasenmaher";
_g="Land_ClutterCutter_medium_F" createVehicle [0,0,0];
_g setPos (position ES_lawnmower);


sleep 1.9;
};
//[[ES_lawnmower,"lawnmowerstop"],"ES_fnc_createSound",true,false] spawn ES_fnc_MP;
//player say3D "lawnmowerstop";
player say3D "rasenmaherstop";

//[ES_lawnmower,"rasenmaherstop"] call ES_fnc_createSound; //[source,"sound name"]
sleep 1;
deleteVehicle ES_lawnmower;
player forceWalk false;