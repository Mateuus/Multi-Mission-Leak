/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
	Checks what shop the player is trying to access and displays the data needed
*/

disableSerialization;
private["_current","_index","_display","_list","_dialog","_unit"];

_index = lbData [2669,lbCurSel 2669];
_index = parseNumber(_index);
_display = findDisplay 905309;
_textArea = _display displayCtrl 1666;

_current = [_index] call DS_civ_marketConfig;

_textArea ctrlSetStructuredText parseText format [
"<t color='#2E64FE' align='center' size='2'>%1</t><br/><br/>
<t color='#4CCF00' align='center'>%2</t><t color='#4CCF00' align='center'>%3</t><br/><br/>
<t color='#F7FE2E' align='center'>%4</t>
",(_current select 0),(_current select 1),(_current select 2),(_current select 3)];