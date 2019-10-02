local L = LibStub("AceLocale-3.0"):GetLocale("PallyPower");

PallyPower.commPrefix = "PLPWR";
C_ChatInfo.RegisterAddonMessagePrefix(PallyPower.commPrefix)

PALLYPOWER_MAXCLASSES = 9;
PALLYPOWER_MAXPERCLASS = 10;
PALLYPOWER_NORMALBLESSINGDURATION = 10*60;
PALLYPOWER_GREATERBLESSINGDURATION = 30*60;
PALLYPOWER_MAXAURAS = 7;

PallyPower.CONFIG_DRAGHANDLE = L["DRAGHANDLE"];
PallyPower.CONFIG_RESIZEGRIP = L["RESIZEGRIP"];
PALLYPOWER_NAME = L["PP_NAME"];
BINDING_NAME_AUTOKEY1	= L["AUTOKEY1"];
BINDING_NAME_AUTOKEY2	= L["AUTOKEY2"];

PALLYPOWER_DEFAULT_VALUES = {
	profile = {
		buffscale = 0.90,
		configscale = 0.90,
		smartbuffs = true,
		smartpets = true,
		greaterbuffs = true,
		rfbuff = true,
		auras = true,
		extras = false,
		autobuff = {
			autokey1 = ",",
			autokey2 = "CTRL-,",
			autobutton = true,
			waitforpeople = true,
		},
		display = {
			-- buttons
			rows = 9,
			columns = 1,
			gapping = 2,
			buttonWidth = 100,
			buttonHeight = 34,
			alignClassButtons = "9",
			alignPlayerButtons = "compact-left",
			edges = true,
			frameLocked = false,
			hideDragHandle = false,
			hidePlayerButtons = false,
			hideClassButtons = false,
			PlainButtons = false,
			HideKeyText = false,
			HideCount = false,
			LockBuffBars = false,
			HideCountText = false,
			HideTimerText = false,
		},
		ShowInParty = true,
		ShowWhenSingle = true,
		skin = "Smooth",
		cBuffNeedAll     = {r = 1.0, g = 0.0, b = 0.0, t = 0.5},
		cBuffNeedSome    = {r = 1.0, g = 1.0, b = 0.5, t = 0.5},
		cBuffNeedSpecial = {r = 0.0, g = 0.0, b = 1.0, t = 0.5},
		cBuffGood        = {r = 0.0, g = 0.7, b = 0.0, t = 0.5},
		sets = {
			["primary"] = {
							seal = 0, 	-- wisdom
							aura = 1, 	-- devotion
							rf = false, -- RF off
							buffs = { 0, 0, 0, 0, 0, 0, 0, 0, 0,}
						},
			["secondary"] = {
							seal = 0, 	-- wisdom
							aura = 1, 	-- devotion
							rf = false, -- RF off
							buffs = { 0, 0, 0, 0, 0, 0, 0, 0, 0,}
						},
		},
		-- default assignments
		seal = 0,
		aura = 1,
		disabled = false,
		layout = "Standard",
		}
	}

PallyPower_Credits1 = "Pally Power Classic (v1.0k)";
PallyPower_Credits2 = "Originally written by Aznamir";
PallyPower_Credits3 = "Updated for Classic by Dyaxler";

PallyPower.BuffBarTitle = "Pally Buffs (%d)";

PallyPower.ClassID = {
	[1] = "WARRIOR",
	[2] = "ROGUE",
	[3] = "PRIEST",
	[4] = "DRUID",
	[5] = "PALADIN",
	[6] = "HUNTER",
	[7] = "MAGE",
	[8] = "WARLOCK",
	[9] = "PET",
};

PallyPower.ClassToID = {
	["WARRIOR"] 	= 1,
	["ROGUE"] 		= 2,
	["PRIEST"] 		= 3,
	["DRUID"] 		= 4,
	["PALADIN"] 	= 5,
	["HUNTER"] 		= 6,
	["MAGE"] 		  = 7,
	["WARLOCK"]		= 8,
	["PET"]			  = 9,
};

PallyPower.ClassIcons = {
	[1] = "Interface\\AddOns\\PallyPower\\Icons\\Warrior",
	[2] = "Interface\\AddOns\\PallyPower\\Icons\\Rogue",
	[3] = "Interface\\AddOns\\PallyPower\\Icons\\Priest",
	[4] = "Interface\\AddOns\\PallyPower\\Icons\\Druid",
	[5] = "Interface\\AddOns\\PallyPower\\Icons\\Paladin",
	[6] = "Interface\\AddOns\\PallyPower\\Icons\\Hunter",
	[7] = "Interface\\AddOns\\PallyPower\\Icons\\Mage",
	[8] = "Interface\\AddOns\\PallyPower\\Icons\\Warlock",
	[9] = "Interface\\AddOns\\PallyPower\\Icons\\Pet",
};

PallyPower.BlessingIcons = {
  [-1] = "",
	[1] = "Interface\\Icons\\Spell_Holy_GreaterBlessingofWisdom",
	[2] = "Interface\\Icons\\Spell_Holy_GreaterBlessingofKings",
	[3] = "Interface\\Icons\\Spell_Magic_GreaterBlessingofKings",
	[4] = "Interface\\Icons\\Spell_Holy_GreaterBlessingofSalvation",
	[5] = "Interface\\Icons\\Spell_Holy_GreaterBlessingofLight",
	[6] = "Interface\\Icons\\Spell_Holy_GreaterBlessingofSanctuary",

};

PallyPower.NormalBlessingIcons = {
  [-1] = "",
	[1] = "Interface\\Icons\\Spell_Holy_SealOfWisdom",
	[2] = "Interface\\Icons\\Spell_Holy_FistOfJustice",
	[3] = "Interface\\Icons\\Spell_Magic_MageArmor",
	[4] = "Interface\\Icons\\Spell_Holy_SealOfSalvation",
	[5] = "Interface\\Icons\\Spell_Holy_PrayerOfHealing02",
	[6] = "Interface\\Icons\\Spell_Nature_LightningShield",
};

PallyPower.AuraIcons = {
  [-1] = "",
	[1] = "Interface\\Icons\\Spell_Holy_DevotionAura",
	[2] = "Interface\\Icons\\Spell_Holy_AuraOfLight",
	[3] = "Interface\\Icons\\Spell_Holy_MindSooth",
	[4] = "Interface\\Icons\\Spell_Shadow_SealOfKings",
	[5] = "Interface\\Icons\\Spell_Frost_WizardMark",
	[6] = "Interface\\Icons\\Spell_Fire_SealOfFire",
	[7] = "Interface\\Icons\\Spell_Holy_MindVision",
};

--
-- Need to add localizations
--
PALLYPOWER_CLEAR = L["PP_CLEAR"];
PALLYPOWER_REFRESH = L["PP_REFRESH"];
PALLYPOWER_OPTIONS = L["PP_OPTIONS"];
PALLYPOWER_AUTOASSIGN = L["AUTOASSIGN"];
PALLYPOWER_REPORT	= L["BRPT"];
PALLYPOWER_FREEASSIGN = L["FREEASSIGN"];
PALLYPOWER_ASSIGNMENTS1 = L["PP_RAS1"];
PALLYPOWER_ASSIGNMENTS2 = L["PP_RAS2"];

-- get translations directly
PallyPower.Spells = {
	[0] = "",
	[1] = GetSpellInfo(19742), --BS["Blessing of Wisdom"],
	[2] = GetSpellInfo(19740), --BS["Blessing of Might"],
	[3] = GetSpellInfo(20217), --BS["Blessing of Kings"],
	[4] = GetSpellInfo(1038),  --BS["Blessing of Salvation"],
	[5] = GetSpellInfo(19977), --BS["Blessing of Light"],
	[6] = GetSpellInfo(20911), --BS["Blessing of Sanctuary"],
};

PallyPower.GSpells = {
	[0] = "",
	[1] = GetSpellInfo(25894), --BS["Greater Blessing of Wisdom"],
	[2] = GetSpellInfo(25782), --BS["Greater Blessing of Might"],
	[3] = GetSpellInfo(25898), --BS["Greater Blessing of Kings"],
	[4] = GetSpellInfo(25895), --BS["Greater Blessing of Salvation"],
	[5] = GetSpellInfo(25890), --BS["Greater Blessing of Light"],
	[6] = GetSpellInfo(25899), --BS["Greater Blessing of Sanctuary"],
};

PallyPower.RFSpell = GetSpellInfo(25780) --BS["Righteous Fury"]

PallyPower.HLSpell = GetSpellInfo(635)

PallyPower.Skins = {
  ["None"] = "Interface\\Tooltips\\UI-Tooltip-Background",
	["Banto"] = "Interface\\AddOns\\PallyPower\\Skins\\Banto",
	["BantoBarReverse"] = "Interface\\AddOns\\PallyPower\\Skins\\BantoBarReverse",
	["Glaze"] = "Interface\\AddOns\\PallyPower\\Skins\\Glaze",
	["Gloss"] = "Interface\\AddOns\\PallyPower\\Skins\\Gloss",
	["Healbot"] = "Interface\\AddOns\\PallyPower\\Skins\\Healbot",
	["oCB"] = "Interface\\AddOns\\PallyPower\\Skins\\oCB",
	["Smooth"] = "Interface\\AddOns\\PallyPower\\Skins\\Smooth",
};

PallyPower.Edge = 'Interface\\Tooltips\\UI-Tooltip-Border'
--PallyPower.Edge = ''

PallyPower.Seals = {
    [0] = "",
    [1] = GetSpellInfo(20164), -- seal of justice
	[2] = GetSpellInfo(20165), -- seal of light
    [3] = GetSpellInfo(20166), -- seal of wisdom
    [4] = GetSpellInfo(21084), -- seal of righteousness
	[5] = GetSpellInfo(21082), -- seal of the crusader
    [6] = GetSpellInfo(20375), -- seal of command
};

PallyPower.Auras = {
	[0] = "",
	[1] = GetSpellInfo(465), --BS["Devotion Aura"],
	[2] = GetSpellInfo(7294), --BS["Retribution Aura"],
	[3] = GetSpellInfo(19746), --BS["Concentration Aura"],
	[4] = GetSpellInfo(19876), --BS["Shadow Resistance Aura"],
	[5] = GetSpellInfo(19888), --BS["Frost Resistance Aura"],
	[6] = GetSpellInfo(19891), --BS["Fire Resistance Aura"],
	[7] = GetSpellInfo(20218), --BS["Sanctity Aura"],
};
-- Buff templates
PallyPower.Templates={
	[1] = {
		[1]=  {2},
		[2]=  {2},
		[3]=  {1},
		[4]=  {2},
		[5]=  {2},
		[6]=  {2},
		[7]=  {1},
		[8]=  {1},
		[9]=  {2},
	},
	[2] = {
		[1]=  {2, 5},
		[2]=  {2, 4},
		[3]=  {1, 4},
		[4]=  {2, 4},
		[5]=  {2, 4},
		[6]=  {2, 4},
		[7]=  {1, 4},
		[8]=  {1, 4},
		[9]=  {2, 4},
	},
	[3]= {
		[1]=  {2, 5, 6},
		[2]=  {2, 4, 6},
		[3]=  {1, 4, 6},
		[4]=  {2, 4, 1},
		[5]=  {2, 4, 1},
		[6]=  {2, 4, 1},
		[7]=  {1, 4, 6},
		[8]=  {1, 4, 6},
		[9]=  {2, 4, 1},
	},
	[4]= {
		[1]=  {2, 5, 6},
		[2]=  {2, 4, 5, 6},
		[3]=  {1, 4, 5, 6},
		[4]=  {2, 4, 1, 5},
		[5]=  {2, 4, 1, 5},
		[6]=  {2, 4, 1, 5},
		[7]=  {1, 4, 5, 6},
		[8]=  {1, 4, 5, 6},
		[9]=  {2, 4, 1, 5},
	},
	[5] = {
		[1]=  {3},
		[2]=  {3},
		[3]=  {3},
		[4]=  {3},
		[5]=  {3},
		[6]=  {3},
		[7]=  {3},
		[8]=  {3},
		[9]=  {3},
	},
	[6] = {
		[1]=  {3, 2},
		[2]=  {3, 2},
		[3]=  {3, 1},
		[4]=  {3, 2},
		[5]=  {3, 2},
		[6]=  {3, 2},
		[7]=  {3, 1},
		[8]=  {3, 1},
		[9]=  {3, 2},
	},
	[7] = {
		[1]=  {3, 2, 5},
		[2]=  {3, 2, 4},
		[3]=  {3, 1, 4},
		[4]=  {3, 2, 4},
		[5]=  {3, 2, 4},
		[6]=  {3, 2, 4},
		[7]=  {3, 1, 4},
		[8]=  {3, 1, 4},
		[9]=  {3, 2, 4},
	},
	[8]= {
		[1]=  {3, 2, 5, 6},
		[2]=  {3, 2, 4, 6},
		[3]=  {3, 1, 4, 6},
		[4]=  {3, 2, 4, 1},
		[5]=  {3, 2, 4, 1},
		[6]=  {3, 2, 4, 1},
		[7]=  {3, 1, 4, 6},
		[8]=  {3, 1, 4, 6},
		[9]=  {3, 2, 4, 1},
	},
}
-- Layouts
PallyPower.Layouts = {
	["Layout 1"] = {
					c = {
							[1] = {
									x = 0, y = 0,
									p = {
											[1] = {x = 1, y = 0},
											[2] = {x = 1, y = -1},
											[3] = {x = 1, y = -2},
											[4] = {x = 1, y = -3},
											[5] = {x = 1, y = -4},
											[6] = {x = 1, y = -5},
											[7] = {x = 1, y = -6},
											[8] = {x = 1, y = -7},
											[9] = {x = 1, y = -8},
											[10] = {x = 1, y = -9},
										},
								},
							[2] = {
									x = 0, y = -1,
									p = {
											[1] = {x = 1, y = 0},
											[2] = {x = 1, y = -1},
											[3] = {x = 1, y = -2},
											[4] = {x = 1, y = -3},
											[5] = {x = 1, y = -4},
											[6] = {x = 1, y = -5},
											[7] = {x = 1, y = -6},
											[8] = {x = 1, y = -7},
											[9] = {x = 1, y = -8},
											[10] = {x = 1, y = -9},
										},
								},
							[3] = {
									x = 0, y = -2,
									p = {
											[1] = {x = 1, y = 0},
											[2] = {x = 1, y = -1},
											[3] = {x = 1, y = -2},
											[4] = {x = 1, y = -3},
											[5] = {x = 1, y = -4},
											[6] = {x = 1, y = -5},
											[7] = {x = 1, y = -6},
											[8] = {x = 1, y = -7},
											[9] = {x = 1, y = -8},
											[10] = {x = 1, y = -9},
										},
								},
							[4] = {
									x = 0, y = -3,
									p = {
											[1] = {x = 1, y = 0},
											[2] = {x = 1, y = -1},
											[3] = {x = 1, y = -2},
											[4] = {x = 1, y = -3},
											[5] = {x = 1, y = -4},
											[6] = {x = 1, y = -5},
											[7] = {x = 1, y = -6},
											[8] = {x = 1, y = -7},
											[9] = {x = 1, y = -8},
											[10] = {x = 1, y = -9},
										},
								},
							[5] = {
									x = 0, y = -4,
									p = {
											[1] = {x = 1, y = 0},
											[2] = {x = 1, y = -1},
											[3] = {x = 1, y = -2},
											[4] = {x = 1, y = -3},
											[5] = {x = 1, y = -4},
											[6] = {x = 1, y = -5},
											[7] = {x = 1, y = -6},
											[8] = {x = 1, y = -7},
											[9] = {x = 1, y = -8},
											[10] = {x = 1, y = -9},
										},
								},
							[6] = {
									x = 0, y = -5,
									p = {
											[1] = {x = 1, y = 0},
											[2] = {x = 1, y = -1},
											[3] = {x = 1, y = -2},
											[4] = {x = 1, y = -3},
											[5] = {x = 1, y = -4},
											[6] = {x = 1, y = -5},
											[7] = {x = 1, y = -6},
											[8] = {x = 1, y = -7},
											[9] = {x = 1, y = -8},
											[10] = {x = 1, y = -9},
										},
								},
							[7] = {
									x = 0, y = -6,
									p = {
											[1] = {x = 1, y = 0},
											[2] = {x = 1, y = -1},
											[3] = {x = 1, y = -2},
											[4] = {x = 1, y = -3},
											[5] = {x = 1, y = -4},
											[6] = {x = 1, y = -5},
											[7] = {x = 1, y = -6},
											[8] = {x = 1, y = -7},
											[9] = {x = 1, y = -8},
											[10] = {x = 1, y = -9},
										},
								},
							[8] = {
									x = 0, y = -7,
									p = {
											[1] = {x = 1, y = 0},
											[2] = {x = 1, y = -1},
											[3] = {x = 1, y = -2},
											[4] = {x = 1, y = -3},
											[5] = {x = 1, y = -4},
											[6] = {x = 1, y = -5},
											[7] = {x = 1, y = -6},
											[8] = {x = 1, y = -7},
											[9] = {x = 1, y = -8},
											[10] = {x = 1, y = -9},
										},
								},
							[9] = {
									x = 0, y = -8,
									p = {
											[1] = {x = 1, y = 0},
											[2] = {x = 1, y = -1},
											[3] = {x = 1, y = -2},
											[4] = {x = 1, y = -3},
											[5] = {x = 1, y = -4},
											[6] = {x = 1, y = -5},
											[7] = {x = 1, y = -6},
											[8] = {x = 1, y = -7},
											[9] = {x = 1, y = -8},
											[10] = {x = 1, y = -9},
										},
								},
							[10] = {
									x = 0, y = -9,
									p = {
											[1] = {x = 1, y = 0},
											[2] = {x = 1, y = -1},
											[3] = {x = 1, y = -2},
											[4] = {x = 1, y = -3},
											[5] = {x = 1, y = -4},
											[6] = {x = 1, y = -5},
											[7] = {x = 1, y = -6},
											[8] = {x = 1, y = -7},
											[9] = {x = 1, y = -8},
											[10] = {x = 1, y = -9},
										},
								},
							[11] = {
									x = 0, y = -10,
									p = {
											[1] = {x = 1, y = 0},
											[2] = {x = 1, y = -1},
											[3] = {x = 1, y = -2},
											[4] = {x = 1, y = -3},
											[5] = {x = 1, y = -4},
											[6] = {x = 1, y = -5},
											[7] = {x = 1, y = -6},
											[8] = {x = 1, y = -7},
											[9] = {x = 1, y = -8},
											[10] = {x = 1, y = -9},
										},
								},
		 		},
				ab = {x = 0, y = 1},
    			rf = {x = 0, y = 2},
		 		au = {x = 0, y = 3},

	},
	["Layout 2"] = {
					c = {
							[1] = {
									x = 0, y = 0,
									p = {
											[1] = {x = -1, y = 0},
											[2] = {x = -1, y = -1},
											[3] = {x = -1, y = -2},
											[4] = {x = -1, y = -3},
											[5] = {x = -1, y = -4},
											[6] = {x = -1, y = -5},
											[7] = {x = -1, y = -6},
											[8] = {x = -1, y = -7},
											[9] = {x = -1, y = -8},
											[10] = {x = -1, y = -9},
										},
								},
							[2] = {
									x = 0, y = -1,
									p = {
											[1] = {x = -1, y = 0},
											[2] = {x = -1, y = -1},
											[3] = {x = -1, y = -2},
											[4] = {x = -1, y = -3},
											[5] = {x = -1, y = -4},
											[6] = {x = -1, y = -5},
											[7] = {x = -1, y = -6},
											[8] = {x = -1, y = -7},
											[9] = {x = -1, y = -8},
											[10] = {x = -1, y = -9},
										},
								},
							[3] = {
									x = 0, y = -2,
									p = {
											[1] = {x = -1, y = 0},
											[2] = {x = -1, y = -1},
											[3] = {x = -1, y = -2},
											[4] = {x = -1, y = -3},
											[5] = {x = -1, y = -4},
											[6] = {x = -1, y = -5},
											[7] = {x = -1, y = -6},
											[8] = {x = -1, y = -7},
											[9] = {x = -1, y = -8},
											[10] = {x = -1, y = -9},
										},
								},
							[4] = {
									x = 0, y = -3,
									p = {
											[1] = {x = -1, y = 0},
											[2] = {x = -1, y = -1},
											[3] = {x = -1, y = -2},
											[4] = {x = -1, y = -3},
											[5] = {x = -1, y = -4},
											[6] = {x = -1, y = -5},
											[7] = {x = -1, y = -6},
											[8] = {x = -1, y = -7},
											[9] = {x = -1, y = -8},
											[10] = {x = -1, y = -9},
										},
								},
							[5] = {
									x = 0, y = -4,
									p = {
											[1] = {x = -1, y = 0},
											[2] = {x = -1, y = -1},
											[3] = {x = -1, y = -2},
											[4] = {x = -1, y = -3},
											[5] = {x = -1, y = -4},
											[6] = {x = -1, y = -5},
											[7] = {x = -1, y = -6},
											[8] = {x = -1, y = -7},
											[9] = {x = -1, y = -8},
											[10] = {x = -1, y = -9},
										},
								},
							[6] = {
									x = 0, y = -5,
									p = {
											[1] = {x = -1, y = 0},
											[2] = {x = -1, y = -1},
											[3] = {x = -1, y = -2},
											[4] = {x = -1, y = -3},
											[5] = {x = -1, y = -4},
											[6] = {x = -1, y = -5},
											[7] = {x = -1, y = -6},
											[8] = {x = -1, y = -7},
											[9] = {x = -1, y = -8},
											[10] = {x = -1, y = -9},
										},
								},
							[7] = {
									x = 0, y = -6,
									p = {
											[1] = {x = -1, y = 0},
											[2] = {x = -1, y = -1},
											[3] = {x = -1, y = -2},
											[4] = {x = -1, y = -3},
											[5] = {x = -1, y = -4},
											[6] = {x = -1, y = -5},
											[7] = {x = -1, y = -6},
											[8] = {x = -1, y = -7},
											[9] = {x = -1, y = -8},
											[10] = {x = -1, y = -9},
										},
								},
							[8] = {
									x = 0, y = -7,
									p = {
											[1] = {x = -1, y = 0},
											[2] = {x = -1, y = -1},
											[3] = {x = -1, y = -2},
											[4] = {x = -1, y = -3},
											[5] = {x = -1, y = -4},
											[6] = {x = -1, y = -5},
											[7] = {x = -1, y = -6},
											[8] = {x = -1, y = -7},
											[9] = {x = -1, y = -8},
											[10] = {x = -1, y = -9},
										},
								},
							[9] = {
									x = 0, y = -8,
									p = {
											[1] = {x = -1, y = 0},
											[2] = {x = -1, y = -1},
											[3] = {x = -1, y = -2},
											[4] = {x = -1, y = -3},
											[5] = {x = -1, y = -4},
											[6] = {x = -1, y = -5},
											[7] = {x = -1, y = -6},
											[8] = {x = -1, y = -7},
											[9] = {x = -1, y = -8},
											[10] = {x = -1, y = -9},
										},
								},
							[10] = {
									x = 0, y = -9,
									p = {
											[1] = {x = -1, y = 0},
											[2] = {x = -1, y = -1},
											[3] = {x = -1, y = -2},
											[4] = {x = -1, y = -3},
											[5] = {x = -1, y = -4},
											[6] = {x = -1, y = -5},
											[7] = {x = -1, y = -6},
											[8] = {x = -1, y = -7},
											[9] = {x = -1, y = -8},
											[10] = {x = -1, y = -9},
										},
								},
							[11] = {
									x = 0, y = -10,
									p = {
											[1] = {x = -1, y = 0},
											[2] = {x = -1, y = -1},
											[3] = {x = -1, y = -2},
											[4] = {x = -1, y = -3},
											[5] = {x = -1, y = -4},
											[6] = {x = -1, y = -5},
											[7] = {x = -1, y = -6},
											[8] = {x = -1, y = -7},
											[9] = {x = -1, y = -8},
											[10] = {x = -1, y = -9},
										},
								},
		 		},
				ab = {x = 0, y = 1},
    			rf = {x = 0, y = 2},
		 		au = {x = 0, y = 3},
	},
	["Layout 3"] = {
					c = {
							[1] = {
									x = 0, y = 0,
									p = {
											[1] = {x = 0, y = -1},
											[2] = {x = 0, y = -2},
											[3] = {x = 0, y = -3},
											[4] = {x = 0, y = -4},
											[5] = {x = 0, y = -5},
											[6] = {x = 0, y = -6},
											[7] = {x = 0, y = -7},
											[8] = {x = 0, y = -8},
											[9] = {x = 0, y = -9},
											[10] = {x = 0, y = -10},
										},
								},
							[2] = {
									x = 1, y = 0,
									p = {
											[1] = {x = 0, y = -1},
											[2] = {x = 0, y = -2},
											[3] = {x = 0, y = -3},
											[4] = {x = 0, y = -4},
											[5] = {x = 0, y = -5},
											[6] = {x = 0, y = -6},
											[7] = {x = 0, y = -7},
											[8] = {x = 0, y = -8},
											[9] = {x = 0, y = -9},
											[10] = {x = 0, y = -10},
										},
								},
							[3] = {
									x = 2, y = 0,
									p = {
											[1] = {x = 0, y = -1},
											[2] = {x = 0, y = -2},
											[3] = {x = 0, y = -3},
											[4] = {x = 0, y = -4},
											[5] = {x = 0, y = -5},
											[6] = {x = 0, y = -6},
											[7] = {x = 0, y = -7},
											[8] = {x = 0, y = -8},
											[9] = {x = 0, y = -9},
											[10] = {x = 0, y = -10},
										},
								},
							[4] = {
									x = 3, y = 0,
									p = {
											[1] = {x = 0, y = -1},
											[2] = {x = 0, y = -2},
											[3] = {x = 0, y = -3},
											[4] = {x = 0, y = -4},
											[5] = {x = 0, y = -5},
											[6] = {x = 0, y = -6},
											[7] = {x = 0, y = -7},
											[8] = {x = 0, y = -8},
											[9] = {x = 0, y = -9},
											[10] = {x = 0, y = -10},
										},
								},
							[5] = {
									x = 4, y = 0,
									p = {
											[1] = {x = 0, y = -1},
											[2] = {x = 0, y = -2},
											[3] = {x = 0, y = -3},
											[4] = {x = 0, y = -4},
											[5] = {x = 0, y = -5},
											[6] = {x = 0, y = -6},
											[7] = {x = 0, y = -7},
											[8] = {x = 0, y = -8},
											[9] = {x = 0, y = -9},
											[10] = {x = 0, y = -10},
										},
								},
							[6] = {
									x = 5, y = 0,
									p = {
											[1] = {x = 0, y = -1},
											[2] = {x = 0, y = -2},
											[3] = {x = 0, y = -3},
											[4] = {x = 0, y = -4},
											[5] = {x = 0, y = -5},
											[6] = {x = 0, y = -6},
											[7] = {x = 0, y = -7},
											[8] = {x = 0, y = -8},
											[9] = {x = 0, y = -9},
											[10] = {x = 0, y = -10},
										},
								},
							[7] = {
									x = 6, y = 0,
									p = {
											[1] = {x = 0, y = -1},
											[2] = {x = 0, y = -2},
											[3] = {x = 0, y = -3},
											[4] = {x = 0, y = -4},
											[5] = {x = 0, y = -5},
											[6] = {x = 0, y = -6},
											[7] = {x = 0, y = -7},
											[8] = {x = 0, y = -8},
											[9] = {x = 0, y = -9},
											[10] = {x = 0, y = -10},
										},
								},
							[8] = {
									x = 7, y = 0,
									p = {
											[1] = {x = 0, y = -1},
											[2] = {x = 0, y = -2},
											[3] = {x = 0, y = -3},
											[4] = {x = 0, y = -4},
											[5] = {x = 0, y = -5},
											[6] = {x = 0, y = -6},
											[7] = {x = 0, y = -7},
											[8] = {x = 0, y = -8},
											[9] = {x = 0, y = -9},
											[10] = {x = 0, y = -10},
										},
								},
							[9] = {
									x = 8, y = 0,
									p = {
											[1] = {x = 0, y = -1},
											[2] = {x = 0, y = -2},
											[3] = {x = 0, y = -3},
											[4] = {x = 0, y = -4},
											[5] = {x = 0, y = -5},
											[6] = {x = 0, y = -6},
											[7] = {x = 0, y = -7},
											[8] = {x = 0, y = -8},
											[9] = {x = 0, y = -9},
											[10] = {x = 0, y = -10},
										},
								},
							[10] = {
									x = 9, y = 0,
									p = {
											[1] = {x = 0, y = -1},
											[2] = {x = 0, y = -2},
											[3] = {x = 0, y = -3},
											[4] = {x = 0, y = -4},
											[5] = {x = 0, y = -5},
											[6] = {x = 0, y = -6},
											[7] = {x = 0, y = -7},
											[8] = {x = 0, y = -8},
											[9] = {x = 0, y = -9},
											[10] = {x = 0, y = -10},
										},
								},
							[11] = {
									x = 10, y = 0,
									p = {
											[1] = {x = 0, y = -1},
											[2] = {x = 0, y = -2},
											[3] = {x = 0, y = -3},
											[4] = {x = 0, y = -4},
											[5] = {x = 0, y = -5},
											[6] = {x = 0, y = -6},
											[7] = {x = 0, y = -7},
											[8] = {x = 0, y = -8},
											[9] = {x = 0, y = -9},
											[10] = {x = 0, y = -10},
										},
								},
		 		},
				ab = {x = -1, y = 0},
    			rf = {x = -2, y = 0},
		 		au = {x = -3, y = 0},
	},
	["Layout 4"] = {
					c = {
							[1] = {
									x = 0, y = 0,
									p = {
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
											[9] = {x = 0, y = 9},
											[10] = {x = 0, y = 10},
										},
								},
							[2] = {
									x = 1, y = 0,
									p = {
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
											[9] = {x = 0, y = 9},
											[10] = {x = 0, y = 10},
										},
								},
							[3] = {
									x = 2, y = 0,
									p = {
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
											[9] = {x = 0, y = 9},
											[10] = {x = 0, y = 10},
										},
								},
							[4] = {
									x = 3, y = 0,
									p = {
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
											[9] = {x = 0, y = 9},
											[10] = {x = 0, y = 10},
										},
								},
							[5] = {
									x = 4, y = 0,
									p = {
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
											[9] = {x = 0, y = 9},
											[10] = {x = 0, y = 10},
										},
								},
							[6] = {
									x = 5, y = 0,
									p = {
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
											[9] = {x = 0, y = 9},
											[10] = {x = 0, y = 10},
										},
								},
							[7] = {
									x = 6, y = 0,
									p = {
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
											[9] = {x = 0, y = 9},
											[10] = {x = 0, y = 10},
										},
									},
							[8] = {
									x = 7, y = 0,
									p = {
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
											[9] = {x = 0, y = 9},
											[10] = {x = 0, y = 10},
										},
								},
							[9] = {
									x = 8, y = 0,
									p = {
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
											[9] = {x = 0, y = 9},
											[10] = {x = 0, y = 10},
										},
								},
							[10] = {
									x = 9, y = 0,
									p = {
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
											[9] = {x = 0, y = 9},
											[10] = {x = 0, y = 10},
										},
								},
							[11] = {
									x = 10, y = 0,
									p = {
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
											[9] = {x = 0, y = 9},
											[10] = {x = 0, y = 10},
										},
								},
		 		},
				ab = {x = -1, y = 0},
    			rf = {x = -2, y = 0},
		 		au = {x = -3, y = 0},
	},
	["Layout 5"] = {
					c = {
							[1] = {
									x = -0, y = 0,
									p = {
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
											[9] = {x = 0, y = 9},
											[10] = {x = 0, y = 10},
										},
								},
							[2] = {
									x = -1, y = 0,
									p = {
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
											[9] = {x = 0, y = 9},
											[10] = {x = 0, y = 10},
										},
								},
							[3] = {
									x = -2, y = 0,
									p = {
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
											[9] = {x = 0, y = 9},
											[10] = {x = 0, y = 10},
										},
								},
							[4] = {
									x = -3, y = 0,
									p = {
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
											[9] = {x = 0, y = 9},
											[10] = {x = 0, y = 10},
										},
								},
							[5] = {
									x = -4, y = 0,
									p = {
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
											[9] = {x = 0, y = 9},
											[10] = {x = 0, y = 10},
										},
								},
							[6] = {
									x = -5, y = 0,
									p = {
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
											[9] = {x = 0, y = 9},
											[10] = {x = 0, y = 10},
										},
								},
							[7] = {
									x = -6, y = 0,
									p = {
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
											[9] = {x = 0, y = 9},
											[10] = {x = 0, y = 10},
										},
									},
							[8] = {
									x = -7, y = 0,
									p = {
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
											[9] = {x = 0, y = 9},
											[10] = {x = 0, y = 10},
										},
								},
							[9] = {
									x = -8, y = 0,
									p = {
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
											[9] = {x = 0, y = 9},
											[10] = {x = 0, y = 10},
										},
								},
							[10] = {
									x = -9, y = 0,
									p = {
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
											[9] = {x = 0, y = 9},
											[10] = {x = 0, y = 10},
										},
								},
							[11] = {
									x = -10, y = 0,
									p = {
											[1] = {x = 0, y = 1},
											[2] = {x = 0, y = 2},
											[3] = {x = 0, y = 3},
											[4] = {x = 0, y = 4},
											[5] = {x = 0, y = 5},
											[6] = {x = 0, y = 6},
											[7] = {x = 0, y = 7},
											[8] = {x = 0, y = 8},
											[9] = {x = 0, y = 9},
											[10] = {x = 0, y = 10},
										},
								},
		 		},
				ab = {x = 3, y = 0},
    			rf = {x = 2, y = 0},
		 		au = {x = 1, y = 0},
	},
 }
