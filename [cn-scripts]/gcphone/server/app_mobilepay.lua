local Proxy = module("vrp", "lib/Proxy")
vRP = Proxy.getInterface("vRP")

RegisterServerEvent('gcPhone:mobilepay_sendpayment')
AddEventHandler('gcPhone:mobilepay_sendpayment', function(data)
  local source = source
  local user_id = vRP.getUserId({source})
  local display = data.display ~= '' and data.display or data.number


  -- RMySQL.query("vRP/gcphone_getUserIdByPhone", {phone = data.number}, function(result, affected)

  MySQL.Async.fetchAll("SELECT user_id FROM vrp_user_identities WHERE phone = @phone", {phone = data.number}, function (result, affected)
    if #result > 0 then
      if result[1].user_id == user_id then
        TriggerClientEvent("pNotify:SendNotification", source,{text = "📱 Du kan ikke sende til dit eget nummer!", type = "error", queue = "global", timeout = 4000, layout = "bottomright",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
        return
      end
      -- if tonumber(data.money) >= 10001 then
      --   TriggerClientEvent("pNotify:SendNotification", source,{text = "📱 Du kan ikke sende så mange penge!", type = "error", queue = "global", timeout = 4000, layout = "bottomright",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
      --   return
      -- end
      local touserid = result[1].user_id
      local tosource = vRP.getUserSource({touserid})
      if tosource ~= nil then
        if vRP.tryBankPayment({user_id,tonumber(data.money)}) then
          moneyToUser = tonumber(data.money * 0.98)
          vRP.giveBankMoney({touserid,tonumber(moneyToUser)})
          PerformHttpRequest('https://autisthook.com/api/webhooks/597825761478443017/P37vgxGGHZyRz1zTHKvvH1cTME_dO_xbVH7u57v9kM_EcV0gmK0wcVQN3UcRWwTTLu0S', function(err, text, headers) end, 'POST', json.encode({username = "Server "..GetConvar("servernumber", "0").." - Mobilepay", content = "**"..user_id.."** har lige sendt **"..format_thousand(tonumber(data.money)).."** kr. (Med gebyr: "..format_thousand(tonumber(moneyToUser))..") til **"..touserid.."** (**"..os.date("%H:%M:%S %d/%m/%Y").."**)"}), { ['Content-Type'] = 'application/json' })
          TriggerClientEvent("pNotify:SendNotification", source,{
            text = "<h3>📱 Mobilepay</h3> <br> <p>Du har sendt <b style='color:#64A664'>"..format_thousand(tonumber(data.money)).." DKK</b> til <b style='color:#64A664'>"..display.."</b></p>",
            type = "twitter",
            timeout = (4000),
            layout = "bottomright",
            queue = "global",
            animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},
            killer = true,
            sounds = {
              sources = {"mobilepay.ogg"}, -- For sounds to work, you place your sound in the html folder and then add it to the files array in the __resource.lua file.
              volume = 0.5,
              conditions = {"docVisible"}
            }
          })
          vRP.getUserIdentity({user_id, function(identity)
            local fromname = identity.firstname.." "..identity.name
            TriggerClientEvent("pNotify:SendNotification", tosource,{
              text = "<h3>📱 Mobilepay</h3> <br> <p>Du har modtaget <b style='color:#64A664'>"..format_thousand(tonumber(moneyToUser)).." DKK</b> fra <b style='color:#64A664'>"..fromname.."</b></p>",
              type = "twitter",
              timeout = (4000),
              layout = "bottomright",
              queue = "global",
              animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"},
              killer = true,
              sounds = {
                sources = {"sms.ogg"}, -- For sounds to work, you place your sound in the html folder and then add it to the files array in the __resource.lua file.
                volume = 0.5,
                conditions = {"docVisible"}
              }
            })
          end})
        else
          TriggerClientEvent("pNotify:SendNotification", source,{text = "<h3>📱 Mobilepay</h3> <br> <p>Dit kort er afvist</P>", type = "fejl", queue = "global", timeout = 4000, layout = "bottomright",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
        end
      else
        TriggerClientEvent("pNotify:SendNotification", source,{text = "<h3>📱 Mobilepay</h3> <br><p>"..display.." er utilgængelig", type = "fejl", queue = "global", timeout = 4000, layout = "bottomright",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
      end
    else
      TriggerClientEvent("pNotify:SendNotification", source,{text = "<h3>📱 Mobilepay</h3> <br><p>"..display.." er utilgængelig", type = "fejl", queue = "global", timeout = 4000, layout = "bottomright",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
    end
  end)
end)

function format_thousand(v)
  local s = string.format("%d", math.floor(v))
  local pos = string.len(s) % 3
  if pos == 0 then pos = 3 end
  return string.sub(s, 1, pos)
          .. string.gsub(string.sub(s, pos+1), "(...)", ".%1")
end
