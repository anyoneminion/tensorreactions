-- ********************************** Functions around toggle actions  **************************************
-- *                                                                                                        *
-- *                        This section is only for samurai base actions and toggles                       *
-- *                                                                                                        *
-- **********************************************************************************************************

-- *************************************** Functions around actions  ****************************************
-- *                                                                                                        *
-- *                                              Actions                                                   *
-- *                                                                                                        *
-- **********************************************************************************************************

-- entityID can be passed in, so that the cast time can be checked.
function NilsReactionLibrary.Combat.Actions.ThirdEye(entityID)
  -- return if in opener
  if NilsReactionLibrary.Combat.inOpener() then return false, nil, nil, false, false end

  local target = Player:GetTarget()
  if entityID ~= nil then target = EntityList:Get(entityID) end
  if target == nil or not table.valid(target) or not target.attackable then return false, nil, nil, false, false end

  -- protection incase the timeline is to early. 
  if target.castinginfo == nil or target.castinginfo.casttime - target.castinginfo.channeltime > 2.5 then return false, nil, nil, false, false end

  -- check cooldown
  local actionskill = ActionList:Get(1, 7498)
  if actionskill:IsReady(Player.id) == false then return false, nil, nil, false, false end

  if not Player.job == NilsReactionLibrary.jobs.Samurai.id then return false, nil, nil, false, false end
  if NilsReactionLibrary.WhichArc() == NilsReactionLibrary.arcs.SallySAM then
    if SallySAM.HotBarConfig.ThirdEye ~= nil then
      SallySAM.HotBarConfig.ThirdEye.enabled = false
      return true, nil, nil, false, false
    else
      return true, actionskill, Player.id, true, false
    end
    return true, nil, nil, false, false
  else
    return true, actionskill, Player.id, true, true
  end
end

function NilsReactionLibrary.Combat.Actions.Gyoten()
  if not Player.job == NilsReactionLibrary.jobs.Samurai.id then return false, nil, nil, false, false end

  -- return if in opener or outside ogcd
  if NilsReactionLibrary.Combat.inOpener()  then return false, nil, nil, false, false end

  local target = Player:GetTarget()
  if target == nil or not table.valid(target) or not target.attackable then return false, nil, nil, false, false end

  -- check cooldown
  local actionskill = ActionList:Get(1, 7492)
  if actionskill:IsReady(target.id) == false then return false, nil, nil, false, false end

  if NilsReactionLibrary.WhichArc() == NilsReactionLibrary.arcs.SallySAM then
    -- use hotbar only if bot is running, otherwise use actionskill
    if SallySAM.HotBarConfig.Gyoten ~= nil and FFXIV_Common_BotRunning then
      SallySAM.HotBarConfig.Gyoten.enabled = false
      return true, nil, nil, false, false
    else
      return true, actionskill, target.id, true, false
    end
  else
    return true, actionskill, target.id, true, false
  end
  return false, nil, nil, false, false
end

function NilsReactionLibrary.Combat.Actions.Yaten()
  if not Player.job == NilsReactionLibrary.jobs.Samurai.id then return false, nil, nil, false, false end

  -- return if in opener or outside ogcd
  if NilsReactionLibrary.Combat.inOpener()  then return false, nil, nil, false, false end

  local target = Player:GetTarget()
  if target == nil or not table.valid(target) or not target.attackable then return false, nil, nil, false, false end

  -- check cooldown
  local actionskill = ActionList:Get(1, 7493)
  if actionskill:IsReady(target.id) == false then return false, nil, nil, false, false end

  if NilsReactionLibrary.WhichArc() == NilsReactionLibrary.arcs.SallySAM then
    -- use hotbar only if bot is running, otherwise use actionskill
    if SallySAM.HotBarConfig.Yaten ~= nil and FFXIV_Common_BotRunning then
      SallySAM.HotBarConfig.Yaten.enabled = false
      return true, nil, nil, false, false
    else
      return true, actionskill, target.id, true, false
    end
  else
    return true, actionskill, target.id, true, false
  end
  return false, nil, nil, false, false
end

-- ********************************** Functions around toggle actions  **************************************
-- *                                                                                                        *
-- *                                              Toggles                                                   *
-- *                                                                                                        *
-- **********************************************************************************************************

if NilsReactionLibrary.Combat.Toggles.Samurai == nil then NilsReactionLibrary.Combat.Toggles.Samurai = {} end

function NilsReactionLibrary.Combat.Toggles.Samurai.Reset()
  if NilsReactionLibrary.WhichArc() ~= NilsReactionLibrary.arcs.SallySAM then return false end

  -- reset hotbar
  SallySAM.HotBarConfig.Armslength.enabled = true
  SallySAM.HotBarConfig.Bloodbath.enabled = true
  SallySAM.HotBarConfig.Feint.enabled = true
  SallySAM.HotBarConfig.Gyoten.enabled = true
  SallySAM.HotBarConfig.Hagakure.enabled = true
  SallySAM.HotBarConfig.Kaiten.enabled = true
  SallySAM.HotBarConfig.LB.enabled = true
  SallySAM.HotBarConfig.LegSweep.enabled = true
  SallySAM.HotBarConfig.Meditate.enabled = true
  SallySAM.HotBarConfig.Meikyo.enabled = true
  SallySAM.HotBarConfig.Potion.enabled = true
  SallySAM.HotBarConfig.SecondWind.enabled = true
  SallySAM.HotBarConfig.Sprint.enabled = true
  SallySAM.HotBarConfig.ThirdEye.enabled = true
  SallySAM.HotBarConfig.TrueNorth.enabled = true
  SallySAM.HotBarConfig.Yaten.enabled = true

  -- reset quick toggles
  SallySAM.SkillSettings.Guren.enabled = true
  SallySAM.SkillSettings.Hagakure.enabled = true
  SallySAM.SkillSettings.Higanbana.enabled = true
  SallySAM.SkillSettings.Ikishoten.enabled = true
  SallySAM.SkillSettings.Kaiten.enabled = true
  SallySAM.SkillSettings.Kyuten.enabled = true
  SallySAM.SkillSettings.Meikyo.enabled = true
  SallySAM.SkillSettings.Opener.enabled = true 
  -- SallySAM.SkillSettings.Potion.enabled = true
  SallySAM.SkillSettings.SaveCD.enabled = false
  SallySAM.SkillSettings.Senei.enabled = true
  SallySAM.SkillSettings.Shinten.enabled = true
  SallySAM.SkillSettings.Shoha.enabled = true
  SallySAM.SkillSettings.SmartTrueNorth.enabled = true
  SallySAM.SkillSettings.Tsubame.enabled = true
  SallySAM.SkillSettings.UseAOE.enabled = true

  NilsReactionLibrary.Combat.Toggles.Handler.Reset()
  return true
end

function NilsReactionLibrary.Combat.Toggles.Samurai.Opener(toggleOn)
  if NilsReactionLibrary.isempty(toggleOn) then toggleOn = true end

  if Player.job == NilsReactionLibrary.jobs.Samurai.id then
    -- if tensor installed
    if NilsReactionLibrary.WhichArc() == NilsReactionLibrary.arcs.SallySAM then SallySAM.SkillSettings.Opener.enabled = toggleOn return true end
  end
  return false
end

function NilsReactionLibrary.Combat.Toggles.Samurai.Omni(toggleOn, byTimeline)
  if Player.job ~= NilsReactionLibrary.jobs.Samurai.id then return false end

  if NilsReactionLibrary.isempty(toggleOn) then toggleOn = true end
  if NilsReactionLibrary.isempty(byTimeline) then byTimeline = false end

  -- timeline overrides everything else.
  if byTimeline then
    NilsReactionLibrary.Combat.Toggles.Control.OmniWhiteList.IsActive = toggleOn == false -- set active if it is suppose to be off
    NilsReactionLibrary.Combat.Toggles.Control.OmniWhiteList.TimelineActive = byTimeline and toggleOn == false
    NilsReactionLibrary.Combat.Toggles.Control.OmniWhiteList.LastMoved = Now()
  end

  if NilsReactionLibrary.WhichArc() == NilsReactionLibrary.arcs.SallySAM then
    SallySAM.SkillSettings.PositionalWindow.enabled = toggleOn
    SallySAM.SkillSettings.SmartTrueNorth.enabled = toggleOn
    return true end
  return false
end

function NilsReactionLibrary.Combat.Toggles.Samurai.CD(toggleOn, byTimeline)
  if Player.job ~= NilsReactionLibrary.jobs.Samurai.id then return false end

  if NilsReactionLibrary.isempty(toggleOn) then toggleOn = true end
  if NilsReactionLibrary.isempty(byTimeline) then byTimeline = false end

  -- timeline overrides everything else.
  if byTimeline then
    NilsReactionLibrary.Combat.Toggles.Control.CDBlackList.IsActive = toggleOn == false -- set active if TCJ is suppose to be off
    NilsReactionLibrary.Combat.Toggles.Control.CDBlackList.TimelineActive = byTimeline and toggleOn == false
  end

    if NilsReactionLibrary.WhichArc() == NilsReactionLibrary.arcs.SallySAM then SallySAM.SkillSettings.SaveCD.enabled = toggleOn return true end

  return false
end

function NilsReactionLibrary.Combat.Toggles.Samurai.Guren(toggleOn)
  if NilsReactionLibrary.isempty(toggleOn) then toggleOn = true end

  if Player.job == NilsReactionLibrary.jobs.Samurai.id then
    -- if tensor installed
    if NilsReactionLibrary.WhichArc() == NilsReactionLibrary.arcs.SallySAM then SallySAM.SkillSettings.Guren.enabled = toggleOn return true end
  end
  return false
end

function NilsReactionLibrary.Combat.Toggles.Samurai.Hagakure(toggleOn)
  if NilsReactionLibrary.isempty(toggleOn) then toggleOn = true end

  if Player.job == NilsReactionLibrary.jobs.Samurai.id then
    -- if tensor installed
    if NilsReactionLibrary.WhichArc() == NilsReactionLibrary.arcs.SallySAM then SallySAM.SkillSettings.Hagakure.enabled = toggleOn return true end
  end
  return false
end

function NilsReactionLibrary.Combat.Toggles.Samurai.Higanbana(toggleOn)
  if NilsReactionLibrary.isempty(toggleOn) then toggleOn = true end

  if Player.job == NilsReactionLibrary.jobs.Samurai.id then
    -- if tensor installed
    if NilsReactionLibrary.WhichArc() == NilsReactionLibrary.arcs.SallySAM then SallySAM.SkillSettings.Higanbana.enabled = toggleOn return true end
  end
  return false
end

function NilsReactionLibrary.Combat.Toggles.Samurai.Ikishoten(toggleOn)
  if NilsReactionLibrary.isempty(toggleOn) then toggleOn = true end

  if Player.job == NilsReactionLibrary.jobs.Samurai.id then
    -- if tensor installed
    if NilsReactionLibrary.WhichArc() == NilsReactionLibrary.arcs.SallySAM then SallySAM.SkillSettings.Ikishoten.enabled = toggleOn return true end
  end
  return false
end

function NilsReactionLibrary.Combat.Toggles.Samurai.Kaiten(toggleOn)
  if NilsReactionLibrary.isempty(toggleOn) then toggleOn = true end

  if Player.job == NilsReactionLibrary.jobs.Samurai.id then
    -- if tensor installed
    if NilsReactionLibrary.WhichArc() == NilsReactionLibrary.arcs.SallySAM then SallySAM.SkillSettings.Kaiten.enabled = toggleOn return true end
  end
  return false
end

function NilsReactionLibrary.Combat.Toggles.Samurai.Kyuten(toggleOn)
  if NilsReactionLibrary.isempty(toggleOn) then toggleOn = true end

  if Player.job == NilsReactionLibrary.jobs.Samurai.id then
    -- if tensor installed
    if NilsReactionLibrary.WhichArc() == NilsReactionLibrary.arcs.SallySAM then SallySAM.SkillSettings.Kyuten.enabled = toggleOn return true end
  end
  return false
end

function NilsReactionLibrary.Combat.Toggles.Samurai.Meikyo(toggleOn)
  if NilsReactionLibrary.isempty(toggleOn) then toggleOn = true end

  if Player.job == NilsReactionLibrary.jobs.Samurai.id then
    -- if tensor installed
    if NilsReactionLibrary.WhichArc() == NilsReactionLibrary.arcs.SallySAM then SallySAM.SkillSettings.Meikyo.enabled = toggleOn return true end
  end
  return false
end

function NilsReactionLibrary.Combat.Toggles.Samurai.Potion(toggleOn)
  if NilsReactionLibrary.isempty(toggleOn) then toggleOn = true end

  if Player.job == NilsReactionLibrary.jobs.Samurai.id then
    -- if tensor installed
    if NilsReactionLibrary.WhichArc() == NilsReactionLibrary.arcs.SallySAM then SallySAM.SkillSettings.Potion.enabled = toggleOn return true end
  end
  return false
end

function NilsReactionLibrary.Combat.Toggles.Samurai.Senei(toggleOn)
  if NilsReactionLibrary.isempty(toggleOn) then toggleOn = true end

  if Player.job == NilsReactionLibrary.jobs.Samurai.id then
    -- if tensor installed
    if NilsReactionLibrary.WhichArc() == NilsReactionLibrary.arcs.SallySAM then SallySAM.SkillSettings.Senei.enabled = toggleOn return true end
  end
  return false
end

function NilsReactionLibrary.Combat.Toggles.Samurai.Shinten(toggleOn)
  if NilsReactionLibrary.isempty(toggleOn) then toggleOn = true end

  if Player.job == NilsReactionLibrary.jobs.Samurai.id then
    -- if tensor installed
    if NilsReactionLibrary.WhichArc() == NilsReactionLibrary.arcs.SallySAM then SallySAM.SkillSettings.Shinten.enabled = toggleOn return true end
  end
  return false
end

function NilsReactionLibrary.Combat.Toggles.Samurai.Shoha(toggleOn)
  if NilsReactionLibrary.isempty(toggleOn) then toggleOn = true end

  if Player.job == NilsReactionLibrary.jobs.Samurai.id then
    -- if tensor installed
    if NilsReactionLibrary.WhichArc() == NilsReactionLibrary.arcs.SallySAM then SallySAM.SkillSettings.Shoha.enabled = toggleOn return true end
  end
  return false
end

function NilsReactionLibrary.Combat.Toggles.Samurai.SmartTrueNorth(toggleOn)
  if NilsReactionLibrary.isempty(toggleOn) then toggleOn = true end

  if Player.job == NilsReactionLibrary.jobs.Samurai.id then
    -- if tensor installed
    if NilsReactionLibrary.WhichArc() == NilsReactionLibrary.arcs.SallySAM then SallySAM.SkillSettings.SmartTrueNorth.enabled = toggleOn return true end
  end
  return false
end

function NilsReactionLibrary.Combat.Toggles.Samurai.Tsubame(toggleOn)
  if NilsReactionLibrary.isempty(toggleOn) then toggleOn = true end

  if Player.job == NilsReactionLibrary.jobs.Samurai.id then
    -- if tensor installed
    if NilsReactionLibrary.WhichArc() == NilsReactionLibrary.arcs.SallySAM then SallySAM.SkillSettings.Tsubame.enabled = toggleOn return true end
  end
  return false
end

function NilsReactionLibrary.Combat.Toggles.Samurai.AOE(toggleOn, byTimeline)
  if Player.job ~= NilsReactionLibrary.jobs.Samurai.id then return false end

  if NilsReactionLibrary.isempty(toggleOn) then toggleOn = true end
  if NilsReactionLibrary.isempty(byTimeline) then byTimeline = false end

  -- timeline overrides everything else.
  if byTimeline then
    NilsReactionLibrary.Combat.Toggles.Control.AOEBlackList.IsActive = toggleOn == false -- set active if TCJ is suppose to be off
    NilsReactionLibrary.Combat.Toggles.Control.AOEBlackList.TimelineActive = byTimeline and toggleOn == false
  end

  if NilsReactionLibrary.WhichArc() == NilsReactionLibrary.arcs.SallySAM then SallySAM.SkillSettings.UseAOE.enabled = toggleOn return true end
  return false
end