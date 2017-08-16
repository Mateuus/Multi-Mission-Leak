/**
 * Chat-Events Script-library
 * by XxAnimusxX
 * v0.81
 *
 * aniChatEvents_removeEventHandler
 * ------------------------------
 * Removes the event handler with the given handleID from
 * the event queue.
 *
 * Syntax:
 * ------------------------------	
 * handleID call aniChatEvents_removeEventHandler;
 *
 * Parameters:
 *		handleID: Number	(handleID received upon calling aniChatEvents_addEventHandler)
 *
 * Alternative Syntax:
 * ------------------------------
 * removeAll call aniChatEvents_addEventHandler;
 *
 * Parameters:
 *		removeAll: Bool		(removes every single event handler in the event queue)
 *
 */
 
// ----- DO NOT CHANGE ANYTHING IN THIS SCRIPT! ------

private "_this";

if (isNil "_this") exitWith {diag_log "aniChatEvents_removeEventHandler: please provide sufficient parameters"};
if (typeName _this != typeName true && typeName _this != typeName 1) exitWith {diag_log "aniChatEvents_removeEventHandler: please check your syntax"};

if (typeName _this == typeName true) then
{
	if (_this) then
	{
		aniChatEvents_eventQueue = [];
	};
}
else
{
	private "_eventHandler";

	aniChatEvents_eventQueue set [_this-1, objNull];	

	// Check for the chance to defragment the array
	for "_eventHandler" from (count aniChatEvents_eventQueue)-1 to 0 step -1 do
	{
		if (typeName (aniChatEvents_eventQueue select _eventHandler) == typeName []) exitWith {};
		aniChatEvents_eventQueue set [_eventHandler, 0];
	};
	aniChatEvents_eventQueue = aniChatEvents_eventQueue - [0];
};