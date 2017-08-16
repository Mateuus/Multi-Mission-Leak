/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Opens the ticket menu
*/

private ["_civ","_dialog","_reason","_amount","_issueBtn","_priceBtn","_closeBtn"];

_civ = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if((isNull _civ)||(!isPlayer _civ)||((side _civ) == west)) exitwith {};
DS_cursorTarget = _civ;
disableSerialization;
createDialog "ticketMenu";

_dialog = findDisplay 666677;
_reason = _dialog displayCtrl 1400;
_amount = _dialog displayCtrl 1401;
_issueBtn = _dialog displayCtrl 2401;
_priceBtn = _dialog displayCtrl 2400;
_closeBtn = _dialog displayCtrl 2402;

_issueBtn ctrlSetText "Issue Ticket";
_issueBtn ctrlSetTooltip "Issue your target with a ticket";
_issueBtn buttonSetAction "[] spawn DS_cop_giveTicket;";

_priceBtn ctrlSetText "Check Amounts";
_priceBtn ctrlSetTooltip "Check ticket Prices";
_priceBtn buttonSetAction "[] spawn DS_cop_ticketPrices;";

_closeBtn ctrlSetText "Exit";
_closeBtn ctrlSetTooltip "Exit ticket menu";
_closeBtn buttonSetAction "closeDialog 0;";