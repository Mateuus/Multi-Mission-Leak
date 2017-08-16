#define BLACK {0,0,0,1}
#define BLUE {0,0,1,1}
#define RED {1,0,0,1}
#define GREEN {0,1,0,1}
#define YELLOW {0.99,0.66,0.21,1};

class CfgMessages
{
    class Spawn
    {
      text = " Welcome Back!";
      colour[] = GREEN;
    };
    class PresidentWelcome
    {
      text = "Welcome President!";
      colour[] = GREEN;
    };
    class GovPay
    {
      text = "You received your Paycheck + Bonus!";
      colour[] = GREEN;
    };
    class PayCheck
    {
      text = "You received your Paycheck!";
      colour[] = GREEN;
    };
    class Seize
    {
      text = "You have seized the items!";
      colour[] = RED;
    };
    class ReceiveTransfer
    {
      text = "You received a bank transfer!";
      colour[] = GREEN;
    };
    class Withdraw
    {
      text = "You've withdrawn money!";
      colour[] = GREEN;
    };
    class LookingLocker
    {
      text = "Looking for your locker!";
      colour[] = GREEN;
    };
    class VaultFix
    {
      text = "Safe Fixed!";
      colour[] = GREEN;
    };
    class VaultLocked
    {
      text = "Safe Locked!";
      colour[] = RED;
    };
    class NoVehicleGarage
    {
      text = "No Vehicles found in your Garage";
      colour[] = RED;
    };
    class CashGiven
    {
    text = "You were given Cash";
      colour[] = GREEN;
    };
    class GivenKeys
    {
      text = "You were given Keys!";
      colour[] = GREEN;
    };
    class GangCreated
    {
      text = "Your Gang was created!";
      colour[] = GREEN;
    };
    class SyncAlready
    {
      text = "You've recently synced data!";
      colour[] = RED;
    };
    class SyncDone
    {
      text = "You've synced your data!";
      colour[] = GREEN;
    };
    class BackUpNot
    {
      text = "You can now call for backup!";
      colour[] = GREEN;
    };
    class LevelUp
    {
      text = "You leveled up!";
      colour[] = GREEN;
    };
    class NewLawyerJob
    {
      text = "A potential Client has requested a Lawyer!";
      colour[] = GREEN;
    };
    class LawyerJobYours
    {
      text = "You've taken the job - Go to the client marker on the map";
      colour[] = GREEN;
    };
    class ItemsFail
    {
      text = "You don't have the required items!";
      colour[] = RED;
    };
    class NotEnoughCops
    {
      text = "Not enough TSO on!";
      colour[] = RED;
    };
    class PrisonCoolDown
    {
      text = "The Prison is on a Cooldown!";
      colour[] = RED;
    };
    class BankCoolDown
    {
      text = "The Bank is on a Cooldown!";
      colour[] = RED;
    };
    class PrisonMainGateDown
    {
      text = "Prison Main Gate has recently been hit!";
      colour[] = RED;
    };
    class MainGateSuccess
    {
      text = "Main Prison Gate has been breached!";
      colour[] = GREEN;
    };
    class PrisonCoolDownDone
    {
      text = "The Prison is able to be hit!";
      colour[] = RED;
    };
    class BankCoolDownDone
    {
      text = "The Bank is able to be robbed!";
      colour[] = RED;
    };
    class PrisonTimer
    {
      text = "EMP Charge: 60 seconds have gone by!";
      colour[] = GREEN;
    };
    class BankTimer
    {
      text = "Bank Charge: 60 seconds have gone by!";
      colour[] = GREEN;
    };
    class EMPPROGRESS
    {
      text = "THE PRISON IS BEING HACKED - ALL UNITS RESPOND";
      colour[] = RED;
    };
    class PrisonMainGateBreakInProgress
    {
      text = "PRISON BREAK IN PROGRESS - ALL UNITS RESPOND";
      colour[] = RED;
    };
    class PrisonMainGateBreakIn
    {
      text = "PRISON ALERT: Main Gate has been breached!";
      colour[] = RED;
    };
    class MainGateStartFive
    {
      text = "Main Gate: 15 seconds till breach!";
      colour[] = GREEN;
    };
    class MainGateStartFourty
    {
      text = "Main Gate: 45 seconds till breach!";
      colour[] = GREEN;
    };
    class EMPChargeThree
    {
      text = "EMP Charge: 3 Minutes till Wipeout!";
      colour[] = GREEN;
    };
    class EMPChargeFour
    {
      text = "EMP Charge: 4 Minutes till Wipeout!";
      colour[] = GREEN;
    };
    class BankChargeThree
    {
      text = "Bank Charge: 3 Minutes till Blast!";
      colour[] = GREEN;
    };
    class BankChargeFour
    {
      text = "Bank Charge: 4 Minutes till Blast!";
      colour[] = GREEN;
    };
    class BankTimerStarted
    {
      text = "THE BANK IS BEING ROBBED - ALL UNITS RESPOND";
      colour[] = RED;
    };
    class BankTimerDone
    {
      text = "BANK ALERT: SAFE BREACHED!";
      colour[] = RED;
    };
    class VaultDefused
    {
      text = "BANK ALERT: Explosive Device Defused!";
      colour[] = RED;
    };
    class RetrievingVehicleGarage
    {
      text = "Retrieving Vehicle from Garage!";
      colour[] = GREEN;
    };
    class Smuggler
    {
      text = "You're smuggler instincts kicked in...";
      colour[] = GREEN;
    };
};
