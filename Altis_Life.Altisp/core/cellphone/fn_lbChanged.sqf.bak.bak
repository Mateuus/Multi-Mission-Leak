/*
	Author: GetSomePanda / Panda
	SteamID: 76561198145366418
	File Name: fn_lbChanged.sqf
	Information: When new player is selected on the messages list.
*/
private["_message","_data","_nameOnPList","_text", "_delButton","_replyButton"];
disableSerialization;
_text = ((findDisplay 98111) displayCtrl 98113);
_data = lbData[98112,lbCurSel (98112)];
_delButton = ((findDisplay 98111) displayCtrl 98114);
_replyButton = ((findDisplay 98111) displayCtrl 98115);
if(_data isEqualTo "You have no messages.") then 
{
	_text ctrlSetText "You have no messages.";
} 
else
{
	_data = call compile _data;

	_nameOnPList = _data select 0;
	_message = _data select 1;

	_text ctrlSetText format ["""%1"" - %2", _message, _nameOnPList];
	_delButton ctrlShow true;
	_replyButton ctrlShow true;
};

