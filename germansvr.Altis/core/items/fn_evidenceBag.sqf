/*
 @Author: SimZor
 @Description: Removes objects on the ground
 @Last edited:
*/
if (vehicle player isEqualTo player) then // Makes sure it's a player
{
 {
 deleteVehicle _x;
 } forEach nearestObjects [getpos player,["WeaponHolder","GroundWeaponHolder","WeaponHolderSimulated"],3];
};
[] spawn {
 hint "Putting ammo and weapons in the bag within a 3 meter radius.";
};