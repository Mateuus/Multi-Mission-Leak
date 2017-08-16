/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
_objectToDelete = cursorObject;
if(isNull _objectToDelete) exitWith {};
if(isPlayer _objectToDelete) exitWith {};
if(_objectToDelete isKindOf "Land" || _objectToDelete isKindOf "Air" || _objectToDelete isKindOf "Ship") then
  {
    deleteVehicle _objectToDelete;
  } else {
    hintSilent "What are you trying to delete??"
};
