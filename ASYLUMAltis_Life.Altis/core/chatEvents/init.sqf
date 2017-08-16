/**
 * Chat-Events Script-library
 * by XxAnimusxX
 * v0.81
 */
 
// global variable definitions
// ----- DO NOT CHANGE ANYTHING IN THIS SCRIPT! ------

aniChatEvents_rootDir				= "core\chatEvents";
aniChatEvents_chatMessage			= "";
aniChatEvents_chatChannel			= "";
aniChatEvents_chatChannelNames		= ["direct", "global", "group", "side", "vehicle", "command"];
aniChatEvents_eventQueue			= [];

aniChatEvents_addEventHandler 		= compile preprocessFileLineNumbers (aniChatEvents_rootDir+"\add.sqf");
aniChatEvents_removeEventHandler	= compile preprocessFileLineNumbers (aniChatEvents_rootDir+"\remove.sqf");
aniChatEvents_strstr				= compile preprocessFileLineNumbers (aniChatEvents_rootDir+"\strstr.sqf");
aniChatEvents_strlen				= compile preprocessFileLineNumbers (aniChatEvents_rootDir+"\strlen.sqf");
aniChatEvents_substr				= compile preprocessFileLineNumbers (aniChatEvents_rootDir+"\substr.sqf");
aniChatEvents_removeAllEventHandlers= {true call aniChatEvents_removeEventHandler;};

private "_chName";
for "_i" from 0 to (count aniChatEvents_chatChannelNames)-1 do
{
	_chName = aniChatEvents_chatChannelNames select _i;
	aniChatEvents_chatChannelNames set [_i, [_chName, localize format ["str_channel_%1", _chName]]];
};

(compile preprocessFileLineNumbers (aniChatEvents_rootDir+"\handleQueue.sqf")) spawn {
	private ["_this", "_idd", "_ctrl"];
	
	disableSerialization;
	
	_idd 	= displayNull;
	_ctrl	= controlNull;
	
	aniChatEvents_initated	= true;
	
	while {true} do
	{
		aniChatEvents_chatMessage = "";
		waitUntil {_idd = findDisplay 24; !isNull _idd};
		
		_ctrl =	_idd displayCtrl 101;
		_ctrl ctrlAddEventHandler ["keyUp", "aniChatEvents_chatMessage = ctrlText (_this select 0); aniChatEvents_chatChannel = ctrlText ((findDisplay 63) displayCtrl 101);"];
		
		waitUntil {isNull _ctrl};
		if (aniChatEvents_chatMessage != "") then
		{
			call _this;
		};
	};
};