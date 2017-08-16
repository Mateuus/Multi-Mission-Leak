/*
	File: fn_policeRecruit.sqf
	Author: John "Paratus" VanderZwet

	Description:
	Show recruiting information.
*/

_notice = [];
_civ = [format["So you'd like to become a police officer, %1?,<br/><br/>
		<t color='#FF0000'>The Asylum Police Department</t> are a group of like-minded people who wish to serve the citizens of %2. If you'd like to do your part in bringing peace and justice
		to this small nation, you're already on your way.<br/><br/>You must be 18 years of age and have been playing on the Asylum servers as a civilian for at least two weeks time.  If you meet these
		criteria, read on.<br/><br/>Applications for whitelisted police access are submitted on our forums.  After being accepted, you'll be interviewed on Teamspeak and then begin your
		first week as a cadet.  Cadets always ride along with constables, which is the next rank you can achieve after proving your ability.<br/><br/>Police are one of the most important
		roles on Asylum servers.  You'll protect the citizens in many ways, while stopping rebels in actions such as store and federal reserve robberies, prison breaks, and so much more.<br/><br/>
		Police have access to special equipment from rubber bullets to remote controlled aerial reconnaissance drones.<br/><br/>If you meet the above criteria and would like to join the APD,
		apply now on our forums at <t color='#4444FF'>www.Gaming-Asylum.com</t>.  Visit the Police Applications forum.", name player, worldName]];

{
	_notice = _notice + [(parseText _x)];
} forEach _civ;
_civ = _notice;
"Join the APD!" hintC _civ;