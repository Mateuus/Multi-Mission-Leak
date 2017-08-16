/*
			File: motd.sqf
			Author: Shawn "Huntah" Macgillivray
			
	
			Description:
			Plays messages to the players depending on their current game status
*/

private ["_pubCop","_timePlayed","_messageArray","_copLevel","_currentMessage"];

_currentMessage = 0;
_pubCop = false;
_messageArray = [];
if(playerside == west)then
	{
	_copLevel = DS_copLevel;
	}
	else
	{
	_copLevel = 0;
	};
_timePlayed = ((DS_infoArray select 0)+(DS_infoArray select 1)+(DS_infoArray select 2));
if((str(player) in ["cop_4","cop_1","cop_3"]))then{_pubcop = true};

if(_pubCop)then
	{
	_messageArray =
		[
		"This mission file is still in late development, if/when you find bugs, please report them by pressing 9",
		"All police officer must be on TS in a police channel at all times or face being fired from the force",
		"As a public officer you are restricted to the area within 8km of Kavala",
		"As a public officer you are not allowed to enter the red circle areas without a whitelisted officer",
		"Senior police have the ability to allow public officers to use the entire map, do not pester them about this though",
		"As a public officer you will encounter many trolls, ticket them or jail them for breach of peace (Not Trolling)",
		"This mission file is still in late development, if/when you find bugs, please report them by pressing 9",
		"Do not randomly taze people, people do not need to be restrained to have a ticket issued to them",
		"All controls can be found on the map screen, read these before asking",
		"You are only allowed to carry a weapon that you are able to buy",
		"Ticket prices can be viewed in the 'give ticket' menu"
		];
	};
	
if((!_pubCop)&&(playerside == west)&&(_copLevel < 3))then
	{
	_messageArray =
		[
		"This mission file is still in late development, if/when you find bugs, please report them by pressing 9",
		"All police officer must be on TS in a police channel at all times or face being kicked from the server",
		"Police officers are only allowed to go afk when given permission by a high ranking officer, the time must not exceed 5 minutes",
		"Do not randomly taze people, people do not need to be restrained to have a ticket issued to them",
		"All controls can be found on the map screen, read these before asking",
		"You are only allowed to carry a weapon that you are able to buy",
		"This mission file is still in late development, if/when you find bugs, please report them by pressing 9",
		"Ticket prices can be viewed in the 'give ticket' menu",
		"You must always have permission of the highest ranking officer to use lethal force",
		"Do not spam coms in TS, always allow higher ranking officers to finish what they're saying before you speak",
		"Promotions are not soley based off stats, make sure you display roleplay as higher rankings and admins are always watching"
		];
	};
	
if((playerside == west)&&(_copLevel > 2)&&(_copLevel < 5))then
	{
	_messageArray =
		[
		"This mission file is still in late development, if/when you find bugs, please report them by pressing 9",
		"All police officer must be on TS in a police channel at all times or face being kicked from the server",
		"Police officers are only allowed to go afk when given permission by a high ranking officer, the time must not exceed 5 minutes",
		"Do not randomly taze people, people do not need to be restrained to have a ticket issued to them",
		"All controls can be found on the map screen, read these before asking",
		"You are only allowed to carry a weapon that you are able to buy",
		"This mission file is still in late development, if/when you find bugs, please report them by pressing 9",
		"At your rank you are able to add charges to civilians, you are responsible for these charges",
		"You must always have permission of the highest ranking officer to use lethal force",
		"At your rank you can be considered a minor leader, you may need to take charge at times. Understand that this is part of your job at this rank",
		"Promotions are not soley based off stats, make sure you display roleplay as higher rankings and admins are always watching"
		];
	};
	
if((playerside == west)&&(_copLevel > 4)&&(_copLevel != 7))then
	{
	_messageArray =
		[
		"This mission file is still in late development, if/when you find bugs, please report them by pressing 9",
		"All police officer must be on TS in a police channel at all times or face being kicked from the server",
		"Police officers are only allowed to go afk when given permission by a high ranking officer, the time must not exceed 5 minutes",
		"Make sure you fully understand the rules of using lethal force",
		"Be sure to understand all of the rules around martial law and the use of armed vehicles",
		"You are only allowed to carry a weapon that you are able to buy",
		"This mission file is still in late development, if/when you find bugs, please report them by pressing 9",
		"At your rank you are able to free the public cops from Kavala, always remember to lock this when you are leaving and remember they are your problem",
		"You must always have permission of the highest ranking officer to use lethal force",
		"At your rank you can be considered a leader, you may need to take charge at times. Understand that this is part of your job at this rank",
		"Promotions at your level will only happen when you constantly display great role play and leadership skills"
		];
	};
	
if((playerside == west)&&(_copLevel == 7))then
	{
	_messageArray =
		[
		"This mission file is still in late development, if/when you find bugs, please report them by pressing 9",
		"You are a deputy chief of police, your job is lead and monitor the police force",
		"At your rank you are to take notes on the performance of police officers, these notes are used to determine promotions and demotions",
		"Don't rage quit... Lead by example",
		"Remember at this rank the lower ranking officers are always looking up to you, make sure you set a good example"
		];
	};
	
if(playerside == independent)then
	{
	_messageArray =
		[
		"This mission file is still in late development, if/when you find bugs, please report them by pressing 9",
		"As a White listed civilian you must fully understand the rules of your role or possibly face demotion of your civilian level",
		"No whitelisted civilian jobs are allowed to be exploited for financial gain",
		"White listed civilians are not allowed to work against the police, you may break petty laws but your goal should always be to promote role play",
		"Remember you can be demoted at anytime, do not abuse or exploit the white listed civilian roles"
		];
	};	
	
if((playerside == civilian)&&(_timePlayed < 3000))then
	{
	_messageArray =
		[
		"This mission file is still in late development, if/when you find bugs, please report them by pressing 9",
		"Make sure you read and understand all of our rules that can be found on the map screen",
		"If you can't find something, open the map and 'click where is stuff' this will lead you to areas of importance such as processors and traders",
		"VDM is never allowed, running somebody over will result in a ban from the server",
		"This mission file is still in late development, if/when you find bugs, please report them by pressing 9",
		"Do not complain, troll, use voice or abuse people in sidechat, all of these can result in a temp ban from the server",
		"Complaints and issues are sorted out in our TS help rooms, visit these instead of messaging admins in game",
		"Information on donating can be obtained by talking to an admin on TS"
		];
	};
	
if((playerside == civilian)&&(_timePlayed > 2999))then
	{
	_messageArray =
		[
		"This mission file is still in late development, if/when you find bugs, please report them by pressing 9",
		"Make sure you read and understand all of our rules that can be found on the map screen",
		"If you can't find something, open the map and 'click where is stuff' this will lead you to areas of importance such as processors and traders",
		"VDM is never allowed, running somebody over will result in a ban from the server",
		"Do not complain, troll, use voice or abuse people in sidechat, all of these can result in a temp ban from the server",
		"This mission file is still in late development, if/when you find bugs, please report them by pressing 9",
		"Complaints and issues are sorted out in our TS help rooms, visit these instead of messaging admins in game",
		"Information on donating can be obtained by talking to an admin on TS"
		];
	};
	
while{true}do
	{	
	if(_currentMessage > (count _messageArray)-1)then{_currentMessage = 0};
	systemchat format ["%1",(_messageArray select _currentMessage)];
	_currentMessage = _currentMessage + 1;
	//if(serverTime > 24000)exitwith{};
	sleep 300;
	};

	
	/*
	
if(serverTime > 24000)then
	{
	waitUntil{(serverTime > 24900)};
	systemchat "~~RESTART WARNING~~ !! The server will restart in approximately 1 hour !!";
	waitUntil{(serverTime > 25500)};
	systemchat "~~RESTART WARNING~~ !! The server will restart in approximately 50 minutes !!";
	waitUntil{(serverTime > 26100)};
	systemchat "~~RESTART WARNING~~ !! The server will restart in approximately 40 minutes !!";
	waitUntil{(serverTime > 26700)};
	systemchat "~~RESTART WARNING~~ !! The server will restart in approximately 30 minutes !!";
	waitUntil{(serverTime > 27000)};
	systemchat "~~RESTART WARNING~~ !! The server will restart in approximately 25 minutes !!";
	waitUntil{(serverTime > 27300)};
	systemchat "~~RESTART WARNING~~ !! The server will restart in approximately 20 minutes !!";
	waitUntil{(serverTime > 27600)};
	systemchat "~~RESTART WARNING~~ !! The server will restart in approximately 15 minutes !!";
	waitUntil{(serverTime > 27900)};
	systemchat "~~RESTART WARNING~~ !! The server will restart in approximately 10 minutes !!";
	waitUntil{(serverTime > 28200)};
	systemchat "~~RESTART WARNING~~ !! The server will restart in approximately 5 minutes !!";
	[] call SOCK_fnc_updateRequest;
	};
	
	*/
		
	
	
	
	
	
	