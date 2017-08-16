/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Police officer receiving payment from civ paying ticket
*/

hint format ["Because %1 has paid his ticket, you have received the value of $%2 in your bank",name (_this select 0),[(round(_this select 1)/2)] call DS_fnc_numberText];
systemchat format ["Because %1 has paid his ticket, you have received the value of $%2 in your bank",name (_this select 0),[(_this select 1)] call DS_fnc_numberText];
[(round(_this select 1)/2),true,true] spawn DS_fnc_handleMoney;
[(round(_this select 1)/2),true] remoteExec ["HUNT_fnc_policeBank",2];
if(playerSide isEqualTo west)then
	{
	[1] spawn DS_fnc_alterStats;
	};