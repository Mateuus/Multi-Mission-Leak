/*
	Darkside Life
	
	Author: Shawn "Huntah" Macgillivray

	Description:
	Opens the market list
*/

private["_title","_textArea","_current","_display","_list","_name","_crimes","_bounty","_units","_players","_jobsList"];
disableSerialization;
closeDialog 0;
createDialog "marketMenu";

_display = findDisplay 905309;
_textArea = _display displayCtrl 1666;
_list = _display displayCtrl 2669;

lbClear _list;

_current = [0] call DS_civ_marketConfig;

_textArea ctrlSetStructuredText parseText format [
"<t color='#2E64FE' align='center' size='2'>%1</t><br/><br/>
<t color='#4CCF00' align='center'>%2</t><t color='#4CCF00' align='center'>%3</t><br/><br/>
<t color='#F7FE2E' align='center'>%4</t>


",(_current select 0),(_current select 1),(_current select 2),(_current select 3)];

_jobsList = ["Apple Picker","Peach Picker","Baker","Salt Trader","Oil Trader","Diamond Trader","Copper Trader","Cement Trader","Iron Trader","Glass Trader","Lumber Trading","Relic Collector","Fuel Delivery","Truck Driver","Chopper Pilot","Crop Dusting","Heroin Dealer","Weed Dealer","Cocaine Dealer","Crystal Meth Dealer","Drug Convoy Driver","Illegal Relic Collector","Police Bank","Air Taxi","Land Taxi","Fuel Price"];

{
	_list lbAdd format["%1",_x];
	_list lbSetData [(lbSize _list)-1,str(_forEachIndex)];
} foreach _jobsList;