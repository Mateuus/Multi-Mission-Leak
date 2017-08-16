/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Blocks a players number to stop harassment
*/

private["_blockee","_uid"];

if(lbCurSel 2100 == -1) exitWith {hint "You have not selected anybody to block"};
_blockee = call compile format["%1",(lbData[2100,(lbCurSel 2100)])]; 
if(isNull _blockee) exitWith {};
if(isNil "_blockee") exitWith {};

_uid = (getPlayerUID _blockee);

if(_uid in DS_blockedCallers)then
	{
	hint "This person is already blocked, he will now be unblocked";
	DS_blockedCallers = DS_blockedCallers - [_uid];
	}
	else
	{
	hint "This person will now be blocked from messaging you";
	DS_blockedCallers pushBack _uid;
	};
	
