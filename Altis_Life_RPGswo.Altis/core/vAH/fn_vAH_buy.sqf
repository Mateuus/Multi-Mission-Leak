#include "..\..\macros.hpp"
/*
	File: fn_vAH_buy.sqf
	Description: buys the item but does some checks and another cool thing
	Author: Fresqo
	returns _id,_seller,_item,_price,_type,_amount,_sellerName
*/
disableSerialization;
private["_d","_e","_dialog","_myListbox","_selectedOffer","_id","_seller","_item","_value","_checkid","_cnt","_status","_online","_pid","_unit","_type","_amount","_diff","_uid","_caller","_handle","_tamount","_iCheck"];
_dialog = findDisplay 15100;
_myListbox = _dialog displayCtrl 15101;
if (lbCurSel _myListbox < 0) exitWith {hint "Bitte wähle ein Item aus!";};
_selectedOffer = call compile (_myListbox lbData (lbCurSel _myListbox));

if (!vAH_loaded) exitWith {hint "Das Auktionshaus ist zurzeit ausgelastet, versuche es später erneut!"};
if (count _selectedOffer == 1) exitWith {};

_id = _selectedOffer select 0;
_seller = _selectedOffer select 1;
_item = _selectedOffer select 2;
_value = _selectedOffer select 3;
_type = _selectedOffer select 4;
_amount = _selectedOffer select 5;
_sellerName = _selectedOffer select 6;
_uid = getPlayerUID player;
_caller = player;
_online = false;
_iCheck = true;

private _licensecheck = true;
private _text = hint "";

_e = missionNamespace getVariable [format["ahItem_%1",_id],false];
if (player getVariable["ahID",0] != _id && !_e) exitWith {hint "Jemand greift gerade auf das Item zu!";};

if (_seller == _uid) exitWith {hint "Du darfst nicht dein eigenes Item kaufen. Wenn du es wiederhaben möchtest, zieh die dein Angebot zurück!";};

{_checkid = _x select 0;if (_checkid == _id) then {_status = _x select 7};}forEach all_ah_items;
if (_status != 0) exitWith {hint "Dieses Item wurde bereits verkauft bzw. ist abgelaufen!";}; //NOT FOR SALE ANYMORE
if (dwf_atmcash < _value) exitWith {hint "Du hast nich genügend Geld auf deinem Bankkonto!";};

switch (_type) do
{
	case 0:
	{
		_diff = [_item,_amount,DWEV_carryWeight,DWEV_maxWeight] call DWEV_fnc_calWeightDiff;
		if(_diff < _amount) then {_iCheck = false;};
	};
	
	case 1:
	{
		if (_amount > 1) then
		{
			_iCheck = [_item,_amount] call DWEV_fnc_vAH_checkItem;
		};
		
		if (!lc_gun) then
		{
			if (_item in
				[
					//Waffen
					"hgun_Pistol_Signal_F","hgun_Rook40_F","hgun_P07_F","hgun_PDW2000_F","hgun_ACPC2_F","hgun_Pistol_01_F","SMG_05_F","hgun_P07_khk_F"
				]					
			) then
			{
				_text = hint "Legale Waffen kannst du nur mit einer Schusswaffenlizenz oder einer Rebellenlizenz kaufen!";
				_licensecheck = if (lc_rebel) then { true; } else { false; };
			};
		};
		
		if (!lc_gun && !lc_rebel) then
		{
			if (_item in
				[
					//Legale Waffen
					"hgun_Pistol_Signal_F","hgun_Rook40_F","hgun_P07_F","hgun_PDW2000_F","hgun_ACPC2_F","hgun_Pistol_01_F","SMG_05_F","hgun_P07_khk_F",
					//Sonstiges
					"SmokeShellGreen","SmokeShellBlue","muzzle_snds_H_khk_F","muzzle_snds_H_snd_F","muzzle_snds_65_TI_ghex_F","muzzle_snds_65_TI_hex_F","muzzle_snds_58_hex_F","muzzle_snds_58_ghex_F",
					//Illegale Waffen
					"arifle_SDAR_F","SMG_02_F","arifle_TRG20_F","arifle_TRG21_F","SMG_01_F","arifle_Katiba_F","arifle_MX_F","arifle_MXC_F","srifle_DMR_01_F",
					"srifle_EBR_F","srifle_DMR_03_khaki_F","srifle_DMR_03_tan_F","srifle_DMR_03_multicam_F","srifle_DMR_03_woodland_F","arifle_CTAR_hex_F","arifle_CTAR_ghex_F","arifle_ARX_ghex_F","arifle_ARX_hex_F",
					"arifle_AKS_F","arifle_SPAR_01_khk_F","arifle_SPAR_03_khk_F","arifle_SPAR_03_snd_F","arifle_AKM_F","arifle_SPAR_01_snd_F","arifle_Mk20C_F","arifle_MX_khk_F","arifle_MXC_khk_F","arifle_MXM_F",
					"arifle_MXM_khk_F"
				]					
			) then
			{
				_text = hint "Du brauchst eine Schusswaffenlizenz oder eine Rebellenlizenz um Waffen kaufen zu können!";
				_licensecheck = false;
			};
		};

		if (!lc_rebel) then
		{
			if (_item in
				[
					//Sonstiges
					"SmokeShellGreen","SmokeShellBlue","muzzle_snds_H_khk_F","muzzle_snds_H_snd_F","muzzle_snds_65_TI_ghex_F","muzzle_snds_65_TI_hex_F","muzzle_snds_58_hex_F","muzzle_snds_58_ghex_F",
					//Waffen
					"arifle_SDAR_F","SMG_02_F","arifle_TRG20_F","arifle_TRG21_F","SMG_01_F","arifle_Katiba_F","arifle_MX_F","arifle_MXC_F","srifle_DMR_01_F",
					"srifle_EBR_F","srifle_DMR_03_khaki_F","srifle_DMR_03_tan_F","srifle_DMR_03_multicam_F","srifle_DMR_03_woodland_F","arifle_CTAR_hex_F","arifle_CTAR_ghex_F","arifle_ARX_ghex_F","arifle_ARX_hex_F",
					"arifle_AKS_F","arifle_SPAR_01_khk_F","arifle_SPAR_03_khk_F","arifle_SPAR_03_snd_F","arifle_AKM_F","arifle_SPAR_01_snd_F","arifle_Mk20C_F","arifle_MX_khk_F","arifle_MXC_khk_F","arifle_MXM_F",
					"arifle_MXM_khk_F"
				]					
			) then
			{
				_text = hint "Um Illegale Gegenstände kaufen zu können, brauchst du eine Rebellenlizenz!";
				_licensecheck = false;
			};
		};
		
		if (!DWEV_OwnedApexDLC) then
		{
			private _ApexItemList = DWEV_SETTINGS(getArray,"_ApexItemList");
			if (_item in _ApexItemList) then
			{
				_text = hint "Du musst das Arma 3 Apex DLC besitzen, um den Gegenstand kaufen zu können!";
				_licensecheck = false;
			};
		};
		
		if (call DWEV_viplevel < 1) then
		{
			private _VIPItemList_LvL_1 = DWEV_SETTINGS(getArray,"VIPItemList_LvL_1");
			if (_item in _VIPItemList_LvL_1) then
			{
				_text = hint "Da du nicht VIP Level 1 hast, darfst du diesen Gegenstand nicht kaufen!";
				_licensecheck = false;
			};
		};
		
		if (call DWEV_viplevel < 2) then
		{
			private _VIPItemList_LvL_2 = DWEV_SETTINGS(getArray,"VIPItemList_LvL_2");
			if (_item in _VIPItemList_LvL_2) then
			{
				_text = hint "Da du nicht VIP Level 2 hast, darfst du diesen Gegenstand nicht kaufen!";
				_licensecheck = false;
			};
		};
		
		if (call DWEV_viplevel < 3) then
		{
			private _VIPItemList_LvL_3 = DWEV_SETTINGS(getArray,"VIPItemList_LvL_3");
			if (_item in _VIPItemList_LvL_3) then
			{
				_text = hint "Da du nicht VIP Level 3 hast, darfst du diesen Gegenstand nicht kaufen!";
				_licensecheck = false;
			};
		};
		
		if (call DWEV_viplevel < 4) then
		{
			private _VIPItemList_LvL_4 = DWEV_SETTINGS(getArray,"VIPItemList_LvL_4");
			if (_item in _VIPItemList_LvL_4) then
			{
				_text = hint "Da du nicht VIP Level 4 hast, darfst du diesen Gegenstand nicht kaufen!";
				_licensecheck = false;
			};
		};
		
		if (call DWEV_viplevel < 5) then
		{
			private _VIPItemList_LvL_5 = DWEV_SETTINGS(getArray,"VIPItemList_LvL_5");
			if (_item in _VIPItemList_LvL_5) then
			{
				_text = hint "Da du nicht VIP Level 5 hast, darfst du diesen Gegenstand nicht kaufen!";
				_licensecheck = false;
			};
		};
	};
};

if !(_iCheck) exitWith {Hint "Dein Inventar ist voll!";};

if !(_licensecheck) exitWith {_text;};

{_checkid = _x select 0;if (_checkid == _id) then {_status = _x select 7};}forEach all_ah_items;
if (_status != 0) exitWith {hint "Dieses Item wurde bereits verkauft bzw. ist abgelaufen!";}; //NOT FOR SALE ANYMORE

dwf_atmcash = dwf_atmcash - _value;

switch (_type) do {
	case 0: {[true,_item,_diff] call DWEV_fnc_handlelnv;};
	case 1: {
	_tamount = _amount + 1;
			for [{_i=0}, {_i<_tamount}, {_i=_i+1}] do
		{
			[_item,true] call DWEV_fnc_handleItem;
		};
	};
};

{if((getPlayerUID _x == _seller) && ((side _x) == civilian)) then {_online = true; _unit = _x};} foreach allPlayers;

if (_online) then {
	[5,_id,0,0,(getMyName),(getPlayerUID player)] remoteexec ["DWF_fnc_vAH_update",2];
	[0,[_item,_value,getPlayerName(_unit)]] remoteexec ["DWEV_fnc_vAH_reciever",_caller];
	[1,[_caller,_value]] remoteexec ["DWEV_fnc_vAH_reciever",_unit];
} else {
	[3,_id,0,0,(getMyName),(getPlayerUID player)] remoteexec ["DWF_fnc_vAH_update",2];
	[0,[_item,_value,_sellerName]] remoteexec ["DWEV_fnc_vAH_reciever",_caller];
};
closeDialog 0;

[1] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;
