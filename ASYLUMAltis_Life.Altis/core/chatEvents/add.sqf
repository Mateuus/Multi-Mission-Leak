/**
 * Chat-Events Script-library
 * by XxAnimusxX
 * v0.81
 *
 * aniChatEvents_addEventHandler
 * ------------------------------
 * Adds another event into the event queue and returns 
 * the identifier of the newly added event.
 *
 * Syntax:
 * ------------------------------	
 * handleID = [Needle, callback] call aniChatEvents_addEventHandler;
 *
 * Return Value:
 *		handleID: Number	(the ID used to reference the handler)
 *
 * Parameters:
 * 		Needle: String  	(the string to search for, provide an empty string to trigger callback on every sent message)
 *		callback: String	(the name of the function to call whenever the needle-string matches)
 *
 * Alternative Syntax:
 * ------------------------------
 * handleID = [ [Needle, searchStart] , callback ] 								call aniChatEvents_addEventHandler;
 * handleID = [ [Needle, searchStart, wholeWords] , callback ] 					call aniChatEvents_addEventHandler;
 * handleID = [ [Needle, searchStart, wholeWords, caseSensitive] , callback ] 	call aniChatEvents_addEventHandler;
 *
 * Parameters:
 *		Needle: String		(the string to search for)
 *		searchStart: Bool	(only matches if needle is at the start of the chat-message, default: false)
 *		wholeWords: Bool	(only matches if needle is a whole word, default: false)
 *		caseSensitive: Bool (pretty much self-explanatory, default: false)
 *
 * In any case, the spawned callback upon a successful match is given an array of parameters:
 * 		[unit, message, channel, needlePos]
 *	
 *		unit: Player		(the player who wrote the message)
 *		message: String		(the written message)
 *		channel: String 	(the channel in which the message was written)
 *		needlePos: Number 	(the null-based index of the first occurence of Needle in message)
 *
 *		provided channel names:
 *		"direct", "global", "group", "side", "vehicle", "command"
 *
 */

// ----- DO NOT CHANGE ANYTHING IN THIS SCRIPT! ------
private ["_this", "_needle", "_callback", "_flags", "_paramNum"];

if (isNil "_this") exitWith {diag_log "aniChatEvents_addEventHandler: please provide sufficient parameters"};
if (typeName _this != typeName []) exitWith {diag_log "aniChatEvents_addEventHandler: please check your syntax"};
if (count _this < 2) exitWith {diag_log "aniChatEvents_addEventHandler: please check your syntax"};

_needle 		= _this select 0;
_callback		= _this select 1;
_flags 			= [false, false, false]; 

if (typeName _callback != typeName "") exitWith {diag_log "aniChatEvents_addEventHandler: the callback-parameter must be a string!"};

if (typeName _needle == typeName []) then
{
	private "_param";
	
	_paramNum 	= count _needle;
	if (_paramNum > 1) then
	{
		for "_param" from 1 to (_paramNum-1) do
		{
			if (typeName (_needle select _param) == typeName true && _param <= (count _flags)) then
			{
				_flags set [_param-1, _needle select _param];
			};			
		};
	};
	_needle		= _needle select 0;
};

aniChatEvents_eventQueue set [count aniChatEvents_eventQueue, [_needle, _callback, _flags]];

_paramNum = count aniChatEvents_eventQueue;
_paramNum;