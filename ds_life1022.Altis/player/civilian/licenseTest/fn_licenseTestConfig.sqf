/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	License test config
*/

private["_return","_title","_textArea","_job1","_display","_list","_name","_crimes","_bounty","_units","_players","_jobsList"];

switch(_this select 0)do
	{
	case 0:
		{
		switch(_this select 1)do
			{
			case 0:
				{
				_return = [
							"What is the correct side of the road that you are to drive on",
							"Right",
							"Left",
							"Center",
							"",
							2
						];
				};
			case 1:
				{
				_return = [
							"What is the speed limit while driving inside a city",
							"40km/h",
							"50km/h",
							"60km/h",
							"70km/h",
							2
						];
				};
			case 2:
				{
				_return = [
							"When can you run somebody over?",
							"If they are a threat to you",
							"If you don't like them",
							"Never",
							"If you have no other choice",
							3
						];
				};
			case 3:
				{
				_return = [
							"Which of the following is illegal to drive with?",
							"A damaged fuel system",
							"A missing door",
							"No helmet",
							"A damaged windscreen",
							4
						];
				};
			case 4:
				{
				_return = [
							"Are you allowed to park on the side of the road?",
							"Yes if your vehicle is safely facing the correct way",
							"Yes if it is safe to",
							"No never",
							"Yes only with lights on",
							1
						];
				};
			case 5:
				{
				_return = [
							"What is the speed limit on gravel roads?",
							"70km/h",
							"100km/h",
							"110km/h",
							"No Limit",
							4
						];
				};
			case 6:
				{
				_return = [
							"While driving at night you must...",
							"Drive slow",
							"Use Night Vision Goggles",
							"Use Night Vision Goggles and Headlights",
							"Use Headlights",
							4
						];
				};
			case 7:
				{
				_return = [
							"If a police officer/ambulance has his sirens on behind you, you must...",
							"Stop right away",
							"Pull over to the right hand side of the road and stop",
							"Pull over to the left hand side of the road and stop",
							"Speed up",
							3
						];
				};
			case 8:
				{
				_return = [
							"What is the speed limit when driving on open roads (Sealed roads not in towns)",
							"100km/h",
							"110km/h",
							"120km/h",
							"No Limit",
							2
						];
				};
			};
		};
	case 1:
		{
		switch(_this select 1)do
			{
			case 0:
				{
				_return = [
							"What is the correct side of the road that you are to drive on",
							"Right",
							"Left",
							"Center",
							"",
							2
						];
				};
			case 1:
				{
				_return = [
							"What is the speed limit while driving inside a city",
							"40km/h",
							"50km/h",
							"60km/h",
							"70km/h",
							2
						];
				};
			case 2:
				{
				_return = [
							"When can you run somebody over?",
							"If they are a threat to you",
							"If you don't like them",
							"Never",
							"If you have no other choice",
							3
						];
				};
			case 3:
				{
				_return = [
							"Which of the following is illegal to drive with?",
							"A damaged fuel system",
							"A missing door",
							"No helmet",
							"A damaged windscreen",
							4
						];
				};
			case 4:
				{
				_return = [
							"Are you allowed to park on the side of the road?",
							"Yes if your vehicle is safely facing the correct way",
							"Yes if it is safe to",
							"No never",
							"Yes only with lights on",
							1
						];
				};
			case 5:
				{
				_return = [
							"What is the speed limit of gravel roads?",
							"70km/h",
							"100km/h",
							"110km/h",
							"No Limit",
							4
						];
				};
			case 6:
				{
				_return = [
							"While driving at night you must...",
							"Drive slow",
							"Use Night Vision Goggles",
							"Use Night Vision Goggles and Headlights",
							"Use Headlights",
							4
						];
				};
			case 7:
				{
				_return = [
							"If a police officer/ambulance has his sirens on behind you, you must...",
							"Stop right away",
							"Pull over to the right hand side of the road and stop",
							"Pull over to the left hand side of the road and stop",
							"Speed up",
							3
						];
				};
			case 8:
				{
				_return = [
							"What is the speed limit when driving on open roads (Sealed roads not in towns)",
							"100km/h",
							"110km/h",
							"120km/h",
							"No Limit",
							2
						];
				};
			};
		};
	case 2:
		{
		switch(_this select 1)do
			{
			case 0:
				{
				_return = [
							"When in a plane using a runway and somebody else is also using the runway, which side should you stick to?",
							"Left",
							"Right",
							"Center",
							"",
							2
						];
				};
			case 1:
				{
				_return = [
							"What altitude must you stay above over main cities if you do not wish to be charged with careless flying?",
							"10m",
							"30m",
							"50m",
							"75m",
							2
						];
				};
			case 2:
				{
				_return = [
							"When can you collide your air craft into somebody elses?",
							"If they are a threat to you",
							"If they are on the landing pad, in the way",
							"You can land on their rotors to make them fall from the sky",
							"Never",
							3
						];
				};
			case 3:
				{
				_return = [
							"Which of the following must you have to fly?",
							"An undamaged tail rotor",
							"An Air License",
							"A helmet",
							"An undamaged windscreen",
							4
						];
				};
			case 4:
				{
				_return = [
							"Which of the following is an illegal place to land a chopper?",
							"A marked landing area inside a city",
							"A safe area around a jobs depot",
							"The roof of a building in a city",
							"Anywhere off a road and not in a main city",
							1
						];
				};
			case 5:
				{
				_return = [
							"Which of the following is an illegal place to land a plane?",
							"A wide road with no drivers nearby",
							"A runway",
							"A safe open field",
							"",
							4
						];
				};
			case 6:
				{
				_return = [
							"While flying at night you must...",
							"Fly higher than during the day",
							"Use Night Vision Goggles",
							"Use Night Vision Goggles and flying lights",
							"Use flying lights",
							4
						];
				};
			case 7:
				{
				_return = [
							"When are you allowed to sling load somebody elses vehicle?",
							"When ever you get the chance",
							"When it is empty",
							"If you want to steal it and somebody is or isn't inside of it",
							"",
							3
						];
				};
			case 8:
				{
				_return = [
							"What area will guards shoot you down if you fly too close to?",
							"The Bank",
							"The Jail",
							"Fort Knox",
							"The Power Station",
							2
						];
				};
			};
		};
	case 3:
		{
		switch(_this select 1)do
			{
			case 0:
				{
				_return = [
							"You are allowed to leave a boat in the ocean, what must you do first though?",
							"Put down the anchor",
							"Make sure the boat is not moving",
							"Rise your boats flag",
							"Deploy a lifeboat",
							2
						];
				};
			case 1:
				{
				_return = [
							"If you are going to collide head on with another sea vessel which way must your turn?",
							"Right",
							"Left",
							"Under",
							"Over",
							2
						];
				};
			case 2:
				{
				_return = [
							"What is the speed limit if you are within 50m of swimmers or divers?",
							"5km/h",
							"10km/h",
							"20km/h",
							"No Limit",
							3
						];
				};
			case 3:
				{
				_return = [
							"Are you allowed to operate a boat while drunk?",
							"Yes",
							"Only at night",
							"Yes, but only one drink",
							"No never",
							4
						];
				};
			case 4:
				{
				_return = [
							"Police may stop you at anytime in the sea to check your license, what should you do?",
							"Bring your boat to a complete stop and wait",
							"Drift around waiting for them to stop you",
							"Race off if your boat is faster than theres",
							"Head to the nearest point of land",
							1
						];
				};
			case 5:
				{
				_return = [
							"Are you allowed to ram your boat into the shoreline?",
							"Yes",
							"Yes but only backwards",
							"Yes unless its a rocky shore",
							"No, you must approach the shoreline slowly",
							4
						];
				};
			case 6:
				{
				_return = [
							"What must you always have on you while driving a boat?",
							"A life jacket",
							"Sunblock",
							"A Boat License",
							"Your boat lights",
							4
						];
				};
			case 7:
				{
				_return = [
							"If you flee police, are they allowed to use lethal force on your vessel?",
							"No never",
							"Only if I shoot them",
							"Yes but I can not be harmed",
							"Yes and I may be harmed",
							3
						];
				};
			case 8:
				{
				_return = [
							"What area will guards shoot your boat if you drive too close to?",
							"The Bank",
							"The Jail",
							"Fort Knox",
							"The Power Station",
							2
						];
				};
			};
		};
	case 4:
		{
		switch(_this select 1)do
			{
			case 0:
				{
				_return = [
							"While carrying a pistol in a city, where must you keep the pistol?",
							"In your hand, fully loaded",
							"In your hand, unloaded",
							"In your hand but lowered",
							"Holstered or in a backpack",
							2
						];
				};
			case 1:
				{
				_return = [
							"An advanced weapons license allows you to carry larger weapons legally, how can you purchase this license?",
							"By paying more money",
							"Through the civilian quest line",
							"By spending 20 years (20 hours) on Altis",
							"From a gang hideout",
							2
						];
				};
			case 2:
				{
				_return = [
							"Are you allowed to attach scopes and other attachments to weapons?",
							"Yes, so long as you have a license",
							"Yes, only with advanced weapons licenses",
							"Yes, only if they're made out of wood",
							"No never",
							3
						];
				};
			case 3:
				{
				_return = [
							"If you see someone robbing a store, is it legal for you to get close and kill them?",
							"Yes, if I am within 100m",
							"Yes, if I tell them to surrender first",
							"Yes, if they are stopping me from buying lotto",
							"No, unless my life is in direct threat",
							4
						];
				};
			case 4:
				{
				_return = [
							"Can you discharge a firearm in a city?",
							"No, unless my life or property is in direct threat",
							"Yes, but only flare guns",
							"Yes, if you have a weapons license",
							"Yes, if helping the cops kill baddies",
							1
						];
				};
			case 5:
				{
				_return = [
							"While in a city, where can you legally carry a rifle?",
							"On your back or in a backpack",
							"In your hand if you have a license",
							"In your hand if it is un-loaded",
							"Only in a backpack, never on your back",
							4
						];
				};
			case 6:
				{
				_return = [
							"If you kill somebody in self-defence you must?",
							"Remain where you are and contact police",
							"Let the police know later when they catch you",
							"Nothing, the police will already know",
							"Leave the area and contact the police later on",
							4
						];
				};
			case 7:
				{
				_return = [
							"You will not lose your gun license for which of the following actions?",
							"Evading police",
							"Shooting at police",
							"Knocking somebody out and robbing them",
							"Robbing a gas station",
							3
						];
				};
			case 8:
				{
				_return = [
							"I have found a 6.5mm weapon, can I use this with a weapons license?",
							"Yes",
							"Yes but only with an advanced weapons license",
							"Yes, only if I text the cops first",
							"No, 6.5mm ammo is not legal",
							2
						];
				};
			};
		};
	case 5:
		{
		switch(_this select 1)do
			{
			case 0:
				{
				_return = [
							"While carrying a pistol in a city, where must you keep the pistol?",
							"In your hand, fully loaded",
							"In your hand, unloaded",
							"In your hand but lowered",
							"Holstered or in a backpack",
							2
						];
				};
			case 1:
				{
				_return = [
							"An advanced weapons license allows you to carry larger weapons legally, how can you purchase this license?",
							"By paying more money",
							"Through the civilian quest line",
							"By spending 20 years (20 hours) on Altis",
							"From a gang hideout",
							2
						];
				};
			case 2:
				{
				_return = [
							"Are you allowed to attach scopes and other attachments to weapons?",
							"Yes, so long as you have a license",
							"Yes, only with advanced weapons licenses",
							"Yes, only if they're made out of wood",
							"No never",
							3
						];
				};
			case 3:
				{
				_return = [
							"If you see someone robbing a store, is it legal for you to get close and kill them?",
							"Yes, if I am within 100m",
							"Yes, if I tell them to surrender first",
							"Yes, if they are stopping me from buying lotto",
							"No, unless my life is in direct threat",
							4
						];
				};
			case 4:
				{
				_return = [
							"Can you discharge a firearm in a city?",
							"No, unless my life or property is in direct threat",
							"Yes, but only flare guns",
							"Yes, if you have a weapons license",
							"Yes, if helping the cops kill baddies",
							1
						];
				};
			case 5:
				{
				_return = [
							"While in a city, where can you legally carry a rifle?",
							"On your back or in a backpack",
							"In your hand if you have a license",
							"In your hand if it is un-loaded",
							"Only in a backpack, never on your back",
							4
						];
				};
			case 6:
				{
				_return = [
							"If you kill somebody in self-defence you must?",
							"Remain where you are and contact police",
							"Let the police know later when they catch you",
							"Nothing, the police will already know",
							"Leave the area and contact the police later on",
							4
						];
				};
			case 7:
				{
				_return = [
							"You will not lose your gun license for which of the following actions?",
							"Evading police",
							"Shooting at police",
							"Knocking somebody out and robbing them",
							"Robbing a gas station",
							3
						];
				};
			case 8:
				{
				_return = [
							"I have found a 6.5mm weapon, can I use this with a weapons license?",
							"Yes",
							"Yes but only with an advanced weapons license",
							"Yes, only if I text the cops first",
							"No, 6.5mm ammo is not legal",
							2
						];
				};
			};
		};
	};
_return;