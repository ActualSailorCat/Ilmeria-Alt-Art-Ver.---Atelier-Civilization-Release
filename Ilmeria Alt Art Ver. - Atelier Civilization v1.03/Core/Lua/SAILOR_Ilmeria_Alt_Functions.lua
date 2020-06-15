--=============================================
-- Ilmeria Lessons by SailorCat
--=============================================
--------------------
-- Table Setup
--------------------
-- All Applicable Buildings
local ilmeriaAltBuildings = {}
local ilmeriaAltBuildingQuery = DB.Query("SELECT BuildingType FROM Buildings WHERE PrereqDistrict IN ('DISTRICT_CAMPUS', 'DISTRICT_COMMERCIAL_HUB', 'DISTRICT_INDUSTRIAL_ZONE')")
for i, ilAltBuild in ipairs(ilmeriaAltBuildingQuery) do
	local ilAltBuildIndex = GameInfo.Buildings[ilAltBuild.BuildingType].Index
	ilmeriaAltBuildings[i] = ilAltBuildIndex
end

-- Campus Buildings
local ilmeriaAltCampus = {}
local ilmeriaAltCampusQuery = DB.Query("SELECT BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_CAMPUS'")
for i, ilAltCamp in ipairs(ilmeriaAltCampusQuery) do
	local ilAltCampIndex = GameInfo.Buildings[ilAltCamp.BuildingType].Index
	ilmeriaAltCampus[i] = ilAltCampIndex
end

-- Commercial Hub Buildings
local ilmeriaAltCommHub = {}
local ilmeriaAltCommQuery = DB.Query("SELECT BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB'")
for i, ilAltComm in ipairs(ilmeriaAltCommQuery) do
	local ilAltCommIndex = GameInfo.Buildings[ilAltComm.BuildingType].Index
	ilmeriaAltCommHub[i] = ilAltCommIndex
end

-- Industrial Zone Buildings
local ilmeriaAltIndustrial = {}
local ilmeriaAltIndustQuery = DB.Query("SELECT BuildingType FROM Buildings WHERE PrereqDistrict = 'DISTRICT_INDUSTRIAL_ZONE'")
for i, ilAltIndu in ipairs(ilmeriaAltIndustQuery) do
	local ilAltInduIndex = GameInfo.Buildings[ilAltIndu.BuildingType].Index
	ilmeriaAltIndustrial[i] = ilAltInduIndex
end

--------------------
-- Function
--------------------
local ilmeriaAltMod = (GameInfo.GameSpeeds[GameConfiguration.GetGameSpeedType()].CostMultiplier)/100
function Sailor_Ilmeria_Alt_Lessons (playerID, cityID, buildingID, ImprovementID, plotID, bCancelled, bOriginalConstruction, iBuildType, iX, iY)
	local bILMERIAALTLeader = false
	local pPlayer = Players[playerID]
	local pPlayerCities = pPlayer:GetCities()
	local pCity = pPlayerCities:FindID(cityID)
	local pOwner = pCity:GetOwner()
	if pOwner ~= -1 then
		local pPlayerConfig = PlayerConfigurations[pOwner]
		local sLeader = pPlayerConfig:GetLeaderTypeName()
		if sLeader == 'LEADER_SAILOR_ILMERIA_ALT' then
			bILMERIAALTLeader = true
		end
	end

	if bILMERIAALTLeader == true then
		--//// Gathering buildings...
		local iBuilt = GameInfo.Buildings[buildingID].Index
		for i, iBuild in ipairs(ilmeriaAltBuildings) do
			if iBuild == GameInfo.Buildings[buildingID].Index then

			--//// Checking for adjacent Atelier...
				local pPlayerCities = pPlayer:GetCities()
				local pCity = pPlayerCities:FindID(cityID)
				local pCityBuildings = pCity:GetBuildings()
				local pPlot = Map.GetPlotByIndex(pCityBuildings:GetBuildingLocation(buildingID))
				local iX, iY = pPlot:GetX(), pPlot:GetY()
				local iNumberofAtelier = 0
				for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
					local pAdjacentPlot = Map.GetAdjacentPlot(iX, iY, direction)
					if pAdjacentPlot then
						local pAdjImprovement = pAdjacentPlot:GetImprovementType()
						if pAdjImprovement > -1 then
							local pAdjImprovementIndex = GameInfo.Buildings[pAdjImprovement].Index
							local pAdjImprovementType = GameInfo.Improvements[pAdjImprovementIndex].ImprovementType
							if pAdjImprovementType == 'IMPROVEMENT_SAILOR_ATLEER_UI' then
								iNumberofAtelier = iNumberofAtelier + 1
							end
						end
					end
				end
				--//// Time for treats...
				if iNumberofAtelier > 0 then
					local pPoints = pPlayer:GetEra() + 10
					local pGPP = ((pPoints * iNumberofAtelier) * ilmeriaAltMod)
					local pPlayerGP = pPlayer:GetGreatPeoplePoints()
					-- Campus
					for k, iAlch in ipairs(ilmeriaAltCampus) do
						if iAlch == GameInfo.Buildings[buildingID].Index then
							local iGPerson = GameInfo.GreatPersonClasses["GREAT_PERSON_CLASS_SCIENTIST"].Index
							pPlayerGP:ChangePointsTotal(iGPerson, pGPP)
							if pPlayer:IsHuman() then
								Game.AddWorldViewText(playerID, Locale.Lookup("+{1_Num} [ICON_GreatScientist]", pGPP), pPlot:GetX(), pPlot:GetY(), 0)
							end
						end
					end
					-- Commercial Hub
					for k, iCoin in ipairs(ilmeriaAltCommHub) do
						if iCoin == GameInfo.Buildings[buildingID].Index then
							local iGPerson = GameInfo.GreatPersonClasses["GREAT_PERSON_CLASS_MERCHANT"].Index
							pPlayerGP:ChangePointsTotal(iGPerson, pGPP)
							if pPlayer:IsHuman() then
								Game.AddWorldViewText(playerID, Locale.Lookup("+{1_Num} [ICON_GreatMerchant]", pGPP), pPlot:GetX(), pPlot:GetY(), 0)
							end
						end
					end
					-- Industrial Zone
					for k, iSteam in ipairs(ilmeriaAltIndustrial) do
						if iSteam == GameInfo.Buildings[buildingID].Index then
							local iGPerson = GameInfo.GreatPersonClasses["GREAT_PERSON_CLASS_ENGINEER"].Index
							pPlayerGP:ChangePointsTotal(iGPerson, pGPP)
							if pPlayer:IsHuman() then
								Game.AddWorldViewText(playerID, Locale.Lookup("+{1_Num} [ICON_GreatEngineer]", pGPP), pPlot:GetX(), pPlot:GetY(), 0)
							end
						end
					end
					break
				end
			end
		end
	end
end
--=============================================
-- Leader Present Detection by SeelingCat
--=============================================
local bILMERIAALTPresent = false

for k, v in ipairs(PlayerManager.GetWasEverAliveIDs()) do
    if bILMERIAALTPresent == false then
        local sLeaderType = PlayerConfigurations[v]:GetLeaderTypeName()
        if sLeaderType == 'LEADER_SAILOR_ILMERIA_ALT' then
			bILMERIAALTPresent = true
        end
    end
end
if bILMERIAALTPresent == true then
    print ("///// Ilmeria Alt detected. Loading lua functions...")
	GameEvents.BuildingConstructed.Add(Sailor_Ilmeria_Alt_Lessons)
else
    print ("///// Ilmeria Alt not detected.")
end