/**
 * Chat-Events Script-library
 * by XxAnimusxX
 * v0.81
 *
 * aniChatEvents_handleQueue
 * ------------------------------
 * Is called every time a message (with content) is sent.
 * DO NOT ever call this script directly!
 *
 */
 
// ----- DO NOT CHANGE ANYTHING IN THIS SCRIPT! ------

private ["_this", "_channel", "_needle", "_callback", "_flags", "_result"];

if (count aniChatEvents_eventQueue == 0) exitWith {};

_channel 	= {if (aniChatEvents_chatChannel in _x) exitWith {_x select 0};} forEach aniChatEvents_chatChannelNames;
_needle		= "";
_callback	= "[player, aniChatEvents_chatMessage, _channel, %1] spawn %2;";
_flags		= [];
_result		= [];

{
	if (typeName _x == typeName []) then
	{
		_needle 	= _x select 0;
		_flags		= _x select 2;
		
		if (_needle == "") then
		{
			call compile format[_callback, 0, (_x select 1)];
		}
		else
		{
			_result = ([_needle, aniChatEvents_chatMessage, _flags] call aniChatEvents_strstr);
			if (_result select 0) then
			{
				call compile format[_callback, (_result select 1), (_x select 1)];
			};
		};
	};
} forEach aniChatEvents_eventQueue;