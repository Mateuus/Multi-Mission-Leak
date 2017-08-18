/*
    File: README.txt
    Auction House by Fresqo
    CLIENT SIDE CONTENT
	    Copy the vAH client folder into the client side core folder
	    Copy the two hpp dialog files into your dialog folder
		Copy all the jpg files into your textures folder
*/


/* Add the following to your client side Functions.hpp in the Life_Client_Core class section */

	class vAH
	{
		file = "core\vAH";
		class vAH_load;
		class vAH_buy;
		class vAH_reciever;
		class vAH_loadInventory;
		class vAH_sell;
		class vAH_checkItem;
		class vAH_takeBack;
		class vAH_select;
	};
	
	
/* Add the following to your CfgRemoteExec.hpp file */

	F(TON_fnc_vAH_update,SERVER)
	F(TON_fnc_vAH_init,SERVER)
	
	
/* Add the following to your Config_Master.hpp file */

    /* Auction House Settings */
        ah_listing_limit = 2; //Amount of listings per player
        ah_auctioneers[] = { auchouse }; //Object var names of your auctioneers <--- make sure you make an npc and place name in this array
	    ah_percent = 30; // Percentage of tax to pay when selling item.
		ah_time_to_expire = 7; //Time until the listing is expired. in days
		ah_time_to_delete = 3; //Time until the listing is deleted after expiration. in days

	
/* Add the following to your player_inv.hpp */

		class AuctionButton : life_RscButtonMenu {
			idc = 2026;
			text = "$STR_PM_AuctionH";
			onButtonClick = "[] spawn life_fnc_vAH_load;";
			x = 0.1;
			y = 0.70;
			w = (6.25 / 40);
			h = (1 / 25);
		};


/* Add this to your stringtable file in the PM section */

 	<Key ID="STR_PM_AuctionH">
 	    <Original>Auctions</Original>
 	</Key>

	
/* Add the following to your MasterHandler.hpp file in dialog folder */

    #include "AH_vsell.hpp"
    #include "AH_vbuy.hpp"
	
/* Add this to your stringtable file in a new package section */

	<Package name="AH">
	<Key ID="STR_AH_NoItems">
		<Original>There are no items on the Auction House at the moment</Original>
	</Key>
	<Key ID="STR_AH_LoadItems">
		<Original>%5 lots of %3 for $%2 by %1, expires in %4 hours</Original>
	</Key>
	<Key ID="STR_AH_PSelect">
		<Original>Please select an Item</Original>
	</Key>
	<Key ID="STR_AH_gwSelect">
		<Original>Please select a gang to wage war against</Original>
	</Key>
	<Key ID="STR_AH_AHBusy">
		<Original>Auction house is busy at the moment, please try again in a short while!</Original>
	</Key>
	<Key ID="STR_AH_SaleBusy">
		<Original>Someone may be buying or retrieving this item as we speak!</Original>
	</Key>
	<Key ID="STR_AH_Sold">
		<Original>This item has already been sold or expired!</Original>
	</Key>
	<Key ID="STR_AH_Idiot">
		<Original>You cannot purchase your own item idiot!</Original>
	</Key>
	<Key ID="STR_AH_Bought">
		<Original>You bought items from %1 for $%2</Original>
	</Key>
	<Key ID="STR_AH_LogInRec">
		<Original>While you were offline you sold $%1 worth of items at Fat Tony's Shop</Original>
	</Key>
	<Key ID="STR_AH_Block">
		<Original>You cannot retrieve an item that is in your inventory already!</Original>
	</Key>
	<Key ID="STR_AH_TooFar">
	    <Original>You need to be near the auctioneer to do this!</Original>
	</Key>
	</Package>
	
	
/* Add the following to the bottom of core/init.sqf file */

    waitUntil {vAH_loaded};
    private _total = 0;
    private _toDel = [];
    private _uid = getPlayerUID player; 
    {if (((_x select 5) isEqualTo _uid) && ((_x select 7) isEqualTo 2)) then {_total = _total + (_x select 4);_toDel pushBack (_x select 0)};} forEach all_ah_items;
    if (_total > 0) then 
    {
    	{
		    [1,_x] remoteExec ["TON_fnc_vAH_update",RSERV];
	    } forEach _toDel;
	    [0,format[localize "STR_AH_LogInRec",[_total]call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",player];
		BANK = BANK + _total;
    };
	
	
/* When you make your npc (auctioneer) add the following but also remember to add the var names into the LIFE_SETTINGS setting */

this addAction ["Fat Tonys Auctions", {[] spawn life_fnc_vAH_load;},"",0,false,false,"",' vehicle player isEqualTo player && player distance _target < 5 && playerSide isEqualTo civilian '];