/*
			Author: Shawn "Huntah" Macgillivray
	
			Description:
			releases the civ from jail
*/



if(!DS_jailed)exitwith{};

DS_jailRelease = true;

if(_this select 1)exitwith
	{
	player setdamage 0;
	DS_jailed = false;
	[] spawn DS_fnc_removeCharges;
	[] call DS_fnc_compileData;
	player addItem "ItemMap";
	player assignItem "ItemMap";
	DS_bailValue = 0;
	hint "An Admin has released you from jail";
	[[0,format["%1 has been released from jail by the admins", name player]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
	systemchat "An Admin has released you from jail";
	player setPos (getMarkerPos "jail_release");
	};


player setdamage 0;
DS_jailed = false;
[] spawn DS_fnc_removeCharges;
[] call DS_fnc_compileData;
player addItem "ItemMap";
player assignItem "ItemMap";
DS_bailValue = 0;
hint "The police have released you from jail";
[[0,format["%1 has been released from jail by the police", name player]],"DS_fnc_globalMessage",true,false] spawn BIS_fnc_MP;
systemchat "The police have released you from jail";
player setPos (getMarkerPos "jail_release");
