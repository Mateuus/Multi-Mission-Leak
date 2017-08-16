/*
			Author: Shawn "Huntah" Macgillivray
	
			Description:
			Buy Lotto Ticket
*/
private["_temp","_action"];

_action = [
		"Lotto tickets do not save through restarts or relogs. Either of these things will cancel your chance to win. Each Lotto Draw is approximately 30 minutes apart, you will be informed of the outcome at such time",
		"Buy Lotto $1,000",
		"Continue",
		"No Thanks"
	] call BIS_fnc_guiMessage;
if(!_action)exitwith{};
if(!(DS_lotto isEqualTo []))exitwith{hint "You already have a lotto ticket"};
if([1000,false] call DS_fnc_checkMoney)exitwith{hint "You must have $1000 on you to purchase a ticket"};
[1000,false,false] call DS_fnc_handleMoney;
while{true}do
	{
	if(count(DS_lotto) > 2)exitwith{};
	_temp = round random 30;
	if(!(_temp in DS_lotto))then
		{
		DS_lotto pushBack _temp;
		sleep ((2) + (random 3));
		};
	};
hint format ["Lotto ticket purchased.\n\nYour numbers are...\n\n\n(%1) (%2) (%3)\n\n\nYou will be advised of the results at the next draw.\n\n\n\nEach Lotto Draw is approximately 30 minutes apart, relogging or server restart will cancel this ticket",(DS_lotto select 0),(DS_lotto select 1),(DS_lotto select 2)];

