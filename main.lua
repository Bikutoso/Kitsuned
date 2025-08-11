local function load_dir(mod_dir, directory)
  local items = NFS.getDirectoryItems(mod_dir.."/"..directory)
  for _, item in ipairs(items) do
    local working_item = directory.."/"..item
    if NFS.getInfo(mod_dir.."/"..working_item).type == "directory" then
      load_dir(mod_dir, working_item)
    else
      if item:match(".lua$") then
        --sendDebugMessage("Loading: "..working_item, "ktsu")
        assert(SMODS.load_file(working_item))()
      end
    end
  end
end

load_dir(SMODS.current_mod.path,"items")
