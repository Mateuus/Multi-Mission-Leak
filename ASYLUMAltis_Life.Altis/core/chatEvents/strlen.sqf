/**
 * Chat-Events Script-library
 * by XxAnimusxX
 * v0.81
 *
 * aniChatEvents_strlen
 * ------------------------------
 * Returns the length of the provided string.
 *
 * Syntax:
 * ------------------------------	
 * size = string call aniChatEvents_strlen;
 *
 * Return Value:
 *		size: Number	(string-length, returns -1 if supplied with no string)
 *
 * Parameters:
 * 		string: String  	(well, duh.....)
 *							
 */

// ----- DO NOT CHANGE ANYTHING IN THIS SCRIPT! ------
private ["_this", "_ret"];

_ret = 	if (typeName _this != typeName "") then {
			-1;
		} else {
			count (toArray(_this));
		};
_ret;