/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
    Locks/Unlocks a vehicle globally
*/

if(!DS_canWork)exitwith{hint "You've used this too recently, you must wait. If your garage is taking a long time to load just wait, this is caused by server lag and players with a large number of vehicles in their garages"};
DS_canWork = false;
DS_vehicleGarage = [];
hint "Garage reloaded\n\nOpen the garage list and wait until your vehicles are retrieved from the database";
closeDialog 0;
sleep 30;
DS_canWork = true;