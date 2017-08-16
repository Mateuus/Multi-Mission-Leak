/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Clears up dead stuff (Bodies atm)
*/
if(isNull (_this select 0))exitwith{};
if(alive (_this select 0))exitwith{};
(_this select 0) hideObject true;