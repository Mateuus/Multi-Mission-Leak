/*
	Master eventhandler file
*/
"EMonkeys_fnc_MP_packet" addPublicVariableEventHandler {[( _this select 0),(_this select 1)] call EMonkeys_fnc_MPexec;};
player addEventHandler["Killed", {_this spawn EMonkeys_fnc_onPlayerKilled}];
player addEventHandler["handleDamage",{_this call EMonkeys_fnc_handleDamage;}];
player addEventHandler["Respawn", {_this call EMonkeys_fnc_onPlayerRespawn}];

"EMonkeys_packetlist" addPublicVariableEventHandler 
{  
	EMonkeys_packetlistp = [];
	{
		if ((_x select 1) == getPlayerUID player) then 
		{
			EMonkeys_packetlistp pushback _x;
		};
	}forEach EMonkeys_packetlist;
	[] call EMonkeys_fnc_hudUpdate;   
};

player addEventHandler["Take",
{
	_this call EMonkeys_fnc_onTakeItem; 
	_this call EMonkeys_fnc_onTake;

	_text = format ["*** Inventar nehmen | SpielerID: %2 | Name: %3 | Objekt: %4 | %5",_this,getPlayerUID player,name player,typeof (_this select 1),(_this select 2)];
	[[1,_text],"TON_fnc_log",false,false] call EMonkeys_fnc_mp;
	
	eM_leveladd = ["IItem","Nehmen"];
	[] call SOCK_fnc_updateRequest;
}];

player addEventHandler["Fired",{_this call EMonkeys_fnc_onFired;} ];
player addEventHandler["InventoryOpened", {_this call EMonkeys_fnc_inventoryOpened; eM_leveladd = ["Inventory","Öffnen"];}];
"EMonkeys_fnc_MP_packet" addPublicVariableEventHandler {[_this select 0,_this select 1] call EMonkeys_fnc_MPexec;};

player addEventHandler["Put",
{
	_text = format ["*** Inventar legen | SpielerID: %2 | Name: %3 | Objekt: %4 | %5",_this,getPlayerUID player,name player,typeof (_this select 1),(_this select 2)];
	[[1,_text],"TON_fnc_log",false,false] call EMonkeys_fnc_mp;
	
	eM_leveladd = ["IItem","ablegen"];
	[] call SOCK_fnc_updateRequest;
}];

