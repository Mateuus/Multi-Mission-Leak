#include "..\..\script_macros.hpp"

if (!alive player) exitWith {}; //Prevent them from opening this for exploits while dead.
createDialog "Life_inv_phone";
disableSerialization;

[] call life_fnc_inv;
