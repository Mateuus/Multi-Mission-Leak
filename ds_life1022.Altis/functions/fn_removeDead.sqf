/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Clears up dead stuff (Bodies atm)
*/

params [["_corpse",objNull,[objNull]]];

if(isNull _corpse)exitWith{};
if(alive _corpse)exitWith{};

_corpse hideObject true;