waitUntil {!isNull player && player isequalto player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["changelog","Change Log"];
player createDiarySubject ["Donations","Donations"];
player createDiarySubject ["serverrules","General Rules"];
player createDiarySubject ["safezones","Safe Zones"];
player createDiarySubject ["civrules","Civilian Rules"];
player createDiarySubject ["policerules","Police Rules"];
player createDiarySubject ["medrules","Medic Rules"];
player createDiarySubject ["controls","Controls"];

/*  Example
	player createDiaryRecord ["", //Container
		[
			"", //Subsection
				"
				TEXT HERE<br/><br/>
				"
		]
	];
*/

	player createDiaryRecord["changelog",
		[
			"Change Log",
			
				"
				<br/><br/>
				<font size='15' face='PuristaSemiBold'>Outlawed Veterans - Changelog</font><br/>
				<font size='15' face='PuristaSemiBold'>LAST UPDATED ON: 04/05/2017</font><br/><br/><br/>
				<br/>
				
				<font size='13' color='#8de61a' face='PuristaSemiBold'>NEW FEATURES</font><br/><br/>
				
				<font face='PuristaSemiBold'>SQL Cellphone message system (test phase)</font><br/>	
				<font face='PuristaSemiBold'></font><br/>
				<font face='PuristaSemiBold'></font><br/>
				<font face='PuristaSemiBold'></font><br/>
				<font face='PuristaSemiBold'></font><br/>
				<font face='PuristaSemiBold'></font><br/>	
				<font face='PuristaSemiBold'></font><br/>
				<font face='PuristaSemiBold'></font><br/>
				<br/>
				<font size='13' color='#1a8de6' face='PuristaSemiBold'>GENERAL</font><br/><br/>
				
				<font face='PuristaSemiBold'></font><br/>	
				<font face='PuristaSemiBold'></font><br/>
				<font face='PuristaSemiBold'></font><br/>
				<font face='PuristaSemiBold'></font><br/>

				<font face='PuristaSemiBold'></font><br/>
				<font face='PuristaSemiBold'></font><br/>

				<br/>
				<font size='13' color='#e61a27' face='PuristaSemiBold'>CRITICAL FIXES</font><br/><br/>
				
				<font face='PuristaSemiBold'>fixed: Medic no release when jailed</font><br/>
				<font face='PuristaSemiBold'>fixed: numerous small issues</font><br/>
				<font face='PuristaSemiBold'></font><br/>
				
				"
		]
	];
	
	player createDiaryRecord["Donations",
		[
			"Donations",
				"
				<b>Outlawed-Veterans - Donations</b> <br/><br/>
					
				This server isn't running on water!<br/>
				Every donation is appreciated and will go directly towards the server bill!<br/><br/>
					
				////////////////////////////////////////////////////////////////

				Donate 5 Euro monthly and you will enjoy the following perks:<br/><br/>
				- Reserved slots,<br/>
				- Custom textures for vehicles, uniforms(if available)<br/>
				- Donator icon in front of your name when playing as civilian,<br/>
				- Donator Teamspeak icon to recognize you as a supporter!<br/><br/>
				
			
				////////////////////////////////////////////////////////////////<br/>
				Paypal e-mail: donate@outlawed-veterans.com<br/><br/>
				We thank you for your support, to keep the server running!</br>
				////////////////////////////////////////////////////////////////<br/><br/>
				<br/>
				Visit us: www.outlawed-veterans.com
	
				"
		]
	];
	

	player createDiaryRecord ["serverrules",
		[
			"Server Rules", 
				"
				<font size='13' color='#1a8de6' face='PuristaSemiBold'>Server Rules</font><br/><br/>
				Since we use images and links it's better for us to link you towards our rules topic. That way you have the most up-to-date rules with supported links and images to clarify them!<br/><br/><br/>
				<a href='http://tinyurl.com/ovrules' color='#56BDD6'>Click > SERVER rules</a><br />
				"
		]
	];
	
	/*
	player createDiaryRecord ["serverrules",
		[
			"Bannable Offences", 
				"
				Consider this your ONE and ONLY warning.<br/><br/>
				
				1. Hacking, or making hack threats towards the community or players,<br/>
				2. Cheating,<br/>
				3. Exploiting, (glitching, gaining access to area's you normally can't)<br/>
				4. Combat logging.<br/>
				5. Vdm'ing(Driving people over)<br/>
				6. Trolling (Blowing vehicles up or other)<br/>
				7. Advertising<br/>
				"
		]
	];
	*/
	
	player createDiaryRecord["safezones",
		[
			"Safe Zones",
				"
					You are NOT allowed to do the following: robbing,<br/> destroying vehicles,<br/> killing people.<br/>Trolling by driving into or over people or vehicles.<br/><br/>
					
					In the following safezone area's:<br/><br/>
					Spawn Island <br/>
					Rebel Camp<br/>
					Donator Port<br/>
					Police HQ's<br/>
					Army HQ's<br/>
				"
		]
	];
	
	/*
	player createDiaryRecord ["serverrules",
		[
			"Communication Rules", 
				"
				Items on this list may result in your removal from the server and/or ban, based on the admins discretion.<br/><br/>
				
				1. Side Chat may not be used to talk.<br/>
				2. Group Chat of cops and medics may not be used to speak into, use Teamspeak for voice. Typing however is allowed.<br/>
				3. Spamming any chat channel will result in your removal.<br/>
				4. Teamspeak channels are split up into areas for a reason. Cops must be in the cop channels at all times.<br/>
				5. Civilians cannot be in any cop channels on Teamspeak in order to gather information on their location or movements. Civs caught doing this will be removed the channel. Repeat offenders can be kicked or banned from both the game and teamspeak.<br/><br/>
				"
		]
	];	
	*/
	
	player createDiaryRecord ["civrules",
		[
			"What is Illegal?",
				"
				<br/>
				Illegal area's<br/>
				////////////////////////////////////////////////////////////////<br/><br/>
				1. Gang Hideouts are considered illegal zones, which is marked by a red circle.<br/>
				2. Federal reserve is considered an illegal zone, which is marked by a red circle.<br/>
				3. Drugs fields and turtle fishing spots are considered illegal and are marked by red circles.<br/>
				4. Cop HQ's, any civilian in cop HQ's can be tazed, fined, arrested or even shot on sight.<br/>
				5. Jail area when not in the actual jail.<br/>
				6. Shipping wreck.<br/>
				7. Air drop weapon crate.<br/>
				8. BlackMarket Area.<br/>
				9. Army HQ's, any civilian in army HQ's can be tazed, fined, arrested or even shot on sight.<br/><br/><br/>
				
				! NOTE: In Illegal area's you can be shot on sight or being restrained and fined. 
				
				
				
				Illegal weapons<br/>
				////////////////////////////////////////////////////////////////<br/><br/>
				
				Legal Weapons for Civilians/Rebels to carry WITH a Handgun permit AND with a range master belt - holstered:<br/><br/>
				1. All pistols and revolvers<br/>
				

				Any other weapon, launcher or explosive is considered illegal.<br/><br/><br/>
				Suicide vests are also considered illegal!
				
				
				Illegal Items<br/>
				////////////////////////////////////////////////////////////////<br/><br/>

				The following items are illegal to posses:<br/><br/>
				1. Turtle<br/>
				2. Cocaine<br/>
				3. Heroin<br/>
				4. Cannabis<br/>
				5. Marijuana<br/>
				6. Spike trips<br/>
				7. Boltcutters<br/>
				8. Blasting charge<br/>
				9. Lance<br/>
				10. Ram <br/>
				11. Gold bars <br/>
				12. Silver bars <br/>
				13. Ruby's <br/>
				14. Ancient Coins<br/>
				15. Zip-ties<br/>
				16. Crystal Meth<br/>
				<br/>

				"
		]
	];
	
	
		player createDiaryRecord ["civrules",
		[
			"Motorized Vehicles",
				"
				4 > or more wheels - ground vehicles<br/>
				////////////////////////////////////////////////////////////////<br/><br/>
				
				Any such vehicle driven under this category requires a drivers license.
				In case the vehicle is a truck the person is required to have a truck license.<br/>
				If you do not have the appropriate license the vehicle can be impounded and you can be fined!<br/><br/>
				
				When used in town area's the following are illegal for civilians/rebels;<br/><br/>
				1. Ifrit<br/>
				2. Strider<br/>
				3. Armed Off Roader<br/>
				4. Armed Ifrit<br/>
				
				These vehicle are always illegal vehicles to have when you are a civilian/rebel;<br/><br/>
				1. Any Police vehicle<br/>
				2. Any Medic vehicle<br/>
				3. Any Army vehicle<br/>
				4. Karts (=Only allowed on the kart track.)<br/><br/>
				
				The following speeds should be used:<br/><br/>
				Inside cities: 50km/h<br/>
				Outside cities: No limit<br/><br/><br/>
				
				Helicopters or jets<br/>
				////////////////////////////////////////////////////////////////<br/><br/>
				
				Flying jets or helicopters above city area's is NOT allowed.<br/>
				here is a strict NO fly zone over city's[, you can be shot on sight if you do so by the police.<br/>
				
				Flying any jet is considered a high terrorism act and shall be dealt with instantly.<br/>
				Armed Pawnee serves the same kind of high threat alert as flying a jet!<br/><br/><br/>
				
				Boats<br/>
				////////////////////////////////////////////////////////////////<br/><br/>
				
				If you have a boat you should have a boating license. If you do NOT have that license your boat will be impounded and you shall receive a ticket for not having the correct license.<br/><br/>
				Floating your boat close to cop HQ's marked on the map as a green zone is NOT allowed and could result in an impound and a ticket.
				"
		]
	];
	
	player createDiaryRecord ["medrules",
		[
			"General Rules",
				"
				<br/>
				General<br/>
				////////////////////////////////////////////////////////////////<br/><br/>
				1. Medics are there to help everybody they are independable.<br/>
				2. When cops ask medics to go with them as support to secure federal for example they are free to go with them but then they have to listen to police commands.<br/>
				3. Medics are there to revive people not to kill!<br/>
				4. Medics can NOT have any weapons, launchers or explosives.<br/>
				5. When a police officer says to not revive a dead person the medic can NOT revive that person!<br/>
				"
		]
	];
	
	
	
	player createDiaryRecord ["policerules",
		[
			"Chain of Command",
				"
				The highest ranking officer on duty is in charge of the police force outside of admins currently online. The high ranking officer is expected to follow the rules and guidelines of his/her rank, and must report to the admin in case any action need be taken.<br/><br/>

				Police Chain of Command:<br/>
				1. General<br/>
				2. Colonel<br/>
				3. Major<br/>
				4. Captain<br/>
				5. Lieutenant<br/>
				6. Sergeant<br/>
				7. Patrol Officer<br/>
				8. Cadet<br/>
				9. Public Cop<br/><br/>

				Cops in game who are not enrolled/accepted into the PD are the lowest tier and have no say in police operations, meaning not being whitelisted<br/>
				Cops should always wear identified police gear and should never be naked, or 'undercover'. They should always be recognized as a police officer.<br/>
				"
		]
	];

	player createDiaryRecord ["policerules",
		[
			"Ticketing a criminal",
				"
				
				Tickets<br/><br/>
				
				Small crimes like bellow should be dealt with a fine of 25.000<br/><br/>
				
				1. Speeding into a town area.<br/>
				2. Being in Cop/Army HQ's, jail, federal reserve area or other illegal area's<br/>
				3. Resisting a search.<br/>
				4. Not having the appropriate registrations or licenses.<br/>
				5. Driving an illegal vehicle.<br/>
				6. Wearing stolen items: (example: cop uniform, cop vest)<br/><br/>
				
				Mid crimes like bellow should be dealt with a fine of 50.000<br/><br/>
				
				1. Robbery, unrestraining people<br/>
				2. Burglary.<br/>
				3. Grand theft auto.<br/>
				4. Possession of drugs.<br/>
				5. Selling drugs.<br/>
				6. Possession of illegal firearms.<br/><br/>
				
				Refusing to pay a ticket after it got offered 3 times = jail.</br>
				If the suspect is not responding on a ticket(pay or refuse) you can send him after 5 minutes of not responding to jail.
				"
		]
	]; 
	
	player createDiaryRecord ["policerules",
		[
			"Arresting a criminal",
				"
				Arresting should be done to criminals who are considered a danger to themselves or others.<br/><br/>

				1. You may not arrest someone if you have given them a ticket and they paid it.<br/>
				2. You must tell the suspect why they are being arrested before you arrest them.<br/>
				3. You can restrain people when checking registrations or licenses.<br/>
				4. If a civilian is wanted, you may arrest them. Do not kill them, unless the situation deems necessary.<br/>
				5. If a civilian died he can NOT be revived and put to jail.<br/>
				<br/>
				Jailable offences<br/><br/>
				
				1. Manslaughter.<br/>
				2. Vehicle manslaughter.<br/>
				3. Escaping from jail.<br/>
				4. Attempt to murder.<br/>
				5. Being in Cop base(s) or Federal reserve as a civilian.<br/>
				6. Kidnapping people.
				<br/><br/>
				When you jail a person you always need to say for what crimes the person is jailed for!
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Use of Non-Lethal Force",
				"
				At this time the Taser or rubber rifle are the only form of Non-Lethal Force.<br/><br/>

				1. Taser or rubber rifle should be used to incapacitate non complying civilians in order to restrain them.<br/>
				2. Do not discharge your Taser or rubber rifle unless you intend to incapacitate a civilian, randomly discharging your weapon will result in your suspension.<br/>
				3. Only use your Taser or rubber rifle in compliance with the laws and the rules, do NOT enforce your will on others.<br/><br/>
				"
		]
	];
		
	player createDiaryRecord ["policerules",
		[
			"Use of Lethal Force",
				"
				1. Use of Lethal force is only permitted for the protection of your life, another officers life, or a civilians life, if and only if non-lethal force would not be effective.<br/>
				2. When the federal reserve is robbed cops are allowed to use lethal when they enter the federal reserve area.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"SWAT", 
				"
				SWAT - Guidelines<br/><br/>
				
				1. S,W,A,T, Ghosthawk is a last resort weapon and may only be pulled out at a federal reserve robbery or against mass amounts of rebels. To use the helicopter you have to have at least another SWAT member with you. Normal cops may NOT have the keys or be in the gunner or pilot seats of the helicopter..<br/><br/>
				
				2. S.W.A.T. Strider may only be used at fed, a mission, or against 3+ rebels.<br/><br/>
				
				3. S.W.A.T. Strider HMG is a last resort weapon and may only be pulled out at a federal reserve robbery or against mass amounts of rebels. To use the Strider HMG you have to have at least another SWAT member with you(for 5+ rebels). Normal cops may NOT have the keys or be in the gunner or driver seats of the of the strider.<br/><br/>
				
				4. S.W.A.T. is used for special operations to remove rebels from areas in lethal or non-lethal ways. They can use whatever they have at their disposal unless who they are shooting at is unarmed.<br/><br/>

				5. S.W.A.T. Members cannot spend all day playing as SWAT and must also play as a regular cop.<br/><br/>

				6. If their are many shooters in Kavala or any other town area, S.W.A.T. can be used.<br/><br/>
				
				7. UAVs can only be used by Squad-Leaders when there are other cops on the ground in the area where the drone is being used.<br/><br/>
				
				8. In the situation a SWAT vehicle is stolen, all swat resources may be used(still must apply to cop rules).<br/><br/>

				9. Other reasons that SWAT can be used:<br/><br/>
				- Federal Reserve<br/>
				- Hostage Situations<br/>
				- Patrolling<br/>
				
				 10. Swat members can shoot down(not limited to but includes the use of Titan) civilian choppers(not armed) in city areas where the no fly zone is ruled.(Every major spawn point or town)<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Army", 
				"
				Army - Guidelines<br/><br/>
				
				1. Army is used for special operations to remove rebels from areas in mostly lethal ways. They can use whatever they have at their disposal unless who they are shooting at is unarmed.<br/><br/>
				2. Army members are there for dealing with high threats, like rebels at federal reserve or jets and armed vehicles/choppers.<br/><br/>
				3. Army members have to role out with at least 2 army soldiers!(Exception is jet intervention this can be done solo)<br/><br/>
				4. Army members can shoot down any jets or armed Pawnee/vehicles without giving a warning first!<br/><br/>
				5. Army members can shoot down(not limited to but includes the use of Titan) civilian choppers(not armed) in city areas where the no fly zone is ruled.(Every major spawn point or town)<br/><br/>
				6. Army members can only use the Cheetah on Air targets!<br/>
				7. Army members can only use the Armed boat against sea and air targets.<br/>
				8. Army members can ONLY bring out heavy vehicles, boats, armed choppers when the situations is a high alert, this means a Federal Reserve robbery!<br/>
				(Excluding: jet, cheetah for shooting down jets/helicopter is no fly zone's.)<br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Teamspeak Rule",
				"
				1. All cops must be on Teamspeak 3 in a cop channel. Failure to be on Teamspeak will result in a warning, then a blacklist.<br/>
				2. Once on Teamspeak, Please be Mature and Friendly. Racism, Bullying, Trolling, WONT be tolerated and will result in a punishment.<br/>
				3. Please speak English in cop channels when everyone else is english, If your english is not great, join Cop channel 3.<br/><br/>
				
				Teamspeak address: ts.outlawed-veterans.com.<br/> Still doesn't work? try: 46.4.76.247. 
				"
		]
	];
	
// Controls Section

	player createDiaryRecord ["controls",
		[
			"",
				"
				Y: Open Player Menu<br/>
				U: Lock and unlock cars<br/>
				F: Cop Siren (if cop)<br/>
				T: Vehicle Trunk<br/>
				Left Shift + R: Restrain (Cop Only)<br/>
				Left Shift + B: Surrender<br/>
				Left Shift + G: Knock out / stun (Civ Only, used for robbing them)<br/>
				Left Windows: Main Interaction key which is used for picking up items/money, gathering, interacting with cars (repair,etc) and for cops to interact with civilians. Can be rebound to a single key like H by pressing ESC->Configure->Controls->Custom->Use Action 10<br/>
				Left Shift + L: Activates cop siren lights (as a cop).<br/>
				Left Shift + H: Holster's your pistol<br/>
				"
		]
	];