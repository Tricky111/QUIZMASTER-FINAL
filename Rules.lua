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

             background = display.newRect(0, 0, 1080, 1080)
        background:setFillColor( 40/255, 0/255, 0/255)
         scene2Group:insert(background)

        local text = display.newText( "INSTRUCTIONS" , 158, 70, "Impact", 50 )
        text:setFillColor(  100/255, 250/255, 0/255 )
        scene2Group:insert(text)

         local rule1 = display.newText( "----------------Each Category Will Have 10 Questions----------------" , 160, 160, "Impact", 17 )
        rule1:setFillColor(  100/255, 250/255, 0/255 )
        scene2Group:insert(rule1)

           local rule2 = display.newText( "----------------If You Get All 10 Questions Right You Win----------------" , 160, 200, "Impact", 17 )
        rule2:setFillColor(  100/255, 250/255, 0/255 )
        scene2Group:insert(rule2)

        local rule3 = display.newText( "----------------If You Get A Question Wrong You Will Lose----------------" , 160, 240, "Impact", 17 )
        rule3:setFillColor(  100/255, 250/255, 0/255 )
        scene2Group:insert(rule3)

         local rule4 = display.newText( "----------------All The Questions Will Have Number Answers----------------" , 160, 280, "Impact", 17 )
        rule4:setFillColor(  100/255, 250/255, 0/255 )
        scene2Group:insert(rule4)

             local rule4 = display.newText( "THERE IS A DIFFERENT SET OF \r RULES FOR THER RANDOM CATEGORY" , 160, 320, "Impact", 17 )
        rule4:setFillColor(  100/255, 250/255, 0/255 )
        scene2Group:insert(rule4)

        local okButton = display.newImageRect( "ok.png", 40, 40 )
        okButton.x = 300
        okButton.y = 480
        scene2Group:insert(okButton)

          function GoToGame1 (event)
            composer.gotoScene( "mainmenu" )
            okButton:removeSelf()
     okButton = nil
        end

        okButton:addEventListener( "touch", GoToGame1 )


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