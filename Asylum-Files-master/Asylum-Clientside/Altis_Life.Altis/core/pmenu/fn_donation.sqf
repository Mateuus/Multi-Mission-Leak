/*
	File: fn_donation.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Populate donation reward display app for smartphone
*/
private["_display","_icon","_rewards"];

disableSerialization;
waitUntil {!isNull findDisplay 7500};

[] call life_fnc_p_updateMenu;

_display = findDisplay 7500;
_rewards = _display displayCtrl 7510;

_rewards ctrlSetStructuredText parseText format["<t align='center'><t size='0.8'>You Are Level <t color='#FF0000' size='1'>%1</t></t><br/><br/><a underline='true' size='1.1' color='#0000FF' href='http://my.gaming-asylum.com/'>Donate Now!</a></t><br/><br/><t size='1' color='#fffdcc'>Level 1</t><br/><t size='0.7'>Able to buy an exclusive donor t-shirt.<br/>Able to buy an orange speed boat.<br/>Able to buy a purple offroad truck.</t><br/><br/><t size='1' color='#fffdcc'>Level 2</t><br/><t size='0.7'>All perks from previous levels.<br/>Re-spawn with a free debit card!</t><br/><br/><t size='1' color='#fffdcc'>Level 3</t><br/><t size='0.7'>All perks from previous levels.<br/>Able to buy a black and white hatchback sport.<br/>Able to buy a green hatchback sport.<br/>Able to buy a sky blue offroad truck.</t><br/><br/><t size='1' color='#fffdcc'>Level 4</t><br/><t size='0.7'>All perks from previous levels.<br/>Able to buy a red offroad truck.<br/>Able to buy a yellow offroad truck.<br/>Able to buy a dark blue hatchback sport.<br/>Able to buy a Mohawk helicopter!</t><br/><br/><t size='1' color='#fffdcc'>Level 5</t><br/><t size='0.7'>All perks from previous levels.<br/>Able to buy a pink offroad truck.<br/>Able to buy a green offroad truck.<br/>Able to buy a red hatchback sport.<br/>Able to buy VR glasses and suits.<br/>Able to buy a chrome offroad truck.<br/>Able to buy a chrome hummingbird helicopter.<br/>Able to buy a chrome mohawk helicopter.</t>", life_donator];