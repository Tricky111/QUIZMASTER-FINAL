local composer = require( "composer" )
 
local mainmenu = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- scene event functions
-- -----------------------------------------------------------------------------------
 

-- create()
function mainmenu:create( event )
 
    local scene2Group = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 
 
-- show()
function mainmenu:show( event )
 
    local scene2Group = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
        --hides the status bar
        display.setStatusBar(display.HiddenStatusBar)
        --background
        local background = display.newRect(0, 0, 1080, 1080)
        background:setFillColor( 40/255, 0/255, 0/255)
        scene2Group:insert(background)
        --image
        --text
        local text = display.newText( "QUIZMASTER" , 160, 70, "Impact", 35 )
        text:setFillColor(  100/255, 250/255, 0/255 )
        scene2Group:insert(text)
        --enterbutton
        local enterButton = display.newImageRect( "math.png", 200, 120 )
        enterButton.x = 160
        enterButton.y = 420
        scene2Group:insert(enterButton)

                local enterButton2 = display.newImageRect( "history.png", 200, 120 )
        enterButton2.x = 160
        enterButton2.y = 300
        scene2Group:insert(enterButton2)

           local enterButton3 = display.newImageRect( "random.png", 200, 120 )
        enterButton3.x = 160
        enterButton3.y = 180
        scene2Group:insert(enterButton3)

        --go to scene function
        function GoToGame1 (event)
            composer.gotoScene( "gamescene" )
            enterButton:removeSelf()
     enterButton = nil
        end

        enterButton:addEventListener( "touch", GoToGame1 )


           function GoToGame2 (event)
            composer.gotoScene( "test" )
            enterButton2:removeSelf()
     enterButton2 = nil
        end

        enterButton2:addEventListener( "touch", GoToGame2 )


         function GoToGame3 (event)
            composer.gotoScene( "F" )
            enterButton3:removeSelf()
     enterButton3 = nil
        end

        enterButton3:addEventListener( "touch", GoToGame3 )

    elseif ( phase == "did" ) then


    end
end

 
 
-- -----------------------------------------------------------------------------------
-- scene event function listeners
-- -----------------------------------------------------------------------------------
mainmenu:addEventListener( "create", mainmenu )
mainmenu:addEventListener( "show", mainmenu )
-- -----------------------------------------------------------------------------------
 
return mainmenu