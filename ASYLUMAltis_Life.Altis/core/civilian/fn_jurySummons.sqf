/*
	File: fn_jurySummons.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Summoned to jury duty.
*/

_defendant = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_amount = [_this,1,1,[1]] call BIS_fnc_param;
_start = [_this,2,time,[time]] call BIS_fnc_param;

waitUntil {life_trial_inprogress};

[_defendant] spawn
{
	["GovMessage",["You have received a Jury Summons!"]] call bis_fnc_showNotification;
	hint parseText format ["<t color='#00FF00'><t size='2'><t align='center'>Jury Summons<br/><br/><br/><t align='left'><t size='1'><t color='#ffffff'>You have been summoned to jury duty for the case of %2 v. %1! You will be <t color='#00FF00'>rewarded with $2,000</t>. Sign in at the nearest <t color='#00FF00'>courthouse</t> within 4 minutes to attend.", worldName, name (_this select 0)];
	sleep 60;
	if (isNil "life_jury_registered" || life_jury_registered) exitWith {};
	hint parseText format ["<t color='#00FF00'><t size='2'><t align='center'>Jury Summons<br/><br/><br/><t align='left'><t size='1'><t color='#ffffff'>You have 3 minutes to respond to jury duty for the case of %2 v. %1! You will be <t color='#00FF00'>rewarded with $2,000</t>. Sign in at the nearest <t color='#00FF00'>courthouse</t> within 3 minutes to attend.", worldName, name (_this select 0)];
	sleep 60;
	if (isNil "life_jury_registered" || life_jury_registered) exitWith {};
	hint parseText format ["<t color='#00FF00'><t size='2'><t align='center'>Jury Summons<br/><br/><br/><t align='left'><t size='1'><t color='#ffffff'>You have 2 minutes to respond to jury duty for the case of %2 v. %1! You will be <t color='#00FF00'>rewarded with $2,000</t>. Sign in at the nearest <t color='#00FF00'>courthouse</t> within 2 minutes to attend.", worldName, name (_this select 0)];
};

life_jury_registered = false;

waitUntil { life_jury_registered || !life_trial_inprogress || (time - _start) > 240 };

if (!life_jury_registered) then { hint "Jury duty is no longer available."; };
life_jury_registered = nil;