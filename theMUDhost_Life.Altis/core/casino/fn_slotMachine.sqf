/*
	File: fn_slotMachine.sqf
	Description: slots
	Created by Blacklistgaming.org

*/
private["_bet1","_bet2","_bet3","_bet4","_display","_slotPic1","_slotPic2","_slotPic3"];

if(!dialog) then {
	createDialog "SlotMachineGUI";
};
disableSerialization;