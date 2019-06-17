local composer = require( "composer" )
 
local gamescene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
 
 
 
-- -----------------------------------------------------------------------------------
-- scene event functions
-- -----------------------------------------------------------------------------------
 

-- create()
function gamescene:create( event )
 
    local scene3Group = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 
-- show()
function gamescene:show( event )
 
    local scene3Group = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

        --hides the status bar
        display.setStatusBar(display.HiddenStatusBar)

        background = display.newRect(0, 0, 1080, 1080)
        background:setFillColor( 0/255, 100/255, 255/255)
         scene3Group:insert(background)

     AskTextField = display.newText( "Type The Answer In The Text Box Below.", display.contentCenterX + 1 , display.contentCenterY - 200, "Impact", 15)
        AskTextField.id = "AskTextField"
        AskTextField:setFillColor( 255, 255, 255 )
         scene3Group:insert(AskTextField)


       local EntryTextField = native.newTextField( display.contentCenterX + 1, display.contentCenterY - 150, 300, 75 )
        EntryTextField.id = "EntryTextField"
         scene3Group:insert(EntryTextField)

        GenerateButton = display.newImageRect( "e1.png", 200, 100 )
            GenerateButton.x = 160
            GenerateButton.y = 200
            scene3Group:insert(GenerateButton)


        SubmitButton = display.newImageRect( "e3.png", 200, 100 )
        SubmitButton.x = 160
        SubmitButton.y = 350
        scene3Group:insert(SubmitButton)


        letterText = display.newText( "Tap Generate", display.contentCenterX + 1 , display.contentCenterY +200, "Impact", 17 )
        letterText.id = "letterText"
         scene3Group:insert(letterText)


        AnswerText = display.newText( "", display.contentCenterX + 1 , display.contentCenterY +100, native.systemFont, 12 )
        AnswerText.id = "AnswerText"
         scene3Group:insert(AnswerText)

        Score = 0
        q1 = false
        q2 = false
        q3 = false
        q4 = false
        q5 = false
        q6 = false
        q7 = false 
        q8 = false
        q9 = false 
        q10 = false

         local ScoreText = display.newText( "Your Score Is 0", display.contentCenterX + 1 , display.contentCenterY + 40, "Impact", 35 )
        ScoreText.id = "ScoreText"

        local function GenerateButtonTouch( event )

            if event.phase == "began" then

                x = true

                while x==true do

                    letter = math.random(1,10)
              

                    if letter == 1 and q1 == true then
                        x = true

                    elseif letter == 1 and q1 == false then
                        letterText.text = "How Many Planets Are There \r In Our Solar System?"
                        x = false

                    elseif letter == 2 and q2 == true then
                        x = true

                    elseif letter == 2  and q2 == false then
                        letterText.text = "What is Ontairo's sales tax? \r (type the number only)"
                        x = false
                    
                    elseif letter == 3 and q3 == true then
                        x = true
                        
                    elseif letter == 3  and q3 == false then
                        letterText.text = "What year does the U.S election take place?"
                        x = false
                    
                    elseif letter == 4 and q4 == true then
                        x = true
                     
                    elseif letter == 4  and q4 == false then
                        letterText.text = "What was the best selling video game of all time"
                        x = false
                    
                    elseif letter == 5 and q5 == true then
                        x = true
                        
                    elseif letter == 5  and q5 == false then
                        letterText.text = "Which one of these countries are land-locked: \r France? \r Luxembourg? \r Nigeria? \r Vietnam?"
                        x = false

                    else x = false
                        
                    end  -- for the if statements

                end  ----- for the while statement
             
            end  -- for the if statement (began)
            
           --end  -- for the function
        end  -- for the generate button function

        GenerateButton:addEventListener( "touch", GenerateButtonTouch )






local function updateScoreText( )

    if Test == 1 or Test == 2 or Test == 3 or Test == 4 or Test == 5 or Test == 6 or Test == 7 or Test == 8 or Test == 9 or Test == 10 then
        Score = Score + 1
        if Score == 5 then 
            GameOver()
        end
        ScoreText.text = "Your Score Is "..Score

    end
end  -- for the function


local function SubmitButtonTouch( event )

    if event.phase == "began" then

        Entry = tonumber(EntryTextField.text)

        Test = 0
    
        if letter == 1 and Entry == 8 then
            letterText.text = "Correct"
            letter = nil
            Test = 1
            q1 = true
        updateScoreText()
        elseif letter == 2 and Entry == 13 then
            letterText.text = "Correct"
            letter = nil
            Test = 2
            q2 = true
             updateScoreText()
        

        elseif letter == 3 and Entry == 2020 then
            letterText.text = "Correct"
            letter = nil
            Test = 3
            q3 = true
              updateScoreText()   
            

        elseif letter == 4 and Entry == Minecraft then
            letterText.text = "Correct"
            letter = nil
            Test = 4
            q4 = true
              updateScoreText()       
                
        elseif letter == 5 and Entry == Luxembourg then
            letterText.text = "Correct"
            letter = nil
            Test = 5
            q5 = true
              updateScoreText()       

        elseif letter ~= Entry then
            letterText.text = "You Got The Answer Wrong, GAME OVER"
            ScoreText.text = "You Got A Score Of " .. Score
            GenerateButton:removeSelf()
            SubmitButton:removeSelf()
            if EntryTextField ~= nil then
            EntryTextField:removeSelf()
            AskTextField:removeSelf()
        end  -- for all the ifs and elseifs
        
       
    
    end  -- for the phase if

end

end  -- for the function


function GameOver()

    GenerateButton:removeSelf()
    GenerateButton = nil
    SubmitButton:removeSelf()
    SubmitButton = nil
    if EntryTextField ~= nil then
     EntryTextField:removeSelf()
     AskTextField:removeSelf()
     AskTextField = nil
    letterText.text = "You Got All The Questions Right!"

  end
end -- for the function

SubmitButton:addEventListener( "touch", SubmitButtonTouch )

--
--  function GoToGame38(event)
--            composer.gotoScene( "mainmenu" )
--            backArrow:removeSelf()
--     backArrow = nil
--     ScoreText:removeSelf()
--
--     if EntryTextField ~= nil then
--     EntryTextField:removeSelf()
--
--        end
--
--    end
--
--        backArrow:addEventListener( "touch", GoToGame38 )
--
end
--
end  -- gamescene
--
-----------------------------------------------
-- scene event function listeners
-- -----------------------------------------------------------------------------------
gamescene:addEventListener( "create", gamescene )
gamescene:addEventListener( "show", gamescene )
-- -----------------------------------------------------------------------------------
 
return gamescene