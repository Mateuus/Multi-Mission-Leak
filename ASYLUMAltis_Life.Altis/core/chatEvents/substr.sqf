/**
 * Chat-Events Script-library
 * by XxAnimusxX
 * v0.81
 *
 * aniChatEvents_substr
 * ------------------------------
 * Searches a string in another string with the
 * provided modifiers (flags).
 *
 * Syntax:
 * ------------------------------	
 * newString = [refString, start] call aniChatEvents_substr;
 *
 * Return Value:
 *		newString: String	(newly created substring)
 *
 * Parameters:
 * 		refString: String  	(the referenced string which is used to form the substring)
 *		start: Number		(the null-based index from which the substring should be formed)
 *		
 * Alternative Syntax:
 * ------------------------------ 
 * newString = [refString, start, length] call aniChatEvents_substr;
 *
 * Return Value:
 *		newString: String	(newly created substring)
 *
 * Parameters:
 * 		refString: String  	(the referenced string which is used to form the substring)
 *		start: Number		(the null-based index from which the substring should be formed (inclusive))
 *		length: Number		(the number of (max.) characters copied into the new string from parameter start)
 *
 *
 * In both cases start and length can be supplied with negative numbers, effectively offsetting from the end of
 * refString and not the start.
 * Having start = -2 will translate to: start = refStringlength - 2
 * Having length = -1 will translate to: length = refStringlength - 1
 * Look at http://us1.php.net/manual/en/function.substr.php for more detailed examples.
 */

// ----- DO NOT CHANGE ANYTHING IN THIS SCRIPT! ------
private ["_this", "_newString", "_refString", "_refStringArray", "_start", "_length", "_strLen", "_newStringArray"];

_newString 	= "";
_refString 	= "";
_start	   	= 0;
_length    	= 0;

// --------------------------------------------------------------

if (typeName _this != typeName []) exitWith {""};
if (count _this < 2) exitWith {""};

_refString	= _this select 0;
_start		= _this select 1;
_strLen		= _refString call aniChatEvents_strlen;

if (_strLen < 1) exitWith {""};
if (_start >= _strLen || _start < (_strLen*-1)) exitWith {""};
if (typeName _refString != typeName "") exitWith {""};
if (typeName _start != typeName 0) exitWith {""};

if (count _this > 2) then
{
	_length = _this select 2;
}
else
{
	_length = _strLen-1;
};
if (typeName _length != typeName 1) exitWith {""};

if (_length < ((_strLen-1)*-1)) exitWith {""};

if (_length >= _strLen) then
{
	_length = _strLen-1;
};

if (_start+_length == 0) exitWith {""};

// --------------------------------------------------------------

if (_start < 0) then
{
	_start = _strLen + _start;
};
if (_length < 0) then
{
	_length = _strLen + (_length-1);
}
else
{
	_length = _start + (_length-1);
	if (_length >= _strLen) then
	{
		_length = _strLen - 1;
	};
	
};
if (_start > _length) exitWith {""};

_newStringArray	= [];
_refStringArray = toArray(_refString);

for "_i" from _start to _length do
{
	_newStringArray	set [count _newStringArray, _refStringArray select _i];
};
_newString	= toString(_newStringArray);


_newString;