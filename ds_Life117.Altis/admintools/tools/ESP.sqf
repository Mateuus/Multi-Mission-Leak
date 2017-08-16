//<MAP ESP>

//diag_log format["ESP activated by %1",(name player)];
if ((getPlayerUID player) in ["76561198132386162","76561198004047579"]) exitwith {hint 'inappropriate admin level';};
marker_mapesp = true;
//Alle Vehicle
list_vec = (allMissionObjects "Plane")+(allMissionObjects "LandVehicle")+(allMissionObjects "Helicopter")+(allMissionObjects "Ship");
//<-----GLOBAL-VARIABLE----->

//hint "Adding Markers on the map";

while {marker_mapesp} do
{    
    //<-----PLAYER-MARKER----->
    //<----------------------->
    //<-----PLAYER-MARKER----->
    unitList_player = allUnits; //getting all units
    totalunits = count unitList_player;
    //hint format["%1", totalunits];
    
    o = 0;
    yo = 0;

    for "o" from 0 to totalunits do
    {
        actualunit = unitList_player select o; //Player1
        //hint format["%1", actualunit];
        
        if ( isplayer actualunit && alive actualunit ) then 
        {
            deleteMarkerLocal ("Player" + (str o));
            yo = o + 1;
            deleteMarkerLocal ("Player" + (str yo));
                
            namePlayer = "";
            namePlayer = name actualunit;
        
            mark_player = "Player" + (str o); //Player0, Player1, Player2
            mark_player = createMarkerLocal [mark_player,getPos actualunit];
            mark_player setMarkerTypeLocal "waypoint";
            mark_player setMarkerPosLocal (getPos actualunit);
            mark_player setMarkerColorLocal "ColorBlue";
            mark_player setMarkerTextLocal format ["%1",namePlayer];
        };
    };    
    //bit of sleep
    sleep 0.1;
};

k = 0;
for "k" from 0 to 2000 do
{
    deleteMarkerLocal ("Player"+ (str k));
    deleteMarkerLocal ("Vehicle"+ (str k));
};