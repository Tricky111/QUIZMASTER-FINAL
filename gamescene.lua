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

        local function GameOver()

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

        local function GenerateButtonTouch( event )

            if event.phase == "began" then

                x = true

                while x==true do

                    letter = math.random(1,10)
              

                    if letter == 1 and q1 == true then
                        x = true

                    elseif letter == 1 and q1 == false then
                        letterText.text = "9*9"
                        x = false

                    elseif letter == 2 and q2 == true then
                        x = true

                    elseif letter == 2  and q2 == false then
                        letterText.text = "(-6-(-5))*2"
                        x = false
                    
                    elseif letter == 3 and q3 == true then
                        x = true
                        
                    elseif letter == 3  and q3 == false then
                        letterText.text = "(1*2*3*4*5*6)/2"
                        x = false
                    
                    elseif letter == 4 and q4 == true then
                        x = true
                     
                    elseif letter == 4  and q4 == false then
                        letterText.text = "5x3-1"
                        x = false
                    
                    elseif letter == 5 and q5 == true then
                        x = true
                        
                    elseif letter == 5  and q5 == false then
                        letterText.text = "12x12/4"
                        x = false
                    elseif letter == 6 and q6 == true then
                        x = true
                        
                    elseif letter == 6  and q6 == false then
                        letterText.text = "(1+1-2)x5"
                        x = false
                    elseif letter == 7 and q7 == true then
                        x = true
                        
                    elseif letter == 7  and q7 == false then
                        letterText.text = "4+4x4/(8-6)"
                        x = false
                    elseif letter == 8 and q8 == true then
                        x = true
                       
                    elseif letter == 8  and q8 == false then
                        letterText.text = "Two people have a total $1.10. \r One person has $1 more than the other. \r Has much does the other person have?"
                        x = false
                    elseif letter == 9 and q9 == true then
                        x = true
                        
                    elseif letter == 9  and q9 == false then
                        letterText.text = "If you are going 40Km/h and \r you have to travel 8000km. \r How long will it take you in hours."
                        x = false
                    
                    elseif letter == 10 and q10 == true then
                        x = true
                        
                    elseif letter == 10  and q10 == false then
                        letterText.text = "(4x5x6x7x8x9/2/3/4/5/6/7)x(4/2x4-10+2)"
                        x = false

                    else x = false
                        
                    end  -- for the if statements

                end  ----- for the while statement
             
            end  -- for the if statement (began)
            
           --end  -- for the function
        end  -- for the generate button function

        GenerateButton:addEventListener( "touch", GenerateButtonTouch )






local function updateScoreText()

    if Test == 1 or Test == 2 or Test == 3 or Test == 4 or Test == 5 or Test == 6 or Test == 7 or Test == 8 or Test == 9 or Test == 10 then
        Score = Score + 1
        if Score == 10 then 
            GameOver()
        end
        ScoreText.text = "Your Score Is "..Score

    end
end  -- for the function


local function SubmitButtonTouch( event )

    if event.phase == "began" then

        Entry = tonumber(EntryTextField.text)

        Test = 0
    
        if letter == 1 and Entry == 81 then
            letterText.text = "Correct"
            letter = nil
            Test = 1
            q1 = true
            updateScoreText()

        elseif letter == 2 and Entry == -2 then
            letterText.text = "Correct"
            letter = nil
            Test = 2
            q2 = true
            updateScoreText()
        

        elseif letter == 3 and Entry == 360 then
            letterText.text = "Correct"
            letter = nil
            Test = 3
            q3 = true
            updateScoreText()    
            

        elseif letter == 4 and Entry == 14 then
            letterText.text = "Correct"
            letter = nil
            Test = 4
            q4 = true
             updateScoreText()       
                
        elseif letter == 5 and Entry == 36 then
            letterText.text = "Correct"
            letter = nil
            Test = 5
            q5 = true
            updateScoreText()        

        elseif letter == 6 and Entry == 0 then
            letterText.text = "Correct"
            letter = nil
            Test = 6
            q6 = true
             updateScoreText()           

        elseif letter == 7 and Entry == 16 then
            letterText.text = "Correct"
            letter = nil
            Test = 7
            q7 = true
        updateScoreText()

        elseif letter == 8 and Entry == 0.05 then
            letterText.text = "Correct"
            letter = nil
            Test = 8
            q8 = true
        updateScoreText()

        elseif letter == 9 and Entry == 200 then
            letterText.text = "Correct"
            letter = nil
            Test = 9
            q9 = true
            updateScoreText()
        

        elseif letter == 10 and Entry  == 0 then
            letterText.text = "Correct"
            letter = nil
            Test = 10
            q10 = true
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


SubmitButton:addEventListener( "touch", SubmitButtonTouch )
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