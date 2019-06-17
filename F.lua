local composer = require( "composer" )
 
local F = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- scene event functions
-- -----------------------------------------------------------------------------------
 

-- create()
function F:create( event )
 
    local scene2Group = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 
 
-- show()
function F:show( event )
 
    local scene2Group = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
        --hides the status bar
        display.setStatusBar(display.HiddenStatusBar)

             background = display.newRect(0, 0, 1080, 1080)
        background:setFillColor( 40/255, 0/255, 0/255)
         scene2Group:insert(background)

        local text = display.newText( "INSTRUCTIONS \r FOR THE RANDOM CATEGORY" , 158, 70, "Impact", 26 )
        text:setFillColor(  100/255, 250/255, 0/255 )
        scene2Group:insert(text)

         local rule1 = display.newText( "----------------This Category Will Have 5 Questions----------------" , 160, 160, "Impact", 17 )
        rule1:setFillColor(  100/255, 250/255, 0/255 )
        scene2Group:insert(rule1)


         local rule1 = display.newText( "----------------There will be word answers and number answers----------------" , 160, 200, "Impact", 14 )
        rule1:setFillColor(  100/255, 250/255, 0/255 )
        scene2Group:insert(rule1)


        local okButton = display.newImageRect( "ok.png", 40, 40 )
        okButton.x = 300
        okButton.y = 480
        scene2Group:insert(okButton)

          function GoToGame1 (event)
            composer.gotoScene( "test2" )
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
F:addEventListener( "create", mainmenu )
F:addEventListener( "show", mainmenu )
-- -----------------------------------------------------------------------------------
 
return F