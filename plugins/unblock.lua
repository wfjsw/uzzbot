
local function run(msg, matches)
  if msg.to.type ~= 'chat' then
    return "You are unblocked :)"
  end
end

return {
  description = "Unblock me from the limitation of SPAM REPORT!",
  usage = "!unblock: test whether works",
  patterns = {
    "^!unblock$",
    "^!$",
    "^。$",
    "^.$"
  }, 
  run = run 
}
