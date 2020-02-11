#include <sourcemod>
#include <tf2_stocks>
#include <sdktools>
#include <client_group_status>
#include <clientprefs>
#include <morecolors>

Handle h_killstreakTier[3];
Handle h_killstreakSheen[3];
#define KillstreakTag "{green}[Killstreak]{white}"

public KillstreakMenuCallback(Handle MenuH, MenuAction action, int client, int itemNum)
{
	if(action == MenuAction_Select)
	{
		if(itemNum == 1)
		{
			Handle h_Menu = CreateMenu(KillstreakTiersMenuCallback);
			SetMenuTitle(h_Menu, "Recursion.TF >> Killstreak - Tiers");
			AddMenuItem(h_Menu, "0", "------------------------------", ITEMDRAW_DISABLED);
			AddMenuItem(h_Menu, "1", "Primary Weapon");
			AddMenuItem(h_Menu, "2", "Secondary Weapon");
			AddMenuItem(h_Menu, "3", "Melee Weapon");
			DisplayMenu(h_Menu, client, 60);
		}
		if(itemNum == 2)
		{
			Handle h_Menu = CreateMenu(KillstreakSheensMenuCallback);
			SetMenuTitle(h_Menu, "Recursion.TF >> Killstreak - Sheens");
			AddMenuItem(h_Menu, "0", "------------------------------", ITEMDRAW_DISABLED);
			AddMenuItem(h_Menu, "1", "Primary Weapon");
			AddMenuItem(h_Menu, "2", "Secondary Weapon");
			AddMenuItem(h_Menu, "3", "Melee Weapon");
			DisplayMenu(h_Menu, client, 60);
		}
	}
	if(action == MenuAction_End)
	{
		CloseHandle(MenuH);
	}

	return 0;
}

/* Tier menus */

public KillstreakTiersMenuCallback(Handle MenuH, MenuAction action, int client, int itemNum)
{
	if(action == MenuAction_Select)
	{
		if(itemNum == 1)
		{
			Handle h_Menu = CreateMenu(KillstreakTiersPrimaryMenuCallback);
			SetMenuTitle(h_Menu, "Recursion.TF >> Killstreak - Tiers - Primary");
			AddMenuItem(h_Menu, "divider", "------------------------------", ITEMDRAW_DISABLED);
			AddMenuItem(h_Menu, "0", "None");
			AddMenuItem(h_Menu, "1", "Normal");
			AddMenuItem(h_Menu, "2", "Specialized");
			AddMenuItem(h_Menu, "3", "Professional");
			DisplayMenu(h_Menu, client, 60);
		}
		if(itemNum == 2)
		{
			Handle h_Menu = CreateMenu(KillstreakTiersSecondaryMenuCallback);
			SetMenuTitle(h_Menu, "Recursion.TF >> Killstreak - Tiers - Secondary");
			AddMenuItem(h_Menu, "divider", "------------------------------", ITEMDRAW_DISABLED);
			AddMenuItem(h_Menu, "0", "None");
			AddMenuItem(h_Menu, "1", "Normal");
			AddMenuItem(h_Menu, "2", "Specialized");
			AddMenuItem(h_Menu, "3", "Professional");
			DisplayMenu(h_Menu, client, 60);
		}
		if(itemNum == 3)
		{
			Handle h_Menu = CreateMenu(KillstreakTiersMeleeMenuCallback);
			SetMenuTitle(h_Menu, "Recursion.TF >> Killstreak - Tiers - Melee");
			AddMenuItem(h_Menu, "divider", "------------------------------", ITEMDRAW_DISABLED);
			AddMenuItem(h_Menu, "0", "None");
			AddMenuItem(h_Menu, "1", "Normal");
			AddMenuItem(h_Menu, "2", "Specialized");
			AddMenuItem(h_Menu, "3", "Professional");
			DisplayMenu(h_Menu, client, 60);
		}
	}
	if(action == MenuAction_End)
	{
		CloseHandle(MenuH);
	}

	return 0;
}

public KillstreakTiersPrimaryMenuCallback(Handle MenuH, MenuAction action, int client, int itemNum)
{
	if(action == MenuAction_Select)
	{
		char item[8], itemName[24];
		GetMenuItem(MenuH, itemNum, item, sizeof(item));
		int itemId = StringToInt(item);
		GetTierNameById(itemId, itemName);

		CPrintToChat(client, "%s Primary weapon's killstreak tier set to: %s", KillstreakTag, itemName);
		SetClientCookie(client, h_killstreakTier[0], item)
	}

	if(action == MenuAction_End)
	{
		CloseHandle(MenuH);
	}

	return 0;
}

public KillstreakTiersSecondaryMenuCallback(Handle MenuH, MenuAction action, int client, int itemNum)
{
	if(action == MenuAction_Select)
	{
		char item[8], itemName[24];
		GetMenuItem(MenuH, itemNum, item, sizeof(item));
		int itemId = StringToInt(item);
		GetTierNameById(itemId, itemName);

		CPrintToChat(client, "%s Secondary weapon's killstreak tier set to: %s", KillstreakTag, itemName);
		SetClientCookie(client, h_killstreakTier[1], item)
	}

	if(action == MenuAction_End)
	{
		CloseHandle(MenuH);
	}

	return 0;
}

public KillstreakTiersMeleeMenuCallback(Handle MenuH, MenuAction action, int client, int itemNum)
{
	if(action == MenuAction_Select)
	{
		char item[8], itemName[24];
		GetMenuItem(MenuH, itemNum, item, sizeof(item));
		int itemId = StringToInt(item);
		GetTierNameById(itemId, itemName);

		CPrintToChat(client, "%s Melee weapon's killstreak tier set to: %s", KillstreakTag, itemName);
		SetClientCookie(client, h_killstreakTier[2], item)
	}

	if(action == MenuAction_End)
	{
		CloseHandle(MenuH);
	}

	return 0;
}

void GetTierNameById(int id, char[] name)
{
	if(id == 0) Format(name, 24, "None");
	if(id == 1) Format(name, 24, "Normal");
	if(id == 2) Format(name, 24, "Specialized");
	if(id == 3) Format(name, 24, "Professional");
}

/* Sheen menus */

public KillstreakSheensMenuCallback(Handle MenuH, MenuAction action, int client, int itemNum)
{
	if(action == MenuAction_Select)
	{
		if(itemNum == 1)
		{
			Handle h_Menu = CreateMenu(KillstreakSheensPrimaryMenuCallback);
			SetMenuTitle(h_Menu, "Recursion.TF >> Killstreak - Sheens - Primary");
			AddMenuItem(h_Menu, "divider", "------------------------------", ITEMDRAW_DISABLED);
			AddMenuItem(h_Menu, "0", "None");
			AddMenuItem(h_Menu, "1", "Team Shine");
			AddMenuItem(h_Menu, "2", "Deadly Daffodil");
			AddMenuItem(h_Menu, "3", "Manndarin");
			AddMenuItem(h_Menu, "4", "Mean Green");
			AddMenuItem(h_Menu, "5", "Agonizing Emerald");
			AddMenuItem(h_Menu, "6", "Villainous Violet");
			AddMenuItem(h_Menu, "7", "Hot Rod");
			DisplayMenu(h_Menu, client, 60);
		}
		if(itemNum == 2)
		{
			Handle h_Menu = CreateMenu(KillstreakSheensSecondaryMenuCallback);
			SetMenuTitle(h_Menu, "Recursion.TF >> Killstreak - Sheens - Secondary");
			AddMenuItem(h_Menu, "divider", "------------------------------", ITEMDRAW_DISABLED);
			AddMenuItem(h_Menu, "0", "None");
			AddMenuItem(h_Menu, "1", "Team Shine");
			AddMenuItem(h_Menu, "2", "Deadly Daffodil");
			AddMenuItem(h_Menu, "3", "Manndarin");
			AddMenuItem(h_Menu, "4", "Mean Green");
			AddMenuItem(h_Menu, "5", "Agonizing Emerald");
			AddMenuItem(h_Menu, "6", "Villainous Violet");
			AddMenuItem(h_Menu, "7", "Hot Rod");
			DisplayMenu(h_Menu, client, 60);
		}
		if(itemNum == 3)
		{
			Handle h_Menu = CreateMenu(KillstreakSheensMeleeMenuCallback);
			SetMenuTitle(h_Menu, "Recursion.TF >> Killstreak - Sheens - Melee");
			AddMenuItem(h_Menu, "divider", "------------------------------", ITEMDRAW_DISABLED);
			AddMenuItem(h_Menu, "0", "None");
			AddMenuItem(h_Menu, "1", "Team Shine");
			AddMenuItem(h_Menu, "2", "Deadly Daffodil");
			AddMenuItem(h_Menu, "3", "Manndarin");
			AddMenuItem(h_Menu, "4", "Mean Green");
			AddMenuItem(h_Menu, "5", "Agonizing Emerald");
			AddMenuItem(h_Menu, "6", "Villainous Violet");
			AddMenuItem(h_Menu, "7", "Hot Rod");
			DisplayMenu(h_Menu, client, 60);
		}
	}
	if(action == MenuAction_End)
	{
		CloseHandle(MenuH);
	}

	return 0;
}

public KillstreakSheensPrimaryMenuCallback(Handle MenuH, MenuAction action, int client, int itemNum)
{
	if(action == MenuAction_Select)
	{
		char item[8], itemName[24];
		GetMenuItem(MenuH, itemNum, item, sizeof(item));
		int itemId = StringToInt(item);
		GetSheenNameById(itemId, itemName);

		CPrintToChat(client, "%s Primary weapon's killstreak sheen set to: %s", KillstreakTag, itemName);
		SetClientCookie(client, h_killstreakSheen[0], item)
	}

	if(action == MenuAction_End)
	{
		CloseHandle(MenuH);
	}

	return 0;
}

public KillstreakSheensSecondaryMenuCallback(Handle MenuH, MenuAction action, int client, int itemNum)
{
	if(action == MenuAction_Select)
	{
		char item[8], itemName[24];
		GetMenuItem(MenuH, itemNum, item, sizeof(item));
		int itemId = StringToInt(item);
		GetSheenNameById(itemId, itemName);

		CPrintToChat(client, "%s Secondary weapon's killstreak sheen set to: %s", KillstreakTag, itemName);
		SetClientCookie(client, h_killstreakSheen[1], item)
	}

	if(action == MenuAction_End)
	{
		CloseHandle(MenuH);
	}

	return 0;
}

public KillstreakSheensMeleeMenuCallback(Handle MenuH, MenuAction action, int client, int itemNum)
{
	if(action == MenuAction_Select)
	{
		char item[8], itemName[24];
		GetMenuItem(MenuH, itemNum, item, sizeof(item));
		int itemId = StringToInt(item);
		GetSheenNameById(itemId, itemName);

		CPrintToChat(client, "%s Melee weapon's killstreak sheen set to: %s", KillstreakTag, itemName);
		SetClientCookie(client, h_killstreakSheen[2], item);
	}

	if(action == MenuAction_End)
	{
		CloseHandle(MenuH);
	}

	return 0;
}

void GetSheenNameById(int id, char[] name)
{
	if(id == 0) Format(name, 24, "None");
	if(id == 1) Format(name, 24, "Team Shine");
	if(id == 2) Format(name, 24, "Deadly Daffodil");
	if(id == 3) Format(name, 24, "Manndarin");
	if(id == 4) Format(name, 24, "Mean Green");
	if(id == 5) Format(name, 24, "Agonizing Emerald");
	if(id == 6) Format(name, 24, "Villainous Violet");
	if(id == 7) Format(name, 24, "Hot Rod");
}

Killstreak_EquipTier(int weapon, float attribute, int numAttributes)
{
	TF2Items_SetAttributeNew("CBaseCombatWeapon", weapon, 2025, attribute);
	return weapon;
}

Killstreak_EquipSheen(int weapon, float attribute, int numAttributes)
{
	TF2Items_SetAttributeNew("CBaseCombatWeapon", weapon, 2014, attribute);
	return weapon;
}
