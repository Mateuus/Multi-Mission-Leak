/*

	Opens the PERM manager
	
*/
closeDialog 0;

if (side player == independent || side player == west)exitWith	{hint "Medics und Polizisten haben keine Gruppen"};
EMonkeys_permmanager_admin = false;
EMonkeys_permmanager_player_perms = []; // [player, PERMS]
EMonkeys_permmanager_data_receive_time = time;
EMonkeys_permmanager_permid = "";
EMonkeys_permmanager_permindex = -1;
EMonkeys_permmanager_list_refreshing = false;

if(EMonkeys_dynperm_checkout_running) exitWith
{
	hint "Es werden gerade PERMS geladen. Bitte ein wenig warten.";
};

private["_display","_index"];
disableSerialization;

createDialog "perm_dlg_new";

_display = findDisplay 29550;


switch(playerSide) do
{
	case west: 
	{
		ctrlShow[2050,false]; //Gang Icon
		ctrlShow[2051,false]; //Gang Button
		ctrlShow[2054,false]; //Craft Icon
		ctrlShow[2055,false]; //Craft Button
	};
	case independent:
	{
		ctrlShow[2052,false]; //Wanted Icon
		ctrlShow[2053,false]; //Wanted Button
	};
	case civilian:
	{
		ctrlShow[2052,false]; //Wanted Icon
		ctrlShow[2053,false]; //Wanted Button
	};
	case east:
	{
		ctrlShow[2052,false]; //Wanted Icon
		ctrlShow[2053,false]; //Wanted Button
	};
};

if((call EMonkeys_coplevel) < 3) then
{
	ctrlShow[2406,false]; //Wanted + Button
	ctrlShow[2407,false]; //Wanted + Icon
};

if((call EMonkeys_adminlevel) < 1) then
{
	ctrlShow[2056,false]; //Admin Icon
	ctrlShow[2057,false]; //Admin Button
};



if((call EMonkeys_adminlevel) < 1) then
{
	ctrlShow[2056,false]; //Admin Icon
	ctrlShow[2057,false]; //Admin Button
};



//Populate list with GROUPS
lbClear 2100;

{
	_index = lbAdd[2100, _x select 1];
	lbSetData[2100, _index, _x select 0];
	lbSetValue[2100, _index, _forEachIndex];
}
foreach ([] call EMonkeys_fnc_perms);

//[] call EMonkeys_fnc_permManager_update;

//Trigger UPATE by selecting one item (assuming, there are > 0 groups)
lbSetCurSel[2100, 0];

