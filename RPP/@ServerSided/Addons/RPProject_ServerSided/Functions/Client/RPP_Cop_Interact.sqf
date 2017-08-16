/*
Script File Author: Repentz
Script File Mod: Life Server
Script File: RPP_Cop_Interact.sqf

Description:
Interact with other players
*/
["RPP_Police_Handcuff_KeyBind", {
	private ["_target"];
	_target = cursorTarget;

	if (["Handcuff"] call RPP_Inventory_Count == 0) exitWith {
		_msg = "You don't have any handcuffs";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	if (!(_target isKindOf "man")) exitWith {};
	if (player distance _target > 5) exitWith {};

	[[player], "RPP_Police_Handcuff_Get_KeyBind", _Target] call BIS_FNC_MP;

	if (!(_Target getVariable "RPP_Handcuff")) then {
		_msg = "You just Handcuffed him!";
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;
	};
}] call RPP_Function;
publicVariable "RPP_Police_Handcuff_KeyBind";

["RPP_Police_Handcuff_Get_KeyBind", {
	private ["_vehp"];
 	if (RPP_isCop) exitWith {};
 	if (player getVariable "RPP_Handcuff") exitWith {};
	player setVariable ["RPP_Handcuff",true,true];
	removeAllActions player;
	_msg = "You have been Handcuffed!";
	_color = RPP_Yellow;
	[_msg,_color] call RPP_MessageSystem;
	while {player getVariable "RPP_Handcuff"} do {
		player playmove "AmovPercMstpSnonWnonDnon_Ease";
		_vehp = vehicle player;
		waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getvariable "RPP_Handcuff") || vehicle player != _vehp};

		if (!Alive player) exitWith {
			player setVariable ["RPP_Handcuff",false,true];
		};
		if(vehicle player != player) then
		{
			if (driver (vehicle player) == player) then {
				player action["eject",vehicle player];
			};
		};
	};
}] call RPP_Function;
publicVariable "RPP_Police_Handcuff_Get_KeyBind";

["RPP_Police_Handcuff", {
	private ["_target"];
	_target = cursorTarget;

	if (["Handcuff"] call RPP_Inventory_Count == 0) exitWith {
		_msg = "You don't have any handcuffs";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	if (!(_target isKindOf "man")) exitWith {};
	if (player distance _target > 5) exitWith {
		_msg = "To far away!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	[[player], "RPP_Police_Handcuff_Get", _Target] call BIS_FNC_MP;

	if (!(_Target getVariable "RPP_Handcuff")) then {
		_msg = "You just Handcuffed him!";
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;
	} else {
		_msg = "You just released him!";
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;
	};
}] call RPP_Function;
publicVariable "RPP_Police_Handcuff";

["RPP_Police_Handcuff_Get", {
	private ["_cop","_vehp"];
 	if (RPP_isCop) exitWith {};
	_cop = _this select 0;
	if (player getVariable "RPP_Handcuff") exitWith {
		player setVariable ["RPP_Handcuff",false,true];
		player switchmove "Normal";
		_msg = "You have been uncuffed!";
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;

		[] call RPP_Client_Actions;
		[] call RPP_S_Actions;
	};
	player setVariable ["RPP_Handcuff",true,true];
	removeAllActions player;
	_msg = "You have been Handcuffed!";
	_color = RPP_Yellow;
	[_msg,_color] call RPP_MessageSystem;
	while {player getVariable "RPP_Handcuff"} do {
		player playmove "AmovPercMstpSnonWnonDnon_Ease";
		_vehp = vehicle player;
		waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getvariable "RPP_Handcuff") || vehicle player != _vehp};

		if (!Alive player) exitWith {
			player setVariable ["RPP_Handcuff",false,true];
		};
		if(vehicle player != player) then
		{
			if (driver (vehicle player) == player) then {
				player action["eject",vehicle player];
			};
		};
	};
}] call RPP_Function;
publicVariable "RPP_Police_Handcuff_Get";


["RPP_Police_LegCuff", {
	private ["_target"];
	_target = cursorTarget;

	if (["Handcuff"] call RPP_Inventory_Count == 0) exitWith {
		_msg = "You don't have any cuffs";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	if (!(_target isKindOf "man")) exitWith {};
	if (player distance _target > 5) exitWith {
		_msg = "To far away!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_target getVariable "RPP_Handcuff") exitWith {
		_msg = "He is already handcuffed!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	[[player], "RPP_Police_LegCuff_Get", _Target] call BIS_FNC_MP;

	if (!(_Target getVariable "RPP_Legcuff")) then {
		_msg = "You just leg cuffed him!";
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;
	} else {
		_msg = "You just UnLeg cuffed him!";
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;
	};
}] call RPP_Function;
publicVariable "RPP_Police_LegCuff";

["RPP_Police_LegCuff_Get", {
	private ["_cop","_vehp"];
 	if (RPP_isCop) exitWith {};
	_cop = _this select 0;
	if (player getVariable "RPP_Legcuff") exitWith {
		player setVariable ["RPP_Legcuff",false,true];
		player forceWalk false;
		player switchmove "Normal";
		_msg = "You have been uncuffed!";
		_color = RPP_Yellow;
		[_msg,_color] call RPP_MessageSystem;

		[] call RPP_Client_Actions;
		[] call RPP_S_Actions;
	};
	player setVariable ["RPP_Legcuff",true,true];
	removeAllActions player;
	_msg = "You have been Leg cuffed!";
	_color = RPP_Yellow;
	[_msg,_color] call RPP_MessageSystem;

	while {player getVariable "RPP_Legcuff"} do {
		player forceWalk true;

		if (!Alive player) exitWith {
			player setVariable ["RPP_Legcuff",false,true];
			player forceWalk false;
		};
		if(vehicle player != player) then
		{
			if (driver (vehicle player) == player) then {
				player action["eject",vehicle player];
			};
		};
		sleep 1;
	};
}] call RPP_Function;
publicVariable "RPP_Police_LegCuff_Get";

["RPP_Police_Drag", {
	private ["_target"];
	_target = cursorTarget;
	if (player distance _target > 10) exitWith {
		_msg = "To far away from the player!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (!(_target isKindOf "man")) exitWith {
		_msg = "Not a player!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_target getVariable "RPP_Handcuff") then {
		if (_target getVariable "RPP_Escorting") then {
			[[], "RPP_Police_Undrag",RPP_PlayerAttached] call BIS_FNC_MP;
			detach RPP_PlayerAttached;
			detach player;

			RPP_PlayerAttached = "";
		} else {
			_target setVariable ["RPP_Escorting",true,true];
			RPP_PlayerAttached = _target;
			RPP_PlayerAttached attachto [player,[0.1,1.1,0]];
		};
	} else {
		_msg = "This player is not Handcuffed!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
}] call RPP_Function;
publicVariable "RPP_Police_Drag";

["RPP_Police_Undrag", {
	detach player;
	player setVariable ["RPP_Escorting",false,true];
}] call RPP_Function;
publicVariable "RPP_Police_Undrag";

["RPP_Police_CheckLic", {
	private ["_target","_lic"];
	_target = cursortarget;
	if (player distance _target > 10) exitWith {
		_msg = "To far away from the player!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (!(_target isKindOf "man")) exitWith {
		_msg = "Not a player!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_lic = "";
	[[player,_lic], "RPP_Police_GetLicplayer", _target] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_RevokeLic_Start";

["RPP_RevokeLic_Dialog", {
	private ["_lic","_licarray"];
	createDialog "RPP_RevokeLicense_Dialog";
	_lic = _this select 1;
	RPP_Revoke_p = _this select 0;
	{
		_licarray = lbAdd [1500, format ["%1", _x]];
		lbSetData [1500, _licarray, _x];
	} foreach _lic;
	buttonSetAction [1600, "[] call RPP_RevokeLic_Revoke;"];
}] call RPP_Function;
publicVariable "RPP_RevokeLic_Dialog";

["RPP_Police_GetLicplayer", {
	private ["_cop","_lic"];
	_cop = _this select 0;
	_lic = RPP_License;
	[[player,_lic], "RPP_RevokeLic_Dialog",_cop] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_Police_GetLicplayer";

["RPP_RevokeLic_Revoke", {
	private ["_p","_data"];
	_p = RPP_Revoke_p;
	_data = lbData [ 1500, ( lbCurSel 1500 ) ];
	[[_data,player], "RPP_RevokeLic_Revoke_Return",_p] call BIS_FNC_MP;
	closeDialog 1;
}] call RPP_Function;
publicVariable "RPP_RevokeLic_Revoke";

["RPP_RevokeLic_Revoke_Return", {
	private ["_p","_msg","_color"];
	RPP_License = RPP_License - [_this select 0];
	if (!(isServer)) then {
		[] call RPP_MySQL_Client_SendStats;
	};
	_p = _this select 1;
	_msg = format ["%1 just Revoked %2 from you",name _p,_this select 0];
	_color = RPP_Red;
	[_msg,_color] call RPP_MessageSystem;

	_msg = format ["%1 just got his %2 revoked",name player,_this select 0];
	[_msg] call RPP_Message_Global;
}] call RPP_Function;
publicVariable "RPP_RevokeLic_Revoke_Return";

["RPP_Police_RemoveWeapons", {
	private ["_target"];
	_target = cursorTarget;
	if (player distance _target > 10) exitWith {
		_msg = "To far away from the player!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (!(_target isKindOf "man")) exitWith {
		_msg = "Not a player!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	[[], "RPP_Police_RemoveWEapons_do",_target];
	_msg = "Weapons removed from player!";
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_Police_RemoveWeapons";

["RPP_Police_RemoveWEapons_do", {
	removeAllWeapons player;
	_msg = "The Police removed your weapons!";
	_color = RPP_Red;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_Police_RemoveWEapons_do";

["RPP_Police_Search", {
	private ["_target"];
	_target = cursorTarget;
	if (player distance _target > 10) exitWith {
		_msg = "To far away from the player!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	createDialog "RPP_SearchDialog";
	buttonSetAction [1600, "[] call RPP_Police_Search_Take;"];
	buttonSetAction [1601, "[] call RPP_Police_Search_Destroy_Do;"];

	if (RPP_Cash > 0) then {
		_data3 = lbAdd [1501, format ['Cash: $%1',_Cash]];
		lbSetData [1501, _data3, 'Cash'];
	};
	{	
		_item = _x select 0;
		_itemAmount = [_x select 0] call RPP_Inventory_Count;
		_data4 = lbAdd [1501, format ['%1 (x%2)',_item,_itemAmount]];
		lbSetData [1501, _data4, _item];
	} foreach RPP_Inventory;
	RPP_Search = [];
	[[player], "RPP_Police_Search_Get",_target] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_Police_Search";

["RPP_Police_Search_Get", {
	[_this select 0] spawn {
		private ["_cop","_items","_ItemName"];
		_cop = _this select 0;
		_items = "";
		_ItemName = "";
		{
			_item = _x select 0;
			_itemAmount = [_item] call RPP_Inventory_Count;
			[[_item,_itemAmount], "RPP_Police_Search_CopAdd", _cop] spawn BIS_FNC_MP;
		} foreach RPP_Inventory;
	};
}] call RPP_Function;
publicVariable "RPP_Police_Search_Get";

["RPP_Police_Search_CopAdd", {
	private ["_item"];
	_item = _this select 0;
	_itemAmount = _this select 1;
	[_item,_itemAmount] call RPP_Police_Search_Add;
}] call RPP_Function;
publicVariable "RPP_Police_Search_CopAdd";

["RPP_Police_Search_Return", {
	RPP_Search = _this select 0;
	lbClear 1500;
	{
		_itemAmount = [_x select 0] call RPP_Police_Search_Count;
		_data = lbAdd [1500, format ["%1 (x%2)",_x select 0, _itemAmount]];
		lbSetData [1500, _data, _x select 0];
	} foreach RPP_Search;
}] call RPP_Function;
publicVariable "RPP_Police_Search_Return";

["RPP_Police_Search_Take", {
	private ["_Data","_target"];
	if (lbCurSel 1500 == -1) exitWith {
		_msg = "Please Select an item first.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_Data = lbData [ 1500, ( lbCurSel 1500 ) ];
	if (_data == "") exitWith {
		_msg = "Please select an item from his Inventory.";
		_color = RPP_Red;
		[_msg,_Color] call RPP_MessageSystem;
	};
	_target = cursorTarget;
	if (player distance _target > 10) exitWith {
		_msg = "To far away from the player!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	[[_Data,player], "RPP_Police_Search_Take_Item",_target] call BIS_FNC_MP;

}] call RPP_Function;
publicVariable "RPP_Police_Search_Take";

["RPP_Police_Search_Take_Item", {
	private ["_item","_cop","_p"];
	_item = _This select 0;
	_cop = _this select 1;
	_p = player;

	[_item,1] call RPP_Inventory_Remove;

	_msg = format ["The Police took %1 From you",_item];
	_color = RPP_Red;
	[_msg,_color] call RPP_MessageSystem;

	[[_item], "RPP_Police_Search_Take_ItemGet", _cop] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_Police_Search_Take_Item";

["RPP_Police_Search_Take_ItemGet", {
	private ["_item"];
	_item = _this select 0;

	[_item,1] call RPP_Inventory_Add;
	[_item,1] call RPP_Police_Search_Remove;

	_msg = format ["You took his %1",_item];
	_color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_Police_Search_Take_ItemGet";

["RPP_Police_Search_Destroy_Do", {
	private ["_data","_Target"];
	if (lbCurSel 1500 == -1) exitWith {
		_msg = "Please Select an item first.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_Data = lbData [ 1500, ( lbCurSel 1500 ) ];
	if (_data == "") exitWith {
		_msg = "Please Select an item from his Inventory.";
		_color = RPP_Red;
		[_msg,_Color] call RPP_MessageSystem;
	};
	_target = cursorTarget;
	if (player distance _target > 10) exitWith {
		_msg = "To far away from the player!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};

	[[_Data], "RPP_Police_Search_Destroy",_target] call BIS_FNC_MP;

	_msg = format ["You just Destroyed his %1",_Data];
	_color = RPP_Yellow;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_Police_Search_Destroy_Do";

["RPP_Police_Search_Destroy", {
	private ["_item"];
	_item = _this select 0;

	[_item,1] call RPP_Inventory_Remove;
	[_item,1] call RPP_Police_Search_Remove;

	_msg = format ["The Police Detroyed your %1",_item];
	_color = RPP_Red;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_Police_Search_Destroy";

["RPP_Police_Search_Remove", {
    private ['_itemClass','_amount','_index'];
	_itemClass = _this select 0;
	_amount = _this select 1;
	_index = [RPP_Search, _itemClass, -_amount] call BIS_fnc_addToPairs;

	if([_itemClass] call RPP_Police_Search_Count < 1) then {
		_i = 0;
		{
			if(_itemClass == _x select 0) then {
				_index = _i;
			};
			_i = _i + 1;
		} forEach RPP_Search;
		RPP_Search set [_index, 'REMOVE'];
		RPP_Search = RPP_Search - ['REMOVE'];
	};

	[RPP_Search] call RPP_Police_Search_Return;
}] call RPP_Function;
publicVariable 'RPP_Police_Search_Remove';

["RPP_Police_Search_Add", {
    private ['_itemClass','_amount'];
    lbClear 1500;

	_itemClass = _this select 0;
	_amount = _this select 1;

	[RPP_Search, _itemClass, _amount] call BIS_fnc_addToPairs;

	[RPP_Search] call RPP_Police_Search_Return;
}] call RPP_Function;
publicVariable 'RPP_Police_Search_Add';

["RPP_Police_Search_Count", {
    private ["_itemClass","_return"];
	_itemClass = _this select 0;

	_return = [RPP_Search, _itemClass, 0] call BIS_fnc_getFromPairs;

	_return;
}] call RPP_Function;
publicVariable "RPP_Police_Search_Count";

["RPP_Police_AskforName", {
	private ["_target"];
	_target = cursorTarget;
	if (player distance _target > 10) exitWith {
		_msg = "To far away from the player!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	[[player], "RPP_Police_AskforName_Get",_target] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_Police_AskforName";

["RPP_Police_AskforName_Get", {
	private ["_p","_ui","_Text"];
	RPP_Asker = _this select 0;
	createDialog "RPP_Askforname";
	buttonSetAction [1600,"[] call RPP_Police_AskforName_Give;"];
	buttonSetAction [1601,"[] call RPP_Police_AskforName_Cancel;"];
	disableSerialization;
	_ui = uiNameSpace getVariable ["RPP_Askforname",displayNull];
	_Text = _ui displayCtrl 1000;
	_Text ctrlSetText format["%1 want to know your ID.",name RPP_Asker];
}] call RPP_Function;
publicVariable "RPP_Police_AskforName_Get";

["RPP_Police_AskforName_Give", {
	[[player], "RPP_Police_AskforName_Give_Return", RPP_Asker] call BIS_FNC_MP;
	_msg = "You just gave your ID to him!";
	_Color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;

	closeDialog 1;		
}] call RPP_Function;
publicVariable "RPP_Police_AskforName_Give";

["RPP_Police_AskforName_Cancel", {
	[[], "RPP_Police_AskforName_Cancel_Return", RPP_Asker] call BIS_FNC_MP;
	_msg = "You did not want to give him your ID";
	_Color = RPP_Green;
	[_msg,_color] call RPP_MessageSystem;
	
	closeDialog 1;	
}] call RPP_Function;
publicVariable "RPP_Police_AskforName_Cancel";

["RPP_Police_AskforName_Give_Return", {
	private ["_p"];
	_p = _this select 0;

	_msg = format ["His ID is %1",name _p];
	_color = RPP_Yellow;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_Police_AskforName_Give_Return";

["RPP_Police_AskforName_Cancel_Return", {
	_msg = "He did not want to share his ID with you.";
	_color = RPP_Yellow;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_Police_AskforName_Cancel_Return";

["RPP_Police_Placein", {
	detach player;
	_veh = _this select 0;
	player moveInCargo _veh;
}] call RPP_Function;
publicVariable "RPP_Police_Placein";

["RPP_Police_Place", {
	private["_unit","_nearestVehicle"];
	_unit = cursorTarget;
	if(isNull _unit OR !isPlayer _unit) exitWith {
		_msg = "Error";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	_nearestVehicle = nearestObjects[getPosATL player,["Car","Ship","Submarine","Air"],10] select 0;
	if(isNil "_nearestVehicle") exitWith {
		_msg = "There isn't a vehicle near by...";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (!(_unit getVariable "RPP_Handcuff")) exitWith {
		_msg = "He is not handcuffed.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	detach _unit;
	RPP_PlayerAttached = "";
	[[_nearestVehicle],"RPP_Police_placein",_unit,false] call bis_fnc_mp;
}] call RPP_Function;
publicVariable "RPP_Police_Place";

["RPP_Police_Pullout", {
	_target = cursorTarget;
	_p = player;
	if(_p distance _target >= 5) exitwith {
		_msg = "To far away from the vehicle!";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	{
		_x action ["Eject", vehicle _x];
	} forEach crew _target;
}] call RPP_Function;
publicVariable "RPP_Police_Pullout";

["RPP_Police_Ticket",{
	RPP_PD_Interact = cursorTarget;
	if (player distance RPP_PD_Interact >= 5) exitwith {
		_msg = "To far away to give the ticket";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	createDialog "RPP_TicketDialog";
	buttonSetAction [1600, "[] call RPP_Police_Ticket_Give;"];
}] call RPP_Function;
publicVariable "RPP_Police_Ticket";

["RPP_Police_Ticket_Give", {
	private ["_Ticket","_Reason"];
	_Ticket = round(parseNumber(ctrlText 1400));
	_Reason = ctrlText 1401;
	if (_Ticket isEqualTo "") exitWith {
		_msg = "Please type how much you want to ticket him.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_Ticket <= 0) exitWith {
		_msg = "Please type how much you want to ticket him.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	if (_Reason isEqualTo "") exitWith {
		_msg = "Please type a reason.";
		_color = RPP_Red;
		[_msg,_color] call RPP_MessageSystem;
	};
	[[player,_Ticket,_Reason], "RPP_Police_Ticket_GiveGet",RPP_PD_Interact] call BIS_FNC_MP;
	_msg = format ["Successfully sent a ticket of $%1",_Ticket];
	_color = RPP_Yellow;
	[_msg,_color] call RPP_MessageSystem;
	closeDialog 1;
}] call RPP_Function;
publicVariable "RPP_Police_Ticket_Give";

["RPP_Police_Ticket_GiveGet", {
	private ["_Reason","_ui","_Text"];
	disableSerialization;

	RPP_Asker = _this select 0;
	RPP_Ticket = _this select 1;
	_reason = _this select 2;

	createDialog "RPP_TicketGet";
	buttonSetAction [1600,"[] call RPP_Police_PayTicket;"];
	buttonSetAction [1601,"[] call RPP_Police_DontPayTicket;"];

	_ui = uiNameSpace getVariable ["RPP_TicketGet",displayNull];
	_Text = _ui displayCtrl 1000;
	_Text ctrlSetText format["%1 Just gave you a ticket of $%2",name RPP_Asker,RPP_Ticket];

	_msg = format ["%1 Ticket you for $%2<br />Reason:<br />%3",name RPP_Asker,RPP_Ticket,_reason];
	_color = RPP_Yellow;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_Police_Ticket_GiveGet";

["RPP_Police_PayTicket", {
	closeDialog 1;
	if (RPP_Cash > RPP_Ticket) exitWith {
		[RPP_Ticket] call RPP_AntiCheat_RemoveMoney;
		_msg = format ["You Successfully paid the ticket of $%1",RPP_Ticket];
		_color = RPP_Green;
		[_msg,_color] call RPP_MessageSystem;
		[[RPP_Ticket], "RPP_Police_Return_PayTicket",RPP_Asker] call BIS_FNC_MP;
	};

	if (RPP_Bank > RPP_Ticket) exitWith {
		[RPP_Ticket] call RPP_AntiCheat_RemoveBank;
		_msg = format ["You Successfully paid the ticket of $%1",RPP_Ticket];
		_color = RPP_Green;
		[_msg,_color] call RPP_MessageSystem;
		[[RPP_Ticket], "RPP_Police_Return_PayTicket",RPP_Asker] call BIS_FNC_MP;
	};

	_msg = format ["You Failed to paid the ticket of $%1",RPP_Ticket];
	_color = RPP_Red;
	[_msg,_color] call RPP_MessageSystem;
	[[], "RPP_Police_Return_FailPayTicket",RPP_Asker] call BIS_FNC_MP;
}] call RPP_Function;
publicVariable "RPP_Police_PayTicket";

["RPP_Police_Return_PayTicket", {
	private ["_Ticket"];
	_Ticket = _this select 0;
	[_Ticket] call RPP_AntiCheat_AddBank;

	_msg = format ["He Successfully paid the ticket of $%1",_Ticket];
	_color = RPP_Green;
	[_msg,_Color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_Police_Return_PayTicket";

["RPP_Police_Return_FailPayTicket", {
	_msg = "He did not have the money to pay that ticket.";
	_color = RPP_Yellow;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_Police_Return_FailPayTicket";

["RPP_Police_DontPayTicket", {
	_msg = format ["You Failed to pay the ticket of $%1",RPP_Ticket];
	_color = RPP_Red;
	[_msg,_color] call RPP_MessageSystem;
	[[], "RPP_Police_Return_DontPayTicket",RPP_Asker] call BIS_FNC_MP;
	closeDialog 1;
}] call RPP_Function;
publicVariable "RPP_Police_DontPayTicket";

["RPP_Police_Return_DontPayTicket", {
	_msg = format ["He did not want to pay the ticket of $%1",RPP_Ticket];
	_color = RPP_Red;
	[_msg,_color] call RPP_MessageSystem;
}] call RPP_Function;
publicVariable "RPP_Police_Return_DontPayTicket";