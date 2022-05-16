local awful = require("awful")
local naughty = require("naughty")
local wibox = require("wibox")
local io    = require("io")
local gears = require("gears")


-- For filling up list by all programm and sripts in system using $PATH env var
local function getAvailProg() 
  local list = {}
  local res = ""
  local str = os.getenv("PATH")
  local s = 1
  local e = 1
  while true do
    e = str:find(':',s)
    if e == nil then
      break
    end
    table.insert(list,string.sub(str,s,e-1))
    s = e + 1
  end

  for i,l in ipairs(list) do 
    local buf = io.popen("ls "..l)
    res = res..buf:read("*a")
  end
  return res 
end
-- Finding similar prog/scrips
local function getSimilarProg(pattern)
  local list = {}
  local res  = {}
  local src = getAvailProg()
  local first, last = 0
  while true do
    first, last = src:find("\n"..pattern, first+1)
    last  = src:find("\n",last)
    if not first then break end
    list[src:sub(first, last)] = true
  end

  for l in pairs(list) do 
    table.insert(res,l:sub(2,l:len()-1))       
  end
  return res
end

awful.screen.connect_for_each_screen(function (s)
    local min_width = 200
    local shift = 1
    -- Table with wiboxes(for available command)
    local prompt_wibox_table = {}
    for i=0,5,1 do
      table.insert(prompt_wibox_table,wibox({
        x = 0,
        y = 0,
        visible = false,
        width = min_width,
        height = 25,
        border_width = 0,
        border_color = "#8070d9",
        bg = "#8060FF90",
        fg = "#000000",
        ontop = true,
        shape = function (cr,width,height)
          gears.shape.powerline(cr,width,height)
        end,
        screen = s,
        widget = wibox.widget.textbox()
      }))
    end
    -- Counter for matches
    local w_counter = wibox({
      x = 0,
      y = 0,
      visible = false,
      width = 60,
      height = 25,
      border_width = 0,
      border_color = "#8070d9",
      bg = "#ef3c7b90",
      fg = "#000000",
      ontop = true,
      shape = function (cr,width,height)
        gears.shape.powerline(cr,width,height)
      end,
      screen = s,
      widget = wibox.widget.textbox()
    })
    s.mypromptbox = awful.widget.prompt({ -- Move to Widgets
        prompt = '<b>>>||</b>',
        bg_cursor = "#fff",
        fg = "#000000",
        autoexec = true,
        -- Calls when hit esc
        done_callback = function ()
            for _,wib in ipairs(prompt_wibox_table) do
              wib.visible = false
            end
            w_counter.visible = false
            s.prompt_wibox.visible = false
        end,
        keypressed_callback = function (mod,key,command)
         
        end,
        keyreleased_callback = function ()
        end,
        changed_callback = function ()
        end,
        completion_callback = function (command_bCur, cur_pos, counter)
          local list = getSimilarProg(command_bCur) -- List of all match commands
          local pos_for_w_counter -- Position for counter
          local size = 0  -- Length of result command 
          local res = ""  -- Result command
          if (#list > 0) then
            counter = counter % #list + 1
            size = #list[counter]
            res = list[counter]
            for i,wib in ipairs(prompt_wibox_table) do
              -- Set Position
              wib.x = s.prompt_wibox.width * i - 10*i - 25
              wib.y = s.prompt_wibox.y
              -- Set Text, Visibility, and Highliting
              if (i <= #list) then        
                  wib.visible = true
                  wib.widget.markup = "\t<b>"..list[i].."</b>"
                  if (i == counter) then
                    wib.bg = "#7BC9E5"
                  else
                    wib.bg = "#8060FF90"
                  end
              -- If we have some unneeded wiboxes we will not display them
              else
                wib.visible = false
              end
              -- If our counter more than size of our wibox's table
              if (counter > #prompt_wibox_table ) then
                -- Make a shift
                wib.widget.markup = "\t<b>"..list[i+shift].."</b>"
                -- Just mark a last one for sure.
                prompt_wibox_table[#prompt_wibox_table].bg = "#7BC9E5"
              end
              -- Set position for counter
              if i <= #list then
                pos_for_w_counter = s.prompt_wibox.width * i - 10*i - 25
              end
              
            end
            -- Shift control flow
            if (counter > #prompt_wibox_table and shift < #list - #prompt_wibox_table) then
              shift = shift + 1
            elseif (shift == #list - #prompt_wibox_table) then
              shift = 1
            end
            -- Set counter
            w_counter.visible = true
            w_counter.x = pos_for_w_counter + min_width - 10
            w_counter.y = s.prompt_wibox.y
            w_counter.widget.markup = "   <b>"..counter.."/"..#list.."</b>"
          end
          return res, cur_pos+size, res
        end,
    })
end)

-- NOTES
-- In start cant choose first one +
