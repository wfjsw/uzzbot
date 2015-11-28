do

function run(msg, matches)
  local target = tostring(tonumber(matches[1], 16))
  join = chat_add_user(msg.from.id,target,ok_cb,false)
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
