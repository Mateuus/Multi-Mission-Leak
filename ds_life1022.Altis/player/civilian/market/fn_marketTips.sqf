/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Clears a players wanted status
*/

private["_jobsList","_current","_pack","_display","_text","_units","_charge","_chargeStr"];

disableSerialization;

_index = lbData [2669,lbCurSel 2669];
_index = parseNumber(_index);
_display = findDisplay 905309;
_textArea = _display displayCtrl 1666;

_current = [_index] call DS_civ_marketConfig;

_textArea ctrlSetStructuredText parseText format [
"<t color='#2E64FE' align='center' size='2'>%1 Tips</t><br/><br/>
<t color='#4CCF00' align='center'>%2</t><br/><br/>
<t color='#F7FE2E' align='center'>%3</t>
",(_current select 0),(_current select 4),(_current select 5)];