local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")
local naughty = require("naughty")
local user_var = require("Sources.Main.user_var")

local left = wibox.widget.textbox()
left.text = "TodoArrow"
local mid = wibox.widget.textbox()
mid.text = "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?".."But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?".."But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?".."But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?"
local right = wibox.widget.textbox()
right.text = "ListArrow"
local Type = wibox.widget.textbox()
Type.text = "TODO"
Type.font = "sans 15"
local minus = wibox.widget({
    image = user_var.minus,
    resize = false,
    clip_shape = gears.shape.circle,
    widget = wibox.widget.imagebox
})
local plus_right = wibox.widget({
    {
        image = user_var.plus,
        resize = false,
        widget = wibox.widget.imagebox,
    },
    forced_width = 120,
    shape_clip = true,
    bg = '#000000',
    shape = gears.shape.transform(function (cr,width,height)
        gears.shape.parallelogram(cr,width,height,width/1.15)
    end) : translate(-120,0),
    widget = wibox.container.background
})
local plus_left = wibox.widget({
    {
        {
            image = user_var.plus,
            resize = false,
            widget = wibox.widget.imagebox,
        },
        halign = "right",
        widget = wibox.container.place
    },
    forced_width = 120,
    shape_clip = true,
    bg = '#000000',
    shape = gears.shape.transform(function (cr,width,height)
        gears.shape.parallelogram(cr,width,height,width*1.12)
    end) : translate(130,0),
    widget = wibox.container.background
})
local todo = wibox.widget({
    {
        left,
        halign = "right",
        widget = wibox.container.place
    },
    bg = "#53076f",
    forced_width = 150,
    shape_clip = true,
    shape = gears.shape.transform(function (cr,width,height)
        gears.shape.parallelogram(cr,width,height,width*1.2)
    end) : translate(50,0),
    widget = wibox.container.background
})
local note = wibox.widget({
    {
        {
            right,
            halign = "left",
            widget = wibox.container.place
        },
        bg = "#87076f",
        forced_width = 150,
        shape_clip = true,
        shape = gears.shape.transform(function (cr,width,height)
            gears.shape.parallelogram(cr,width,height,width/1.2)
        end) : translate(-50,0),
        point = {x=600, y= 100},
        widget = wibox.container.background
    },
    {
        {
            image = user_var.plus,
            resize = false,
            widget = wibox.widget.imagebox,
        },
        bg = '#000000',
        shape = gears.shape.transform(function (cr,width,height)
            gears.shape.parallelogram(cr,width,height,width/1.15)
        end) : translate(-220,0),
        widget = wibox.container.background
    },
    widget = wibox.layout.manual
})



awful.screen.connect_for_each_screen(function (s)
    s.mytasker = wibox.widget({
        {
            -- Type of displaing content
            {
                Type,
                left = 25,
                right = 25,
                top   = 50,
                bottom = 50,
                layout = wibox.container.margin
            },
            halign = 'left',
            valign = 'center',
            layout = wibox.container.place
        },
        {
            -- Actual content of chosen bookmarks
            {
                mid,
                left = 25,
                right = 25,
                top   = 50,
                bottom = 50,
                id = "text_content",
                layout = wibox.container.margin
            },
            valign = 'center',
            layout = wibox.container.place
        },
        id = 'ratio_content',
        layout = wibox.layout.fixed.vertical -- make grid
    })
    --s.mytasker:get_children_by_id('ratio_content')[1]:ajust_ratio(2,0.14,0.87,0)
    s.mybookmarks = wibox.widget({
        -- Lists of bookmarks
        -- The left side of tasker.
        {
            {
                {
                    todo,
                    plus_left,
                    id = "todo_bookmarks",
                    layout = wibox.layout.fixed.vertical
                },
                valign = "top",
                layout = wibox.container.place
            },
            layout = wibox.layout.flex.vertical
        },
        -- The middle of tasker.
        {
            layout = wibox.container.place
        },
        -- The right side of tasker. 
        {
            {
                {
                    note,
                    plus_right,
                    id = "notes_bookmarks",
                    layout = wibox.layout.fixed.vertical
                },
                valign = "top",
                layout = wibox.container.place
            },
            layout = wibox.layout.flex.vertical
        },
        layout = wibox.layout.align.horizontal,
    })
end)

