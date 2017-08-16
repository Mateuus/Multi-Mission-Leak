waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

//player createDiarySubject ["changelog","Change Log"];
player createDiarySubject ["serverrules","Server rules"];
//player createDiarySubject ["policerules","Police Procedures/Rules"];
//player createDiarySubject ["safezones","Safe Zones (No Killing)"];
//player createDiarySubject ["civrules","Civilian Rules"];
player createDiarySubject ["illegalitems","Illegal Activity"];
player createDiarySubject ["crimes","Crimes and Fines"];
//player createDiarySubject ["gangrules","Gang Rules"];
//player createDiarySubject ["terrorrules","Terrorism Rules"];
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
	player createDiaryRecord ["serverrules",
		[
			"Rules", 
				"
				All our server rules can be found at www.grandtheftarma.com/rules<br/>
				<br/>
				Please be aware that we take our rules very serious here and they will be enforced if needed.<br/>
				"
		]
	];
// Illegal Items Section
	player createDiaryRecord ["illegalitems",
		[
			"Illegal Vehicles",
				"
				A civilian in control of the following prohibited vehicles is subject to the consequences defined in the unauthorized control of a prohibited vehicle law.<br/><br/>

				1. Ifrit<br/>
				2. Speedboat Minigun<br/>
				3. Hunter<br/>
				4. Any police vehicle (If you're aren't a cop)<br/>
				5. Go-kart outside of the track<br/>
				6. Armed Offroad<br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Illegal Weapons",
				"
				Any weapon that isn't on the legal weapon list is illegal. The legal weapons are shown here:<br/>
				<br/>
				1. P07<br/>
				2. Rook<br/>
				3. ACP-C2<br/>
				4. Zubr<br/>
				5. 4-five<br/>
				"
		]
	];
// Crimes and fines --------------------- CLUSTER-FUCK-HEAVEN! FUCK THE TABS, COMPACT FOR LIFE LALALALALALALALALALAA ---------------------
player createDiaryRecord ["crimes",
[
"Human rights",
"<br/><br/>
<font size='15' face='PuristaSemiBold'>Offences Against The Persons Act 1861</font><br/><br/>
<font face='PuristaSemiBold'>GBH (Grievous Bodily Harm)ABH (Actual Bodily Harm)</font><br/>
<font color='#E6731A' face='PuristaSemiBold'>25,000</font><br/>
<font face='PuristaSemiBold'>GBH upon an officer</font><br/>
<font color='#E6731A' face='PuristaSemiBold'>35,000</font> <br/>
<font face='PuristaSemiBold'>Attempted Murder</font><br/>
<font color='#E6731A' face='PuristaSemiBold'>100,000</font><br/>
<font face='PuristaSemiBold'>Murder</font><br/>
<font color='#E6731A' face='PuristaSemiBold'>Prison</font> <br/>
<font face='PuristaSemiBold'>Manslaugther</font><br/>
<font color='#E6731A' face='PuristaSemiBold'>50,000 up to Prison </font> <br/>
<font face='PuristaSemiBold'>Conspiring to commit murder</font><br/>
<font color='#E6731A' face='PuristaSemiBold'>50,000</font> <br/>
<font face='PuristaSemiBold'>Threats to kill</font><br/>
<font color='#E6731A' face='PuristaSemiBold'>50,000 up to 100,000 </font><br/>
<font face='PuristaSemiBold'>Resisting arrest</font><br/>
<font color='#E6731A' face='PuristaSemiBold'>50,000</font> <br/>
<font face='PuristaSemiBold'>Assault with intent to resisting arrest</font><br/>
<font color='#E6731A' face='PuristaSemiBold'>Prison</font><br/><br/>
"
]
];

player createDiaryRecord ["crimes",
[
"Embezzlement and Theft",
"<br/><br/>
<font size='15' face='PuristaSemiBold'>Theft Act 1986</font><br/><br/>
<font face='PuristaSemiBold'>Theft</font><br/>
<font color='#E6731A' face='PuristaSemiBold'>25,000 up to 100,000</font><br/>
<font face='PuristaSemiBold'>Robbery</font><br/>
<font color='#E6731A' face='PuristaSemiBold'>Prison</font> <br/>
<font face='PuristaSemiBold'>Armed robbery</font><br/>
<font color='#E6731A' face='PuristaSemiBold'>Prison</font><br/>
<font face='PuristaSemiBold'>Taking a vehicle without consent</font><br/>
<font color='#E6731A' face='PuristaSemiBold'>75,000</font> <br/>
<font face='PuristaSemiBold'>Attempted Vehicle Theft </font><br/>
<font color='#E6731A' face='PuristaSemiBold'>Caution / 25,000 to 50,000 </font> <br/>
<font face='PuristaSemiBold'>Vehicle Theft</font><br/>
<font color='#E6731A' face='PuristaSemiBold'>50,000</font><br/>
<font face='PuristaSemiBold'>Stealing a vehicle from the government</font><br/>
<font color='#E6731A' face='PuristaSemiBold'>75,000 </font><br/><br/>
"
]
];

player createDiaryRecord ["crimes",
[
"Prohibition of drugs",
"<br/><br/>
<font size='15' face='PuristaSemiBold'>Misuse of Drugs act 1971</font><br/><br/>
<font face='PuristaSemiBold'>Less than 5 units of Marijuana</font><br/>
<font color='#E6731A' face='PuristaSemiBold'>Caution</font><br/>
<font face='PuristaSemiBold'>5 Or more units of Marijuana</font><br/>
<font color='#E6731A' face='PuristaSemiBold'>15,000 Per Unit</font><br/>
<font face='PuristaSemiBold'>X amount of Heroin/Cocaine </font><br/>
<font color='#E6731A' face='PuristaSemiBold'>20,000 Per Unit</font><br/>
<font face='PuristaSemiBold'>Intent of supply</font><br/>
<font color='#E6731A' face='PuristaSemiBold'>50,000</font> <br/>
<font face='PuristaSemiBold'>Drug trafficking</font><br/>
<font color='#E6731A' face='PuristaSemiBold'>100,000 </font><br/>
"
]
];


player createDiaryRecord ["crimes",
[
"War crimes",
"<br/><br/>
<font size='15' face='PuristaSemiBold'>Criminal Attempts Act 1981</font><br/><br/>
<font face='PuristaSemiBold'>Perverting the course of justice</font><br/>
<font color='#E6731A' face='PuristaSemiBold'>10,000 up to 100,000</font><br/><br/><br/>

<font size='15' face='PuristaSemiBold'>Public Order Act 1986</font><br/><br/>
<font face='PuristaSemiBold'>Rioting</font><br/>
<font color='#E6731A' face='PuristaSemiBold'>10,000 up to Prison</font><br/>
<font face='PuristaSemiBold'>Intentional harassment, Fear of provocation of violence</font><br/>
<font color='#E6731A' face='PuristaSemiBold'>Caution up to Prison</font><br/><br/><br/>

<font size='15' face='PuristaSemiBold'>Anti-Social Behaviour Act 2003</font><br/><br/>
<font face='PuristaSemiBold'>Failing to leave an area at the request of police  </font><br/>
<font color='#E6731A' face='PuristaSemiBold'>Caution/ 1,000 to  50,000/ Prison</font><br/><br/><br/>

<font size='15' face='PuristaSemiBold'>Identity Documents Act 2010</font><br/><br/>
<font face='PuristaSemiBold'>Possession of false identity documents  </font><br/>
<font color='#E6731A' face='PuristaSemiBold'>Prison</font><br/><br/>
"
]
];


player createDiaryRecord ["crimes",
[
"Firearms",
"<br/><br/>
<font size='15' face='PuristaSemiBold'>Firearms Act 1968</font><br/> <br/>
<font face='PuristaSemiBold'>Possessing a firearm without a license</font><br/>
<font color='#E6731A' face='PuristaSemiBold'>Seizure of weapon and/ or ticket up to 50,000</font><br/>
<font face='PuristaSemiBold'>Visible firearm in a public area</font><br/>
<font color='#E6731A' face='PuristaSemiBold'>Up to 50,000 + Seizure of weapon</font><br/>
<font face='PuristaSemiBold'>Possessing of an illegal firearm  </font><br/>
<font color='#E6731A' face='PuristaSemiBold'>75,000 + Seizure of weapon</font><br/>
<font face='PuristaSemiBold'>Possessing of illegal firearm(s)</font><br/>
<font color='#E6731A' face='PuristaSemiBold'>Prison</font><br/><br/>
"
]
];

player createDiaryRecord ["crimes",
[
"Highway Safety (GENERAL)",
"<br/><br/>
<font size='15' face='PuristaSemiBold'>Road Traffic Act 1988</font> <br/> <br/>
<font color='#E6731A' face='PuristaSemiBold'>[50km/h on roads within cities]</font> <br/>
<font color='#E6731A' face='PuristaSemiBold'>[80km/h on highways outside of cities]</font> <br/>
<font color='#E6731A' face='PuristaSemiBold'>[130km/h on highways]</font> <br/> <br/>
<font face='PuristaSemiBold'>[Speeding fines in build up areas]</font> <br/>
<font face='PuristaSemiBold'>0-20 km/h above limit </font> <br/>
<font color='#E6731A' face='PuristaSemiBold'>Caution up to 10,000</font> <br/>
<font face='PuristaSemiBold'>21-40 km/h above limit</font> <br/>
<font color='#E6731A' face='PuristaSemiBold'>25,000</font> <br/>
<font face='PuristaSemiBold'>41-60 km/h above limit</font> <br/>
<font color='#E6731A' face='PuristaSemiBold'>50,000 </font> <br/>
<font face='PuristaSemiBold'>61+ km/h above limit</font> <br/>
<font color='#E6731A' face='PuristaSemiBold'>75,000</font> </p> <br/>
<font face='PuristaSemiBold'><strong>[Speeding fines on open roads]</strong></font> <br/>
<font face='PuristaSemiBold'>0-20 km/h above limit </font> <br/>
<font color='#E6731A' face='PuristaSemiBold'>Caution up to 10,000</font> <br/>
<font face='PuristaSemiBold'>21-40 km/h above limit</font> <br/>
<font color='#E6731A' face='PuristaSemiBold'>25,000</font> <br/>
<font face='PuristaSemiBold'>41-60 km/h above limit</font> <br/>
<font color='#E6731A' face='PuristaSemiBold'>50,000 </font> <br/>
<font face='PuristaSemiBold'>61-80 km/h above limit</font> <br/>
<font color='#E6731A' face='PuristaSemiBold'>75,000</font> </p> <br/>
<font face='PuristaSemiBold'>81+ km/h above limit</font> <br/>
<font color='#E6731A' face='PuristaSemiBold'>100,000</font> <br/> <br/>
<strong>General Offences</strong> <br/>
<font face='PuristaSemiBold'>No lights</font> <br/>
<font color='#E6731A' face='PuristaSemiBold'>Caution up to 5,000</font> <br/>
<font face='PuristaSemiBold'>Driving with Night Vision</font> <br/>
<font color='#E6731A' face='PuristaSemiBold'>Caution up to 15,000</font></p> <br/>
<font face='PuristaSemiBold'>Misuse of horn</font> <br/>
<font color='#E6731A' face='PuristaSemiBold'>Caution up to 20,000</font></p> <br/>
<font face='PuristaSemiBold'>Driving otherwise than in accordance with a license</font> <br/>
<font color='#E6731A' face='PuristaSemiBold'>10,000 up to 50,000 + seizure of vehicle</font></p> <br/>
<font face='PuristaSemiBold'>Driving in places other than a public highway</font> <br/>
<font color='#E6731A' face='PuristaSemiBold'>up to 25,000 + seizure of vehicle	</font></p> <br/>
<font face='PuristaSemiBold'>Failure to stop for the police</font> <br/>
<font color='#E6731A' face='PuristaSemiBold'>25,000 up to 50,000</font></p> <br/>
<font face='PuristaSemiBold'>Driving without due care and attention</font> <br/>
<font color='#E6731A' face='PuristaSemiBold'>Caution up to 25,000</font></p> <br/>
<font face='PuristaSemiBold'>Dangerous driving </font> <br/>
<font color='#E6731A' face='PuristaSemiBold'>Caution up to Prison</font></p> <br/>
<font face='PuristaSemiBold'>Driving under the influence of Drink or Drugs</font> <br/>
<font color='#E6731A' face='PuristaSemiBold'>25,000 to Prison/Seizure of Vehicle</font> <br/> <br/></p>
"
]
];


player createDiaryRecord ["crimes",
[
"Highway Safety (HATO)",
"<br/><br/>
<font size='15' face='PuristaSemiBold'> Traffic Management Act 2004</font><br/><br/>
<font face='PuristaSemiBold'>Failing to comply with a HATO  </font><br/>
<font color='#E6731A' face='PuristaSemiBold'>Caution/ 1,000 to 50,000/ Prison</font> <br/>
<font face='PuristaSemiBold'>wilfully obstructing a HATO in the execution of his duties</font><br/>
<font color='#E6731A' face='PuristaSemiBold'>Caution/ 1,000 to 50,000/ Prison</font> <br/>
<font face='PuristaSemiBold'>Impersonating a traffic officer</font><br/>
<font color='#E6731A' face='PuristaSemiBold'>Prison </font> <br/>
<font face='PuristaSemiBold'>Giving incorrect personal details or deceiving a traffic officer</font><br/>
<font color='#E6731A' face='PuristaSemiBold'>Caution/ 1,000 to 50,000</font></p><br/>
<font face='PuristaSemiBold'>Failing to comply with a sign placed by HATO</font><br/>
<font color='#E6731A' face='PuristaSemiBold'>Caution/ 1,000 to 50,000</font></p><br/><br/>
"
]
];
	
	player createDiaryRecord ["illegalitems",
		[
			"Illegal Items",
				"
				The following items are illegal to be in possession of:<br/><br/>
				1. Turtle<br/>
				2. Cocaine<br/>
				3. Heroin<br/>
				4. Cannabis/Marijuana<br/>
				5. Moonshine<br/>
				6. Goldbars<br/>
				7. Bolt cutter<br/>
				8. Explosive Charge<br/>	
				9. Lockpicks<br/>				
				10. Spike strips<br/>
				11. Cuffs (Allowed if you're a bounty hunter<br/>
				12. Oil<br/>
				"
		]
	];
	
	//--- Controls section

	player createDiaryRecord [ "controls",
		[
			"Interactions List",
				format [ "
				<br/>
				<font size='15' face='PuristaSemiBold'>User Interactions:</font><br />
				%1 Gathering resources.<br />
				%1 Picking up money.<br />
				%1 Picking up items, food and water.<br />
				%1 Interacting with some houses (buying, selling etc).<br />
				%1 Interacting with vehicles.<br />
				%1 Reviving players (medics only).<br />
				%1 Interacting with players.
				", "-" ]
		]
	];

	player createDiaryRecord [ "controls",
		[
			"Civilian Controls",
				"
				<br />
				<font size='15' face='PuristaSemiBold'>Restrain</font><br />
				Key: <font color='#E6731A' face='PuristaSemiBold'>Left Shift</font>+<font color='#E6731A' face='PuristaSemiBold'>R</font><br />
				(<font color='#FF0000'>requires handcuffs from advanced rebel shop</font>)
				"
		]
	];

	player createDiaryRecord [ "controls",
		[
			"Police Controls",
				"
				<br />
				<font size='15' face='PuristaSemiBold'>Restrain</font><br />
				Key: <font color='#E6731A' face='PuristaSemiBold'>Left Shift</font>+<font color='#E6731A' face='PuristaSemiBold'>R</font><br />
				<br />
				<font size='15' face='PuristaSemiBold'>Speed Radar</font><br />
				Key: <font color='#E6731A' face='PuristaSemiBold'>Numpad /</font><br />
				(<font color='#FF0000'>requires tactical glasses</font>)
				<br />
				"
		]
	];

	player createDiaryRecord [ "controls",
		[
			"Misc. Controls",
				"
				<br />
				<font size='15' face='PuristaSemiBold'>Hide HUD</font><br />
				Key: <font color='#E6731A' face='PuristaSemiBold'>Grave</font><br />
				<br />
				<font size='15' face='PuristaSemiBold'>Mute/Unmute Game Sound</font><br />
				Key: <font color='#E6731A' face='PuristaSemiBold'>Right Windows</font> or <font color='#E6731A' face='PuristaSemiBold'>User Action 8</font><br />
				<br />
				<font size='15' face='PuristaSemiBold'>Suppress Game Volume (Hold)</font><br />
				Key: <font color='#E6731A' face='PuristaSemiBold'>App Menu</font> or <font color='#E6731A' face='PuristaSemiBold'>User Action 9</font><br />
				<br />
				<font size='15' face='PuristaSemiBold'>Wave</font><br />
				Key: <font color='#E6731A' face='PuristaSemiBold'>F1</font><br />
				<br />
				"
		]
	];

	player createDiaryRecord [ "controls",
		[
			"General Controls",
				"
				<br />
				<font size='15' face='PuristaSemiBold'>Open User Menu</font><br />
				Key: <font color='#E6731A' face='PuristaSemiBold'>Y</font><br />
				<br />
				<font size='15' face='PuristaSemiBold'>Open Virtual Inventory</font><br />
				Key: <font color='#E6731A' face='PuristaSemiBold'>P</font><br />
				<br />
				<font size='15' face='PuristaSemiBold'>Open Messaging</font><br />
				Key: <font color='#E6731A' face='PuristaSemiBold'>Left Shift</font>+<font color='#E6731A' face='PuristaSemiBold'>M</font><br />
				<br />
				<font size='15' face='PuristaSemiBold'>Lock/Unlock Vehicles</font><br />
				Key: <font color='#E6731A' face='PuristaSemiBold'>U</font><br />
				<br />
				<font size='15' face='PuristaSemiBold'>Open Vehicle Trunk</font><br />
				Key: <font color='#E6731A' face='PuristaSemiBold'>T</font><br />
				<br />
				<font size='15' face='PuristaSemiBold'>User Interaction</font><br />
				Key: <font color='#E6731A' face='PuristaSemiBold'>Left Windows</font> or <font color='#E6731A' face='PuristaSemiBold'>User Action 10</font><br />
				(see interaction list)<br />
				<br />
				<font size='15' face='PuristaSemiBold'>Surrender</font><br />
				Key: <font color='#E6731A' face='PuristaSemiBold'>Left Shift</font>+<font color='#E6731A' face='PuristaSemiBold'>T</font><br />
				<br />
				<font size='15' face='PuristaSemiBold'>Holster Weapon</font><br />
				Key: <font color='#E6731A' face='PuristaSemiBold'>Left Shift</font>+<font color='#E6731A' face='PuristaSemiBold'>H</font><br />
				<br />
				<font size='15' face='PuristaSemiBold'>Unholster Weapon</font><br />
				Key: <font color='#E6731A' face='PuristaSemiBold'>Left Ctrl</font>+<font color='#E6731A' face='PuristaSemiBold'>H</font><br />
				<br />
				"
		]
	];