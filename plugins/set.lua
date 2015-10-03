local function save_value(msg, name, value)
  if (not name or not value) then
    return "Usage: !set var_name value"
  end
  if value == '*remove*' then
      local hash = nil
    if msg.to.type == 'chat' then
      hash = 'chat:'..msg.to.id..':variables'
    end
    if msg.to.type == 'user' then
      hash = 'user:'..msg.from.id..':variables'
    end
    if hash then
      redis:hdel(hash, name)
      return "Removed "..name
    end
  end
  local hash = nil
  if msg.to.type == 'chat' then
    hash = 'chat:'..msg.to.id..':variables'
  end
  if msg.to.type == 'user' then
    hash = 'user:'..msg.from.id..':variables'
  end
  if hash then
    redis:hset(hash, name, value)
    return "Saved "..name
  end
end

local function run(msg, matches)
  if matches[1] == 'set' then
    local name = string.sub(matches[2], 1, 50)
    local value = string.sub(matches[3], 1, 1000)

    local text = save_value(msg, name, value)
    return text
  elseif matches[1] == 'setto' then
    local msgb = msg
    if matches[2] == 'user' then
      msgb.to.type == 'user'
      msgb.from.id == matches[3]
    else if matches[2] == 'chat' then
      msgb.to.type == 'chat'
      msg.to.id == matches[3]
    else
      return nil
    end
    local name = string.sub(matches[4], 1, 50)
    local value = string.sub(matches[5], 1, 1000)

    local text = save_value(msgb, name, value)
    return text
  end
end

return {
  description = "Plugin for saving values. get.lua plugin is necessary to retrieve them.", 
  usage = "!set [value_name] [data]: Saves the data with the value_name name.",
  patterns = {
   "!(set) ([^%s]+) (.+)$",
   "!(setto) ([^%s]+) ([^%s]+) ([^%s]+) (.+)$"
  }, 
  run = run 
}

