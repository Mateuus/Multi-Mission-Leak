/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Plays a message globally
*/

params [
	["_type",0,[[],0]],
	["_message","",[""]],
	["_important",false,[false]],
	["_importantLevel",2,[2]]
];

if(_message isEqualTo "")exitWith{};

switch(_importantLevel)do {
	case 0: {
		systemChat _message;
		hintSilent format ["%1", _message];
	};
	case 1:
		{
		systemChat _message;
		hintSilent format ["%1", _message];
		titleText [format ["%1",_message],"PLAIN"];
		};
	case 2: {
		systemChat _message;
	};
};

if((_important)&&(_type isEqualTo 0))then {
	if(isNil "DS_newsLog")then{DS_newsLog = [];};
	DS_newsLog pushBack _message;
};