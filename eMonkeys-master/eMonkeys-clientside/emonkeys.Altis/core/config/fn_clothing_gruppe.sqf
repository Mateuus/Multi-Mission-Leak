/*
	File: fn_clothing_bruce.sqf
	Author: Bryan "Tonic" Boardwine
	
	Edited by: [noLife]casp0or
	
	Description:
	Master configuration file for VIP Clothing Store.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Gruppen Kleiderladen"];
_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		
	    if((["KSK"] call EMonkeys_fnc_permLevel) > 0 && (player distance (getMarkerPos "SOG") < 60)) then
		{
			_ret pushBack ["U_B_CTRG_1",nil,10000];
			_ret pushBack ["U_B_CTRG_2",nil,10000];
			_ret pushBack ["U_B_CTRG_3",nil,10000];
		};

		if((["LOTSE"] call EMonkeys_fnc_permLevel) > 0 && (player distance (getMarkerPos "markt_5") < 20)) then
		{
			_ret pushBack ["U_C_ShirtSurfer_shorts","LOTSE",3500];
		};
		
		if((["PS"] call EMonkeys_fnc_permLevel) > 0 && (player distance (getMarkerPos "psbase") < 60)) then
		{
			_ret pushBack ["U_B_CombatUniform_mcam","PS",10000];
		};
		
		if((["FF"] call EMonkeys_fnc_permLevel) > 0 && (player distance (getMarkerPos "ff_marker") < 60)) then
		{
			_ret pushBack ["U_IG_Guerrilla_6_1",nil,10000];
		};
		
		if((["soa"] call EMonkeys_fnc_permLevel) > 0 && (player distance (getMarkerPos "soa_maker") < 60)) then
		{
			_ret pushBack ["U_C_Driver_3",nil,10000];
		};
	};
	
	//Hats
	case 1:
	{
		if((["KSK"] call EMonkeys_fnc_permLevel) > 0 && (player distance (getMarkerPos "SOG") < 60)) then
		{
			_ret pushBack ["H_Helmet_Kerry",nil,10000];
			_ret pushBack ["H_Beret_02",nil,10000];
			_ret pushBack ["H_Beret_grn",nil,10000];
			_ret pushBack ["H_CrewHelmetHeli_B",nil,10000];
			_ret pushBack ["H_Shemag_tan",nil,10000];
		};
		
		if((["PS"] call EMonkeys_fnc_permLevel) > 0 && (player distance (getMarkerPos "psbase") < 60)) then
		{
			_ret pushBack ["H_HelmetSpecB_blk",nil,10000];
		};
		
		if((["FF"] call EMonkeys_fnc_permLevel) > 0 && (player distance (getMarkerPos "ff_marker") < 60)) then
		{
			_ret pushBack ["H_Watchcap_camo",nil,10000];
		};
		
		if((["soa"] call EMonkeys_fnc_permLevel) > 0 && (player distance (getMarkerPos "soa_maker") < 60)) then
		{
			_ret pushBack ["H_Bandanna_gry",nil,10000];
		};
	};
	
	//Glasses
	case 2:
	{		
		if((["KSK"] call EMonkeys_fnc_permLevel) > 0 && (player distance (getMarkerPos "SOG") < 60)) then
		{
			_ret pushBack  ["G_Bandanna_khk",nil,1000];
			_ret pushBack  ["G_Bandanna_beast",nil,1000];
		};

		if((["soa"] call EMonkeys_fnc_permLevel) > 0 && (player distance (getMarkerPos "soa_maker") < 60)) then
		{
			_ret pushBack ["G_Bandanna_beast",nil,10000];
		};		
	};
	
	//Vest
	case 3:
	{
	};
	
	//Backpacks
	case 4:
	{
        if((["KSK"] call EMonkeys_fnc_permLevel) > 0 && (player distance (getMarkerPos "SOG") < 60)) then
		{
			_ret pushBack ["B_Carryall_khk",nil,10000];
			_ret pushBack ["B_Carryall_oli",nil,10000];
			_ret pushBack ["B_AssaultPack_blk",nil,10000];
			_ret pushBack ["B_AssaultPack_rgr",nil,10000];
			_ret pushBack ["B_Kitbag_rgr",nil,10000];
		};
		
		if((["soa"] call EMonkeys_fnc_permLevel) > 0 && (player distance (getMarkerPos "soa_maker") < 60)) then
		{
			_ret pushBack ["B_Carryall_cbr",nil,10000];
		};
	};
};
_ret;