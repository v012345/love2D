-- main.lua - LÖVE 游戏入口文件

function love.load()
    -- 游戏初始化（只运行一次）
    x = 400
    y = 300
    speed = 200
end

function love.update(dt)
    -- 每帧更新逻辑
    if love.keyboard.isDown("right") then
        x = x + speed * dt
    elseif love.keyboard.isDown("left") then
        x = x - speed * dt
    end
    if love.keyboard.isDown("down") then
        y = y + speed * dt
    elseif love.keyboard.isDown("up") then
        y = y - speed * dt
    end
end

function love.draw()
    -- 每帧绘制
    love.graphics.print("Hello LÖVE! 用方向键移动圆形", 10, 10)
    love.graphics.circle("fill", x, y, 20)
end
