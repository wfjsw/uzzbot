do

function run(msg, matches)
  local target = "chat#id"..tostring(tonumber(matches[1], 16))
  local user = "user#id"..tostring(msg.from.id)
  join = chat_add_user(target,msg.from.id,ok_cb,false)
end


return {
  description = "Join to a group chat", 
  usage = "!join [password]",
  patterns = {
    "^!join (.*)$"
  }, 
  run = run
}

end
