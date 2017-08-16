/*
	File: fn_intro.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Displays introduction on init!
*/

private ["_civ","_cop"];

//if (life_adminlevel > 0) exitWith {};

sleep 2;
_intro = [];
_civ = [format["<t align='center' shadow='0'><img size='6' image='images\mission_splash.jpg'/></t><br/><br/>Welcome to the Asylum, %1,<br/><br/>
		<t color='#FF0000'>The Asylum</t> is a unique %2 Life role-playing server unlike any other.  With the most active development team around, we're adding new features on a nearly daily basis.<br/><br/>
With <t color='#00FF00'>loads of custom features</t>, you'll find more to do here than any other Life server. Unique developments include player housing with storage, buyable garages, vehicle enhancements (check gas station markets), government, permanent gangs and territory control (arms dealer, cartels, etc), bounty hunters, real-world weather and so much more.<br/><br/>
If this is your first time here, start off by earning some spending money. Early on, <t color='#00FF00'>delivery missions</t> or <t color='#00FF00'>gathering fruit</t> are often the easiest source of income.  You can get a license for a vehicle and more from the <t color='#0000FF'>DMV</t>.<br/><br/>
The Asylum saves everything automatically.  You may press Y to open your <t color='#0000FF'>Asylum UI</t>, U to (un)lock a vehicle and <t color='#00FF00'>TAB to surrender</t>!<br/><br/>
Open your map for more help and rules! The <t color='#00FF00'>MOST IMPORTANT RULE</t> is not committing RDM (see map for details).<br/><br/>
Enjoy your life on %2 and stop by our website at <t color='#FF0000'>www.gaming-asylum.com</t> for Teamspeak and forums!<br/><br/>", name player, worldName]];

_cop = [format["<t align='center' shadow='0'><img size='6' image='images\mission_splash.jpg'/></t><br/><br/>Welcome to the Asylum, %1,<br/><br/>
		As a whitelisted police officer on <t color='#FF0000'>The Asylum</t>, it is your responsibility to follow our important rules, but it is also very important to have fun, too! Please try to stay in character whenever possible as good police RP reflects upon yourself as well as the entire server.<br/><br/>Good luck, and thank you for upholding the laws of %2!<br/><br/>", name player, worldName]];


switch (playerSide) do {
	case west: {
		{
			_intro = _intro + [(parseText _x)];
		} forEach _cop;
		_cop = _intro;
		format["Welcome to %1",worldName] hintC _cop;
	};
	case civilian: {
		// Do nothing because it was just too annoying
	};
};