foundName = "";
nameFound = false;
guildPos = 0;
officerLine = false;
officerLine1 = "";
officerLine2 = "";
tempChar = "";
searchedNames = 0;
lineBreak = "\n";

function DPAttunement_Zero()
	DPA_Name1 = "Boss";
	DPA_Name2 = "Vice";
	DPA_Name3 = "Off";
	DPA_Name4 = "CO";
	DPA_Name5 = "OA";
	DPA_Name6 = "Mem";
	DPA_Name7 = "Cas";
	DPA_Name8 = "Alt";
	DPA_Name9 = "Asp";

	DPA_MC0 = "M C";
	DPA_MC1 = 0;
	DPA_MC2 = 0;
	DPA_MC3 = 0;
	DPA_MC4 = 0;
	DPA_MC5 = 0;
	DPA_MC6 = 0;
	DPA_MC7 = 0;
	DPA_MC8 = 0;
	DPA_MC9 = 0;

	DPA_ONY0 = "Ony";
	DPA_ONY1 = 0;
	DPA_ONY2 = 0;
	DPA_ONY3 = 0;
	DPA_ONY4 = 0;
	DPA_ONY5 = 0;
	DPA_ONY6 = 0;
	DPA_ONY7 = 0;
	DPA_ONY8 = 0;
	DPA_ONY9 = 0;

	DPA_NAX0 = "Naxx";
	DPA_NAX1 = 0;
	DPA_NAX2 = 0;
	DPA_NAX3 = 0;
	DPA_NAX4 = 0;
	DPA_NAX5 = 0;
	DPA_NAX6 = 0;
	DPA_NAX7 = 0;
	DPA_NAX8 = 0;
	DPA_NAX9 = 0;
	
	DPA_BWL0 = "BWL";
	DPA_BWL1 = 0;
	DPA_BWL2 = 0;
	DPA_BWL3 = 0;
	DPA_BWL4 = 0;
	DPA_BWL5 = 0;
	DPA_BWL6 = 0;
	DPA_BWL7 = 0;
	DPA_BWL8 = 0;
	DPA_BWL9 = 0;

	DPA_TOT0 = "Tot";
	DPA_TOT1 = 0;
	DPA_TOT2 = 0;
	DPA_TOT3 = 0;
	DPA_TOT4 = 0;
	DPA_TOT5 = 0;
	DPA_TOT6 = 0;
	DPA_TOT7 = 0;
	DPA_TOT8 = 0;
	DPA_TOT9 = 0;
end

function DPAttunement_OnLoad()
    DEFAULT_CHAT_FRAME:AddMessage("DPAttunement Loaded")
	this:RegisterForDrag("LeftButton");
	this:RegisterEvent("VARIABLES_LOADED");
	SlashCmdList["DPATTUNEMENT"] = DPAttunement_Slash;
	SLASH_DPATTUNEMENT1 = "/dpa";
	DPAttunement_TitleText:SetText("De Profundis Attunement Stats");
	DPAttunement_Zero();
	DPAttunement_Read_Guild();
	DPAttunement_Set_Text();
   	DPAttunementFrame:Hide();
end

function DPAttunement_Slash(msg)
	DPAttunement_Zero();
	DPAttunement_Read_Guild();
	DPAttunement_Set_Text();
	foundName = "";
	nameFound = false;
	guildPos = 0;
	officerLine = false;
	officerLine1 = "";
	officerLine2 = "";
	DPAttunement_InputText:SetText(foundName);
	DPAttunement_Number:SetText(guildPos);
	DPAttunement_EPGPPts:SetText(officerLine1);
	DPAttunement_AttHave:SetText(officerLine2);
	DPAttunement_MC_Check:SetChecked(false);
	DPAttunement_ONY_Check:SetChecked(false);
	DPAttunement_NAXX_Check:SetChecked(false);
	DPAttunement_BWL_Check:SetChecked(false);
	DPAttunement_EPGP_Check:SetChecked(false);
	DPAttunement_EPGP_Check:Enable()
   	DPAttunementFrame:Show();
end

function DPAttunement_OnEvent(event)
	if event == "VARIABLES_LOADED" then

	end
end

function DPAttunement_OnDragStart()
	DPAttunementFrame:StartMoving()
end

function DPAttunement_OnDragStop()
	DPAttunementFrame:StopMovingOrSizing()
end

function DPAttunement_Set_Text()
-- Headings
	DPAttunement_Name1:SetText(DPA_Name1);
	DPAttunement_Name2:SetText(DPA_Name2);
	DPAttunement_Name3:SetText(DPA_Name3);
	DPAttunement_Name4:SetText(DPA_Name4);
	DPAttunement_Name5:SetText(DPA_Name5);
	DPAttunement_Name6:SetText(DPA_Name6);
	DPAttunement_Name7:SetText(DPA_Name7);
	DPAttunement_Name8:SetText(DPA_Name8);
	DPAttunement_Name9:SetText(DPA_Name9);
-- Molten Core
	DPAttunement_MC:SetText(DPA_MC0);
	DPAttunement_MC1:SetText(DPA_MC1);
	DPAttunement_MC2:SetText(DPA_MC2);
	DPAttunement_MC3:SetText(DPA_MC3);
	DPAttunement_MC4:SetText(DPA_MC4);
	DPAttunement_MC5:SetText(DPA_MC5);
	DPAttunement_MC6:SetText(DPA_MC6);
	DPAttunement_MC7:SetText(DPA_MC7);
	DPAttunement_MC8:SetText(DPA_MC8);
	DPAttunement_MC9:SetText(DPA_MC9);
-- Onyxia
	DPAttunement_ONY:SetText(DPA_ONY0);
	DPAttunement_ONY1:SetText(DPA_ONY1);
	DPAttunement_ONY2:SetText(DPA_ONY2);
	DPAttunement_ONY3:SetText(DPA_ONY3);
	DPAttunement_ONY4:SetText(DPA_ONY4);
	DPAttunement_ONY5:SetText(DPA_ONY5);
	DPAttunement_ONY6:SetText(DPA_ONY6);
	DPAttunement_ONY7:SetText(DPA_ONY7);
	DPAttunement_ONY8:SetText(DPA_ONY8);
	DPAttunement_ONY9:SetText(DPA_ONY9);
-- Naxx
	DPAttunement_NAX:SetText(DPA_NAX0);
	DPAttunement_NAX1:SetText(DPA_NAX1);
	DPAttunement_NAX2:SetText(DPA_NAX2);
	DPAttunement_NAX3:SetText(DPA_NAX3);
	DPAttunement_NAX4:SetText(DPA_NAX4);
	DPAttunement_NAX5:SetText(DPA_NAX5);
	DPAttunement_NAX6:SetText(DPA_NAX6);
	DPAttunement_NAX7:SetText(DPA_NAX7);
	DPAttunement_NAX8:SetText(DPA_NAX8);
	DPAttunement_NAX9:SetText(DPA_NAX9);
-- Blackwing Lair
	DPAttunement_BWL:SetText(DPA_BWL0);
	DPAttunement_BWL1:SetText(DPA_BWL1);
	DPAttunement_BWL2:SetText(DPA_BWL2);
	DPAttunement_BWL3:SetText(DPA_BWL3);
	DPAttunement_BWL4:SetText(DPA_BWL4);
	DPAttunement_BWL5:SetText(DPA_BWL5);
	DPAttunement_BWL6:SetText(DPA_BWL6);
	DPAttunement_BWL7:SetText(DPA_BWL7);
	DPAttunement_BWL8:SetText(DPA_BWL8);
	DPAttunement_BWL9:SetText(DPA_BWL9);
-- Totals
	DPAttunement_TOT:SetText(DPA_TOT0);
	DPAttunement_TOT1:SetText(DPA_TOT1);
	DPAttunement_TOT2:SetText(DPA_TOT2);
	DPAttunement_TOT3:SetText(DPA_TOT3);
	DPAttunement_TOT4:SetText(DPA_TOT4);
	DPAttunement_TOT5:SetText(DPA_TOT5);
	DPAttunement_TOT6:SetText(DPA_TOT6);
	DPAttunement_TOT7:SetText(DPA_TOT7);
	DPAttunement_TOT8:SetText(DPA_TOT8);
	DPAttunement_TOT9:SetText(DPA_TOT9);
end

function DPAttunement_Read_Guild()
-- Read through the Guild Roster and update all values
	local numTotal, numOnline = GetNumGuildMembers();
    DEFAULT_CHAT_FRAME:AddMessage(numTotal.." Guild Members");
	for i = 1,numTotal do
		name, rank, rankIndex, level, class, zone, note, officernote = GetGuildRosterInfo(i);
		rankIndex = rankIndex + 1;
		if rankIndex == 1 then 
			DPAttunment_Rank1(officernote);
		elseif rankIndex==2 then
			DPAttunment_Rank2(officernote);
		elseif rankIndex==3 then
			DPAttunment_Rank3(officernote);
		elseif rankIndex==4 then
			DPAttunment_Rank4(officernote);
		elseif rankIndex==5 then
			DPAttunment_Rank5(officernote);
		elseif rankIndex==6 then
			DPAttunment_Rank6(officernote);
		elseif rankIndex==7 then
			DPAttunment_Rank7(officernote);
		elseif rankIndex==8 then
			DPAttunment_Rank8(officernote);
		elseif rankIndex==9 then
			DPAttunment_Rank9(officernote);
		end
	end
end

function DPAttunment_Rank1(officernote)
	DPA_TOT1 = DPA_TOT1 + 1;
	if string.find(officernote,"+MC") then
		DPA_MC1 = DPA_MC1 + 1;
	end
	if string.find(officernote,"+Ony") then
		DPA_ONY1 = DPA_ONY1 + 1;
	end
	if string.find(officernote,"+Naxx") then
		DPA_NAX1 = DPA_NAX1 + 1;
	end
	if string.find(officernote,"+BWL") then
		DPA_BWL1 = DPA_BWL1 + 1;
	end
end

function DPAttunment_Rank2(officernote)
	DPA_TOT2 = DPA_TOT2 + 1;
	if string.find(officernote, "+MC") then
		DPA_MC2 = DPA_MC2 + 1;
	end
	if string.find(officernote, "+Ony") then
		DPA_ONY2 = DPA_ONY2 + 1;
	end
	if string.find(officernote, "+Naxx") then
		DPA_NAX2 = DPA_NAX2 + 1;
	end
	if string.find(officernote,"+BWL") then
		DPA_BWL2 = DPA_BWL2 + 1;
	end
end

function DPAttunment_Rank3(officernote)
	DPA_TOT3 = DPA_TOT3 + 1;
	if string.find(officernote, "+MC") then
		DPA_MC3 = DPA_MC3 + 1;
	end
	if string.find(officernote, "+Ony") then
		DPA_ONY3 = DPA_ONY3 + 1;
	end
	if string.find(officernote, "+Naxx") then
		DPA_NAX3 = DPA_NAX3 + 1;
	end
	if string.find(officernote,"+BWL") then
		DPA_BWL3 = DPA_BWL3 + 1;
	end
end

function DPAttunment_Rank4(officernote)
	DPA_TOT4 = DPA_TOT4 + 1;
	if string.find(officernote, "+MC") then
		DPA_MC4 = DPA_MC4 + 1;
	end
	if string.find(officernote, "+Ony") then
		DPA_ONY4 = DPA_ONY4 + 1;
	end
	if string.find(officernote, "+Naxx") then
		DPA_NAX4 = DPA_NAX4 + 1;
	end
	if string.find(officernote,"+BWL") then
		DPA_BWL4 = DPA_BWL4 + 1;
	end
end

function DPAttunment_Rank5(officernote)
	DPA_TOT5 = DPA_TOT5 + 1;
	if string.find(officernote, "+MC") then
		DPA_MC5 = DPA_MC5 + 1;
	end
	if string.find(officernote, "+Ony") then
		DPA_ONY5 = DPA_ONY5 + 1;
	end
	if string.find(officernote, "+Naxx") then
		DPA_NAX5 = DPA_NAX5 + 1;
	end
	if string.find(officernote,"+BWL") then
		DPA_BWL5 = DPA_BWL5 + 1;
	end
end

function DPAttunment_Rank6(officernote)
	DPA_TOT6 = DPA_TOT6 + 1;
	if string.find(officernote, "+MC") then
		DPA_MC6 = DPA_MC6 + 1;
	end
	if string.find(officernote, "+Ony") then
		DPA_ONY6 = DPA_ONY6 + 1;
	end
	if string.find(officernote, "+Naxx") then
		DPA_NAX6 = DPA_NAX6 + 1;
	end
	if string.find(officernote,"+BWL") then
		DPA_BWL6 = DPA_BWL6 + 1;
	end
end

function DPAttunment_Rank7(officernote)
	DPA_TOT7 = DPA_TOT7 + 1;
	if string.find(officernote, "+MC") then
		DPA_MC7 = DPA_MC7 + 1;
	end
	if string.find(officernote, "+Ony") then
		DPA_ONY7 = DPA_ONY7 + 1;
	end
	if string.find(officernote, "+Naxx") then
		DPA_NAX7 = DPA_NAX7 + 1;
	end
	if string.find(officernote,"+BWL") then
		DPA_BWL7 = DPA_BWL7 + 1;
	end
end

function DPAttunment_Rank8(officernote)
	DPA_TOT8 = DPA_TOT8 + 1;
	if string.find(officernote, "+MC") then
		DPA_MC8 = DPA_MC8 + 1;
	end
	if string.find(officernote, "+Ony") then
		DPA_ONY8 = DPA_ONY8 + 1;
	end
	if string.find(officernote, "+Naxx") then
		DPA_NAX8 = DPA_NAX8 + 1;
	end
	if string.find(officernote,"+BWL") then
		DPA_BWL8 = DPA_BWL8 + 1;
	end
end

function DPAttunment_Rank9(officernote)
	DPA_TOT9 = DPA_TOT9 + 1;
	if string.find(officernote, "+MC") then
		DPA_MC9 = DPA_MC9 + 1;
	end
	if string.find(officernote, "+Ony") then
		DPA_ONY9 = DPA_ONY9 + 1;
	end
	if string.find(officernote, "+Naxx") then
		DPA_NAX9 = DPA_NAX9 + 1;
	end
	if string.find(officernote,"+BWL") then
		DPA_BWL9 = DPA_BWL9 + 1;
	end
end

function DPAttunement_Load_OnClick()
-- Load Player Data from Guild Roster Officer Note
	local numTotal, numOnline = GetNumGuildMembers();
	foundName = "";
	nameFound = false;
	guildPos = 0;
	officerLine = false;
	officerLine1 = "";
	officerLine2 = "";
	tempChar = "";
	searchedNames = 0;
	for i = 1,numTotal do
		name, rank, rankIndex, level, class, zone, note, officernote = GetGuildRosterInfo(i);
		searchedNames = searchedNames +1;
		if string.lower(name) == string.lower(DPAttunement_InputText:GetText()) then -- Name Match
			nameFound = true;
			foundName = name;
			guildPos = i;
			for j = 1, string.len(officernote) do
				tempChar = string.sub(officernote,j,j);
				if tempChar == "\n" then -- Found a line break
					officerLine = true;
					tempChar = "";
				end
				if officerLine then
					officerLine2 = officerLine2..tempChar;
				else
					officerLine1 = officerLine1..tempChar;
				end
			end
			break
		end
	end
	DEFAULT_CHAT_FRAME:AddMessage("Searched "..searchedNames.." names");
	if nameFound then
		DPAttunement_InputText:SetText(foundName);
		DPAttunement_Number:SetText(guildPos);
		DPAttunement_EPGPPts:SetText(officerLine1);
		DPAttunement_AttHave:SetText(officerLine2);
		if string.find(officerLine2, "+MC") then
			DPAttunement_MC_Check:SetChecked(true);
		else
			DPAttunement_MC_Check:SetChecked(false);
		end
		if string.find(officerLine2, "+Ony") then
			DPAttunement_ONY_Check:SetChecked(true);
		else
			DPAttunement_ONY_Check:SetChecked(false);
		end
		if string.find(officerLine2, "+Naxx") then
			DPAttunement_NAXX_Check:SetChecked(true);
		else
			DPAttunement_NAXX_Check:SetChecked(false);
		end
		if string.find(officerLine2, "+BWL") then
			DPAttunement_BWL_Check:SetChecked(true);
		else
			DPAttunement_BWL_Check:SetChecked(false);
		end
		DEFAULT_CHAT_FRAME:AddMessage(officerLine1);
		if string.find(officerLine1, "/") then
			DPAttunement_EPGP_Check:SetChecked(true);
			DPAttunement_EPGP_Check:Disable()
		else
			officerLine1 = "0/100";
			officerLine2 = "-MC"
			DPAttunement_EPGPPts:SetText(officerLine1);
			DPAttunement_AttHave:SetText(officerLine2);
			DPAttunement_EPGP_Check:SetChecked(true);
			DPAttunement_EPGP_Check:Disable()
		end
	else
		UIErrorsFrame:AddMessage("** DPA "..DPAttunement_InputText:GetText().." not found in Guild Roster **", 0.1, 1.0, 0.1, 1.0, 10)
		DPAttunement_InputText:SetText("");
		DPAttunement_Number:SetText(guildPos);
		DPAttunement_EPGPPts:SetText("name not found");
		DPAttunement_AttHave:SetText("Show offline members");
		DPAttunement_MC_Check:SetChecked(false);
		DPAttunement_ONY_Check:SetChecked(false);
		DPAttunement_NAXX_Check:SetChecked(false);
		DPAttunement_BWL_Check:SetChecked(false);
		DPAttunement_EPGP_Check:SetChecked(false);
		DPAttunement_EPGP_Check:Enable()
	end	
end


function DPAttunement_Set_OnClick()
	if guildPos == 0 then -- Trying to set when we dont have a Guildie
		UIErrorsFrame:AddMessage("** DPA  you have not loaded a valid Guild Member to Set **", 0.1, 1.0, 0.1, 1.0, 10)
	else
-- Get guildPos again in case the Guild Roster has changed
		local numTotal, numOnline = GetNumGuildMembers();
		nameFound = false;
		guildPos = 0;
		for i = 1,numTotal do
			name, rank, rankIndex, level, class, zone, note, officernote = GetGuildRosterInfo(i);
			if string.lower(name) == string.lower(foundName) then -- Name Match to name used on Load
				nameFound = true;
				guildPos = i;
				break
			end
		end
		if nameFound then
-- Write back the new Officers Note
			GuildRosterSetOfficerNote(guildPos, officerLine1..lineBreak..officerLine2)
-- Reset everything
			UIErrorsFrame:AddMessage("** DPA "..foundName.." has been updated **", 0.1, 1.0, 0.1, 1.0, 10)
			DPAttunement_EPGPPts:SetText("0/0");
			DPAttunement_AttHave:SetText("-");
-- Recount
			DPAttunement_Zero();
			DPAttunement_Read_Guild();
			DPAttunement_Set_Text();
		else
			UIErrorsFrame:AddMessage("** DPA "..foundName.." not found - Guild Roster may have changed **", 0.1, 1.0, 0.1, 1.0, 10)
			DPAttunement_EPGPPts:SetText("name not found");
			DPAttunement_AttHave:SetText("Show offline members");
		end
		DPAttunement_InputText:SetText("");
		DPAttunement_Number:SetText(guildPos);
		DPAttunement_MC_Check:SetChecked(false);
		DPAttunement_ONY_Check:SetChecked(false);
		DPAttunement_NAXX_Check:SetChecked(false);
		DPAttunement_BWL_Check:SetChecked(false);
		DPAttunement_EPGP_Check:SetChecked(false);
		DPAttunement_EPGP_Check:Enable()
	end	
end

function DPAttunement_CheckButton_OnClick()
-- Change officerNote2 depending on Check Boxes
	local attuneMC = DPAttunement_MC_Check:GetChecked();
	local attuneONY = DPAttunement_ONY_Check:GetChecked();
	local attuneNAXX = DPAttunement_NAXX_Check:GetChecked();
	local attuneEPGP = DPAttunement_EPGP_Check:GetChecked();
	local attuneBWL = DPAttunement_BWL_Check:GetChecked();
	if attuneMC then
		officerLine2 = "+MC";
	else
		officerLine2 = "-MC";
	end
	if attuneONY then
		officerLine2 = officerLine2.." +Ony"
	end
	if attuneBWL then
		officerLine2 = officerLine2.." +BWL"
	end
	
	if attuneNAXX then
		officerLine2 = officerLine2.." +Naxx"
	end

	DPAttunement_AttHave:SetText(officerLine2);
end