/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Opens the help menu
*/

private["_title","_textArea","_current","_display","_list","_name","_crimes","_bounty","_units","_players","_jobsList"];
disableSerialization;

if(dialog)exitwith{};

closeDialog 0;
createDialog "helpMenu";

_display = findDisplay 905339;
_textArea = _display displayCtrl 1666;
_list = _display displayCtrl 2669;

lbClear _list;

if(DS_currentTask1 == "")then
	{
	_textArea ctrlSetStructuredText parseText format [
	"<t color='#2E64FE' align='center' size='2'>You do not have a current task</t>",DS_currentTask1];
	}
	else
	{
	_textArea ctrlSetStructuredText parseText format [
	"<t color='#2E64FE' align='center' size='2'>Current Task</t><br/><br/>
	<t color='#4CCF00' align='center'>%1</t><br/><br/>
	<t color='#F7FE2E' align='center'>%2</t>
	",DS_currentTask1,DS_currentTask2];
	};

_jobsList = ["Current Task","Key Controls","Help/Complaints/Issues","Rules","Donations","Server Restarts","Whitelisted Civilians","Playing as Police","Custom Real Estate","Prestige Quest","Police Vehicle Discounts","Morality","Realistic Mode","Martial Law","4 Frame Glitch","Server Event"];
{
	_list lbAdd format["%1",_x];
	_list lbSetData [(lbSize _list)-1,str(_forEachIndex)];
} foreach _jobsList;