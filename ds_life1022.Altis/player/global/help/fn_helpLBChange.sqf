/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Checks what shop the player is trying to access and displays the data needed
*/

disableSerialization;
private["_current","_index","_display","_list","_dialog","_unit"];

_index = lbData [2669,lbCurSel 2669];
_index = parseNumber(_index);
_display = findDisplay 905339;
_textArea = _display displayCtrl 1666;

switch(_index)do
	{
	case 0:
		{
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
		};
	case 1:
		{
		_textArea ctrlSetStructuredText parseText
		"<t color='#2E64FE' align='center' size='2'>Basic Controls</t><br/><br/>
		<t color='#4CCF00' align='center'>Interact with players/Vehicles/ATM's</t><t color='#F7FE2E' align='center'>   Left Windows Key</t><br/>
		<t color='#4CCF00' align='center'>Open Player Menu</t><t color='#F7FE2E' align='center'>   Y</t><br/>
		<t color='#4CCF00' align='center'>Lock/Unlock Vehicles</t><t color='#F7FE2E' align='center'>   U</t><br/>
		<t color='#4CCF00' align='center'>Open Vehicle Boot</t><t color='#F7FE2E' align='center'>   T</t><br/>
		<t color='#4CCF00' align='center'>Player Information</t><t color='#F7FE2E' align='center'>   1</t><br/>
		<t color='#4CCF00' align='center'>Holster Weapon</t><t color='#F7FE2E' align='center'>   Shift+H</t><br/>
		<t color='#4CCF00' align='center'>Unholster Weapon</t><t color='#F7FE2E' align='center'>   F</t><br/>
		<t color='#4CCF00' align='center'>Enter Nearest Unlocked Vehicle</t><t color='#F7FE2E' align='center'>   E</t><br/>
		<t color='#4CCF00' align='center'>Jump/Nos</t><t color='#F7FE2E' align='center'>   Space</t><br/>
		<t color='#4CCF00' align='center'>Hands on Head</t><t color='#F7FE2E' align='center'>   Shift+F1</t><br/>
		<t color='#4CCF00' align='center'>Send Text Message to Target</t><t color='#F7FE2E' align='center'>   2</t><br/>
		<t color='#4CCF00' align='center'>Send Text to recent list</t><t color='#F7FE2E' align='center'>   3</t><br/>
		<t color='#4CCF00' align='center'>Paycheck Status</t><t color='#F7FE2E' align='center'>   7</t><br/>
		<t color='#4CCF00' align='center'>Post Bug Report</t><t color='#F7FE2E' align='center'>   9</t><br/>
		<t color='#4CCF00' align='center'>Open Help Menu</t><t color='#F7FE2E' align='center'>   j</t><br/>
		<t color='#4CCF00' align='center'>Earplugs</t><t color='#F7FE2E' align='center'>   F3</t><br/>
		<t color='#4CCF00' align='center'>Donation Menu</t><t color='#F7FE2E' align='center'>   Left-Ctrl + 8</t><br/><br/>

		<t color='#2E64FE' align='center' size='2'>Civilian Controls</t><br/><br/>

		<t color='#4CCF00' align='center'>Mine resources</t><t color='#F7FE2E' align='center'>   Tab</t><br/>
		<t color='#4CCF00' align='center'>Knock Out Someone</t><t color='#F7FE2E' align='center'>   Shift+G</t><br/>
		<t color='#4CCF00' align='center'>Use Zipties</t><t color='#F7FE2E' align='center'>   Shift+R</t><br/><br/>

		<t color='#2E64FE' align='center' size='2'>Police/Security Controls</t><br/><br/>

		<t color='#4CCF00' align='center'>Open Nearest Bargate</t><t color='#F7FE2E' align='center'>   0</t><br/>
		<t color='#4CCF00' align='center'>Wanted Menu</t><t color='#F7FE2E' align='center'>   4</t><br/>
		<t color='#4CCF00' align='center'>Set Wanted Menu</t><t color='#F7FE2E' align='center'>   5</t><br/>
		<t color='#4CCF00' align='center'>Martial Law Menu</t><t color='#F7FE2E' align='center'>   7</t><br/>
		<t color='#4CCF00' align='center'>Siren</t><t color='#F7FE2E' align='center'>   F</t><br/>
		<t color='#4CCF00' align='center'>Police Status</t><t color='#F7FE2E' align='center'>   F2</t><br/>
		<t color='#4CCF00' align='center'>Speed Radar</t><t color='#F7FE2E' align='center'>   Ctrl+L</t><br/>
		<t color='#4CCF00' align='center'>Fire Fuel Dart</t><t color='#F7FE2E' align='center'>   Shift+2</t><br/>
		<t color='#4CCF00' align='center'>Remove Weapons From Ground</t><t color='#F7FE2E' align='center'>   Shift+3</t><br/>
		<t color='#4CCF00' align='center'>Retrain</t><t color='#F7FE2E' align='center'>   Shift+R</t><br/>
		<t color='#4CCF00' align='center'>Switch Ammot Type</t><t color='#F7FE2E' align='center'>   F4</t><br/>
		<t color='#4CCF00' align='center'>Cop Lights</t><t color='#F7FE2E' align='center'>   Shift+L</t><br/>
		<t color='#4CCF00' align='center'>Remove Weapons From Ground</t><t color='#F7FE2E' align='center'>   Shift+3</t><br/><br/>

		<t color='#2E64FE' align='center' size='2'>User Bound Key Controls</t><br/><br/>

		<t color='#4CCF00' align='center'>userAction1</t><t color='#F7FE2E' align='center'>   Eat Food</t><br/>
		<t color='#4CCF00' align='center'>userAction2</t><t color='#F7FE2E' align='center'>   Drink</t><br/>
		<t color='#4CCF00' align='center'>userAction3</t><t color='#F7FE2E' align='center'>   Heal</t><br/>
		<t color='#4CCF00' align='center'>userAction4</t><t color='#F7FE2E' align='center'>   Spike Strips (Cops/Security only)</t><br/>
		<t color='#4CCF00' align='center'>userAction5</t><t color='#F7FE2E' align='center'>   Unpack GoKart</t><br/>
		<t color='#4CCF00' align='center'>userAction6</t><t color='#F7FE2E' align='center'>   Fire Fueldart (Cops only)</t><br/>
		<t color='#4CCF00' align='center'>userAction7</t><t color='#F7FE2E' align='center'>   Open Bargates (Cops/Security only)</t><br/>
		<t color='#4CCF00' align='center'>userAction8</t><t color='#F7FE2E' align='center'>   Unlock Gang (If quest completed)</t><br/>
		<t color='#4CCF00' align='center'>userAction9</t><t color='#F7FE2E' align='center'>   Increase view distance by 500m</t><br/>
		<t color='#4CCF00' align='center'>userAction10</t><t color='#F7FE2E' align='center'>   Same as windows key</t><br/>
		<t color='#4CCF00' align='center'>userAction11</t><t color='#F7FE2E' align='center'>   Decrease view distance by 500m</t><br/>
		<t color='#4CCF00' align='center'>userAction12</t><t color='#F7FE2E' align='center'>   Inform target to pullover (Highway patrol only)</t><br/>
		<t color='#4CCF00' align='center'>userAction13</t><t color='#F7FE2E' align='center'>   Un-escort (Cops only)</t><br/>
		<t color='#4CCF00' align='center'>userAction14</t><t color='#F7FE2E' align='center'>   Retexture Clothing/Backpack (Donors only) Must have assigned clan base outfit</t><br/>
		<t color='#4CCF00' align='center'>userAction15</t><t color='#F7FE2E' align='center'>   Retexture vehicle (Donors only) Must have assigned clan base vehicle texture</t><br/>
		<t color='#4CCF00' align='center'>userAction16</t><t color='#F7FE2E' align='center'>   Enable / Disable help/trade chat channels</t><br/>
		";
		};
	case 2:
		{
		_textArea ctrlSetStructuredText parseText
			"<t color='#2E64FE' align='center' size='2'>Complaints</t><br/><br/>
			<t color='#4CCF00' align='center'>For assistance with in-game complaints such as RDM etc please visit our TS and enter the helpdesk channel</t><br/><br/>
			<t color='#F7FE2E' align='center'>TS3 - ts.thedarksidegames.com:10004</t><br/><br/><br/>
			<t color='#2E64FE' align='center' size='2'>Comp Claims</t><br/><br/>
			<t color='#4CCF00' align='center'>To request compensation for lost in-game items, please visit our forums and fill out a comp claim form</t><br/><br/>
			<t color='#F7FE2E' align='center'>WEB - www.thedarksidegames.com</t><br/><br/><br/>
			<t color='#FF0000' align='center'>Do not complain about issues in help chat on the game, this channel is only to be used for quick in-game questions</t>
			";
		};
	case 3:
		{
		_textArea ctrlSetStructuredText parseText
			"<t color='#2E64FE' align='center' size='2'>Rules</t><br/><br/>
			<t color='#4CCF00' align='center'>All the rules can be found on the map screen under general rules</t><br/><br/>
			<t color='#F7FE2E' align='center'>Don't be afraid to ask in help chat if you would like something explained to you</t><br/><br/><br/>
			<t color='#2E64FE' align='center' size='2'>Breaking the rules</t><br/><br/>
			<t color='#4CCF00' align='center'>You can be kicked or banned without warning for breaking rules. We expect everybody to read them before engaging in combat</t><br/><br/>
			";
		};
	case 4:
		{
		_textArea ctrlSetStructuredText parseText
			"<t color='#2E64FE' align='center' size='2'>Donations</t><br/><br/>
			<t color='#4CCF00' align='center'>Donation information is available on the website and the map screen</t><br/><br/>
			<t color='#F7FE2E' align='center'>Pop into TS and talk to a helpdesk member if you have any questions regarding this matter</t><br/><br/><br/>
			<t color='#2E64FE' align='center' size='2'>When will my donation status be applied?</t><br/><br/>
			<t color='#4CCF00' align='center'>Your donation status will be applied as soon as an admin sees it. If you feel you have been waiting too long, just message an admin on TS</t><br/><br/>
			";
		};
	case 5:
		{
		_textArea ctrlSetStructuredText parseText
			"<t color='#2E64FE' align='center' size='2'>Server restarts</t><br/><br/>
			<t color='#4CCF00' align='center'>Server restarts happen when the admins are available and feel that the server needs one</t><br/><br/>
			<t color='#F7FE2E' align='center'>There is no set restart times, however you can expect one when the server is over 500 minutes uptime. After this time do not start massive runs, keep things small so you will beable to finish/store within the 15 minute warning period</t><br/><br/><br/>
			";
		};
	case 6:
		{
		_textArea ctrlSetStructuredText parseText
			"<t color='#2E64FE' align='center' size='2'>Whitelisted Civilians</t><br/><br/>
			<t color='#4CCF00' align='center'>We currently have three whitelisted civilians roles. Medic, Mechanic and Security Contractors</t><br/><br/>
			<t color='#F7FE2E' align='center'>To apply for these roles, visit our website and post a whitelist civilian app in the proper area</t><br/><br/><br/>
			";
		};
	case 7:
		{
		_textArea ctrlSetStructuredText parseText
			"<t color='#2E64FE' align='center' size='2'>Darkside Police Force</t><br/><br/>
			<t color='#4CCF00' align='center'>To play as a public cop you must first have 10 hours as civilian. At this point you can attempt to join a public cop slot and the police TS channel</t><br/><br/>
			<t color='#F7FE2E' align='center'>Once you feel ready (And you have over 10 hours as public cop) you can post a police app on our forums for an interview (Ask a senior sergeant or above for an interview) upon passing this interview you can become a whitelisted police officer</t><br/><br/><br/>
			";
		};
	case 8:
		{
		_textArea ctrlSetStructuredText parseText
			"<t color='#2E64FE' align='center' size='2'>Custom Real Estate Item Limits</t><br/><br/>
			<t color='#4CCF00' align='center'>Custom Real Estate can be created at the real estate agent, all details can be found there. This is a list of the maximum number of each item that you can use</t><br/><br/>
			<t color='#F7FE2E' align='center'>Advanced Security Upgrade: 5<br/>
			<t color='#F7FE2E' align='center'>CPU: 12<br/>
			<t color='#F7FE2E' align='center'>Circuit Board: 20<br/>
			<t color='#F7FE2E' align='center'>Relic: 20<br/>
			<t color='#F7FE2E' align='center'>Spy Document: 30<br/>
			<t color='#F7FE2E' align='center'>Illegal Relic: 30<br/>
			<t color='#F7FE2E' align='center'>Crystal Glass: 30<br/>
			<t color='#F7FE2E' align='center'>Small Battery: 40<br/>
			<t color='#F7FE2E' align='center'>Treated Bronze: 40<br/>
			<t color='#F7FE2E' align='center'>Steel: 70<br/>
			<t color='#F7FE2E' align='center'>Hardened Lumber: 120<br/>
			<t color='#F7FE2E' align='center'>Cut Diamonds: 125<br/>
			<t color='#F7FE2E' align='center'>Cement: 140<br/><br/><br/><br/>
			<t color='#4CCF00' align='center'>Using these numbers it is up to you to decide which is the best combination of materials to create your Real Estate</t><br/><br/>
			";
		};
	case 9:
		{
		_textArea ctrlSetStructuredText parseText
			"<t color='#2E64FE' align='center' size='2'>Prestiging your quest line</t><br/><br/>
			<t color='#4CCF00' align='center'>When you complete either the Civilian, Gang or Rebel questline, you can visit the insurance broker to restart the quest line with a special reward (Each prestige increases your run speed by 2.5% with a max of 25% increase</t><br/><br/>
			<t color='#F7FE2E' align='center'>Civilian Quest Line reward (Cost: $10m multiplied by prestige numberof that line)<br/>
			<t color='#F7FE2E' align='center'>CCU (Civilian Command Unit)<br/>
			<t color='#F7FE2E' align='center'>(1st Time) An un-chopable truck that you can do the following from<br/>
			<t color='#F7FE2E' align='center'>* Buy all civilian items/licenses<br/>
			<t color='#F7FE2E' align='center'>* Process all legal goods<br/>
			<t color='#F7FE2E' align='center'>* Use factory<br/>
			<t color='#F7FE2E' align='center'>* Treat Sickness<br/>
			<t color='#F7FE2E' align='center'>* Unlimited speed boost on a 30s cooldown timer<br/>
			<t color='#F7FE2E' align='center'>* Buy lotto<br/><br/>
			<t color='#F7FE2E' align='center'>(2nd Time) The ability to use all CCU functions from any vehicle that you have the keys to. (Excluding nos and chop shop invulnerability)<br/>
			<t color='#F7FE2E' align='center'>(3rd Time Onwards) New CCU per prestige<br/><br/><br/>
			<t color='#F7FE2E' align='center'>Gang Quest Line reward (Cost: $10m multiplied by prestige numberof that line)<br/>
			<t color='#F7FE2E' align='center'>(1st Time) GCU (Gang Command Unit)<br/>
			<t color='#F7FE2E' align='center'>An un-chopable APC that you can do the following from....<br/>
			<t color='#F7FE2E' align='center'>* Buy all rebel items/weapons/licenses<br/>
			<t color='#F7FE2E' align='center'>* Process all illegal goods<br/>
			<t color='#F7FE2E' align='center'>* Use factory<br/>
			<t color='#F7FE2E' align='center'>* Treat Sickness<br/>
			<t color='#F7FE2E' align='center'>* Unlimited speed boost on a 30s cooldown timer<br/>
			<t color='#F7FE2E' align='center'>* Buy lotto<br/><br/><br/>
			<t color='#F7FE2E' align='center'>(2nd Time onwards) GCU (Gang Command Unit)<br/>
			<t color='#F7FE2E' align='center'>An un-chopable APC that you can do the following from....<br/>
			<t color='#F7FE2E' align='center'>* Buy all rebel items/weapons/licenses<br/>
			<t color='#F7FE2E' align='center'>* Process all illegal goods<br/>
			<t color='#F7FE2E' align='center'>* Use factory<br/>
			<t color='#F7FE2E' align='center'>* Treat Sickness<br/>
			<t color='#F7FE2E' align='center'>* Unlimited speed boost on a 30s cooldown timer<br/>
			<t color='#F7FE2E' align='center'>* Buy lotto<br/>
			<t color='#F7FE2E' align='center'>* Rebel Token shop<br/><br/>
			<t color='#F7FE2E' align='center'>(1st Time) Rebel Quest Line reward (Cost: $10m multiplied by prestige numberof that line)<br/>
			<t color='#F7FE2E' align='center'>Special weapons available using rebel tokens from the kos flag and clan base flags<br/>
			<t color='#F7FE2E' align='center'>Weapons include those normally only obtainable from Fortknox and convoy missions....<br/><br/><br/>
			<t color='#F7FE2E' align='center'>(2nd Time onwards) Rebel Quest Line reward  (Cost: $10m multiplied by prestige numberof that line)<br/>
			<t color='#F7FE2E' align='center'>Special weapons available using rebel tokens from the kos flag and clan base flags (Discounted)<br/>
			<t color='#F7FE2E' align='center'>Weapons include those normally only obtainable from Fortknox and convoy missions....<br/>
			<t color='#F7FE2E' align='center'>Rebel token items at a discounted price plus more items added (Also forsale at GCU advanced<br/><br/><br/>
			";
		};
	case 10:
		{
		_textArea ctrlSetStructuredText parseText
			"<t color='#2E64FE' align='center' size='2'>Police Vehicle Discounts</t><br/><br/>
			<t color='#4CCF00' align='center'>Police receive a discount on their vehicle prices if they complete the following goals</t><br/><br/><br/>
			<t color='#4CCF00' align='center'>10% Discount<br/></t>
			<t color='#F7FE2E' align='center'>* Over 10 hours on cop<br/>
			<t color='#F7FE2E' align='center'>* Over 50 vehicle impounds<br/>
			<t color='#F7FE2E' align='center'>* Over 10 tickets<br/>
			<t color='#F7FE2E' align='center'>* Over 20 arrest<br/>
			<t color='#4CCF00' align='center'>20% Discount<br/></t>
			<t color='#F7FE2E' align='center'>* Over 20 hours on cop<br/>
			<t color='#F7FE2E' align='center'>* Over 100 vehicle impounds<br/>
			<t color='#F7FE2E' align='center'>* Over 20 tickets<br/>
			<t color='#F7FE2E' align='center'>* Over 40 arrest<br/>
			<t color='#4CCF00' align='center'>30% Discount<br/></t>
			<t color='#F7FE2E' align='center'>* Over 50 hours on cop<br/>
			<t color='#F7FE2E' align='center'>* Over 200 vehicle impounds<br/>
			<t color='#F7FE2E' align='center'>* Over 40 tickets<br/>
			<t color='#F7FE2E' align='center'>* Over 80 arrest<br/>
			<t color='#4CCF00' align='center'>40% Discount<br/></t>
			<t color='#F7FE2E' align='center'>* Over 100 hours on cop<br/>
			<t color='#F7FE2E' align='center'>* Over 300 vehicle impounds<br/>
			<t color='#F7FE2E' align='center'>* Over 80 tickets<br/>
			<t color='#F7FE2E' align='center'>* Over 160 arrest<br/>
			<t color='#4CCF00' align='center'>50% Discount<br/></t>
			<t color='#F7FE2E' align='center'>* Over 200 hours on cop<br/>
			<t color='#F7FE2E' align='center'>* Over 400 vehicle impounds<br/>
			<t color='#F7FE2E' align='center'>* Over 120 tickets<br/>
			<t color='#F7FE2E' align='center'>* Over 250 arrest<br/><br/></t>
			<t color='#4CCF00' align='center'>Police also receive the standard 5% per perk level on vehicle purchases</t><br/><br/>
			";
		};
	case 11:
		{
		_textArea ctrlSetStructuredText parseText
			"<t color='#2E64FE' align='center' size='2'>Morality Explained</t><br/><br/>
			<t color='#4CCF00' align='center'>The following are the advantages of having low or high morality, and how to achieve a morality level</t><br/><br/><br/>
			<t color='#4CCF00' align='center'>Low Moral Benefits<br/></t>
			<t color='#F7FE2E' align='center'>* Faster drug growing speed<br/>
			<t color='#F7FE2E' align='center'>* More money stolen from gas station<br/>
			<t color='#F7FE2E' align='center'>* Quicker gang hideout capture<br/>
			<t color='#F7FE2E' align='center'>* Higher chance of sabotaged jail work succeeding<br/>
			<t color='#F7FE2E' align='center'>* Siphon Kits are more effective<br/>
			<t color='#4CCF00' align='center'>High Moral Benefits<br/></t>
			<t color='#F7FE2E' align='center'>* No chance to mine zero of a mineral<br/>
			<t color='#F7FE2E' align='center'>* Lower chance of being identified for a crime<br/>
			<t color='#F7FE2E' align='center'>* Less chance of a headshot making you non-revive-able<br/>
			<t color='#F7FE2E' align='center'>* Higher chance of hard jail work succeeding<br/>
			<t color='#F7FE2E' align='center'>* Less likely to be identified in an area if you are wanted<br/>
			<t color='#F7FE2E' align='center'>* Less likely to incur expensive real estate damages<br/>
			<t color='#F7FE2E' align='center'>* Auto Miner works much faster<br/>
			<t color='#F7FE2E' align='center'>* Gas Cost a little less<br/>
			<t color='#F7FE2E' align='center'>* Vehicles repair faster<br/>
			<t color='#F7FE2E' align='center'>* Fuel darts fire/reload quicker<br/>
			<t color='#F7FE2E' align='center'>* MCU setup time quicker<br/>
			<t color='#F7FE2E' align='center'>* Quicker vehicle impound speed<br/>
			<t color='#F7FE2E' align='center'>* Much lower scope sway<br/><br/>
			<t color='#4CCF00' align='center'>Activities to lower morality<br/></t>
			<t color='#F7FE2E' align='center'>* Performing Illegal Activities<br/>
			<t color='#F7FE2E' align='center'>* Completing Illegal Jobs<br/>
			<t color='#F7FE2E' align='center'>* Killing people with high morality<br/>
			<t color='#F7FE2E' align='center'>* Selling Illegal Items<br/><br/></t>
			<t color='#4CCF00' align='center'>Activities to increase morality</t><br/>
			<t color='#F7FE2E' align='center'>* Completing Legal Jobs<br/><br/></t>
			";
		};
	case 12:
		{
		_textArea ctrlSetStructuredText parseText
			"<t color='#2E64FE' align='center' size='2'>Realistic Mode</t><br/><br/>
			<t color='#4CCF00' align='center'>The following are the changes made to a player when they are in Realistic mode</t><br/>
			<t color='#4CCF00' align='center'>You can only switch between modes once per login, you must relog to either turn it on or off again<br/></t><br/><br/>
			<t color='#FF0000' align='center'>To switch between modes visit the Athira Insurance Broker<br/></t><br/><br/>
			<t color='#4CCF00' align='center'>Changes<br/><br/>
			<t color='#F7FE2E' align='center'>* Forced first person view at all times<br/></t>
			<t color='#F7FE2E' align='center'>* Only visible on MCU/Security markers within 50m<br/></t>
			<t color='#F7FE2E' align='center'>* High protection from flash grenades when wearing any face covering helmet or shemagh<br/></t>
			<t color='#F7FE2E' align='center'>* Complete protection from gas grenades when wearing any helmet or shemagh<br/></t>
			<t color='#F7FE2E' align='center'>* Shorter respawn timer<br/></t>
			<t color='#F7FE2E' align='center'>* 50% more effective body armour<br/></t>
			<t color='#F7FE2E' align='center'>* Not made un-revival when headshot<br/></t>
			<t color='#F7FE2E' align='center'>* 50% faster jail work<br/></t>
			<t color='#F7FE2E' align='center'>* Scope sway is always halved<br/></t>
			<t color='#F7FE2E' align='center'>* Will become unrestrained quicker if an officer gets to far from you<br/></t>
			<t color='#F7FE2E' align='center'>* Vehicles become more difficult to lockpick<br/></t>
			<t color='#F7FE2E' align='center'>* Stay drunk for double the time (10 minutes)<br/></t>
			<t color='#F7FE2E' align='center'>* Can revive/strangle even without advanced rebel training<br/></t>
			<t color='#F7FE2E' align='center'>* Very low detection rates while robbing gas stations/hospitals while wearing a face helmet or shemagh<br/></t>
			<t color='#F7FE2E' align='center'>* 50% extra payment for the following jobs<br/></t>
			<t color='#F7FE2E' align='center'>* Vehicle repair quicker<br/></t>
			<t color='#F7FE2E' align='center'>*** Fuel delivery<br/></t>
			<t color='#F7FE2E' align='center'>*** Chopper Pilot<br/></t>
			<t color='#F7FE2E' align='center'>*** Crop Dusting<br/></t>
			<t color='#F7FE2E' align='center'>*** Truck Driving<br/></t>
			<t color='#F7FE2E' align='center'>*** Taxi Missions (Land/Air/Sea)<br/></t>
			<t color='#F7FE2E' align='center'>*** Drug Convoys<br/></t>
			<t color='#F7FE2E' align='center'>*** Car bombs<br/></t>
			";
		};
	case 13:
		{
		_textArea ctrlSetStructuredText parseText
			"<t color='#2E64FE' align='center' size='2'>Martial Law</t><br/><br/>
			<t color='#4CCF00' align='center'>Martial Law can be declared by police once the crime rate is 8 or over (It automatically ends after 60 minutes)</t><br/><br/><br/>
			<t color='#2E64FE' align='center'>What this means for civilians</t><br/><br/>
			<t color='#4CCF00' align='center'>* All police are kill on sight</t><br/>
			<t color='#4CCF00' align='center'>* Civil rights including the right to bare arms are revoked</t><br/>
			<t color='#4CCF00' align='center'>* You may be shot on sight if you are armed, put away your weapons during martial law</t><br/>
			<t color='#4CCF00' align='center'>* Police have no NLR rule</t><br/>
			<t color='#4CCF00' align='center'>* Chopping MCU/Gorgons pays double</t><br/>
			<t color='#4CCF00' align='center'>* Bank only has large money bags</t><br/>
			<t color='#4CCF00' align='center'>* Double the cash in Fortknox</t><br/>
			<t color='#4CCF00' align='center'>* No limit to items in Research Facility</t><br/>
			<t color='#4CCF00' align='center'>* Extra weapons in Fortknox</t><br/><br/><br/><br/>
			<t color='#2E64FE' align='center'>What this means for Police</t><br/><br/>
			<t color='#4CCF00' align='center'>* Ability to break NLR but can not spawn/teleport within 1.5km of death</t><br/>
			<t color='#4CCF00' align='center'>* Any armed person can be shot dead</t><br/>
			<t color='#4CCF00' align='center'>* Simple RP only needed while jailing criminals</t><br/>
			<t color='#4CCF00' align='center'>* All raid rules suspended</t><br/>
			<t color='#4CCF00' align='center'>* Any armed vehicle can be used (Kajmans have their own conditions)</t><br/>
			<t color='#4CCF00' align='center'>* Body Armour Buff</t><br/>
			<t color='#4CCF00' align='center'>* No RPG restrictions</t><br/>
			<t color='#4CCF00' align='center'>* Ability to use satchal charges</t><br/>
			<t color='#4CCF00' align='center'>* All search rules suspended</t><br/>
			<t color='#4CCF00' align='center'>* Any vehicle used by criminals can be destroyed (Criminal who has/will be killed/arrested)</t><br/>
			";
		};
	case 14:
		{
		_textArea ctrlSetStructuredText parseText
			"<t color='#2E64FE' align='center' size='2'>4 Frame Glitch</t><br/><br/>
			<t color='#4CCF00' align='center'>Arma3 has a memory leak which causes clients to get stuck on extremely low frames, normally only fixing when the clients games is completely restarted. The following are methods that have helped to minimise the issue</t><br/><br/><br/>
			<t color='#2E64FE' align='center'>* In your games launcher, click on parameters and scroll down to Memory allocator. Tick this box and select JEMalloc_bi</t><br/><br/>
			<t color='#2E64FE' align='center'>* In your game options, go to audio settings and turn your sound sources down to the lowest possible setting</t><br/><br/><br/>
			<t color='#4CCF00' align='center'>What to do if you get this glitch?</t><br/><br/><br/>
			<t color='#2E64FE' align='center'>* Take a screen shot of the glitch</t><br/><br/>
			<t color='#2E64FE' align='center'>* Message those you are fighting (Or get a friend to) and relog</t><br/><br/>
			<t color='#2E64FE' align='center'>* If you were fighting cops and were cornered/stunned/restrained, then you must hand yourself in right away (Without offloading all of your gear)</t><br/><br/>
			<t color='#2E64FE' align='center'>* If you were fighting cops and your team has lost by the time you re-connect, you must hand yourself in right away (Without offloading all of your gear)</t><br/><br/>
			<t color='#2E64FE' align='center'>* If you were fighting cops and your team is still fighting them when you relog, you may rejoin them so long as you have let the police know you are returning</t><br/><br/>
			<t color='#2E64FE' align='center'>* If you are a cop, you may return</t><br/>
			";
		};
	case 15:
		{
		_textArea ctrlSetStructuredText parseText format ["%1",DS_eventStr];
		};
	};