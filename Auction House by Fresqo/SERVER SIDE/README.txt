/*
    File: README.txt
    Auction House by Fresqo
    SERVER SIDE CONTENT
	Copy the server side vAH folder into the server side Functions folder
*/


/* Add the following to the config.cpp file in the TON_System class section */

		class vAH
		{
			file = "\life_server\Functions\vAH";
			class vAH_init;
			class vAH_update;
		};
	
	
/* Add the following to your init.sqf file server side after houses init before life_server_isReady part */

    all_ah_items = [];
    publicVariable "all_ah_items";
    [] spawn TON_fnc_vAH_init;
    [] spawn 
    {
    	while {true} do
    	{
    	sleep (20 * 60);
    	if (count all_ah_items > 0) then 
		    {
    			[] spawn TON_fnc_vAH_update;
		    };
	    };
    };