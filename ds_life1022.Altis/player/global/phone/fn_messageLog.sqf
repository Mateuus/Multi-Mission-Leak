/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Shows a hint of the currently selected message in the message log
*/

private["_message"];

_display = _this select 0;
_index = _this select 1;
_message = _display lbData _index;

hint format ["Darkside Text/News Log\n\n\n%1",_message];