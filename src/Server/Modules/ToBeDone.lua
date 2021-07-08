-- To Be Done
-- Username
-- July 7, 2021



local ToBeDone = {}

--[[
    To be Done:
        - Clean up code and simplify it
        - Finish adding cooking items
        - Find a gui enter sound for all gui 
        - Find better click button sound for gui
        - Add player control script:
            - Player Dash animations
            - Player dash controls
            - Player crouch controls
            - Player crouch animation
            - Default shiftlock mode where when the mouse moves the camera moves withough left click
        - Add mobile button player controls
        - Finish scripting inventory stuff then add it with DataStore2 (later)
        - Learn FastCast for weapons (later)

    Done:      
        - F̶i̶x̶ ̶c̶l̶i̶c̶k̶i̶n̶g̶ ̶n̶o̶n̶ ̶i̶n̶t̶e̶r̶a̶c̶t̶i̶v̶e̶ ̶p̶a̶r̶t̶s̶ ̶o̶f̶ ̶i̶n̶v̶e̶n̶t̶o̶r̶y̶ ̶g̶u̶i̶ ̶c̶l̶o̶s̶e̶s̶ ̶i̶t̶
        - M̶a̶k̶e̶ ̶i̶t̶ ̶s̶o̶ ̶t̶h̶a̶t̶ ̶p̶l̶a̶y̶e̶r̶ ̶c̶a̶n̶n̶o̶t̶ ̶m̶o̶v̶e̶ ̶w̶h̶e̶n̶ ̶a̶n̶i̶m̶a̶t̶i̶o̶n̶s̶ ̶h̶a̶v̶e̶n̶'̶t̶ ̶l̶o̶a̶d̶e̶d̶ ̶a̶n̶d̶ ̶t̶h̶a̶t̶ ̶i̶t̶ ̶a̶l̶w̶a̶y̶s̶ ̶w̶o̶r̶k̶s̶ ̶i̶f̶ ̶t̶h̶e̶y̶ ̶r̶e̶s̶p̶a̶w̶n̶
        - M̶a̶k̶e̶ ̶t̶h̶e̶ ̶t̶u̶r̶n̶i̶n̶g̶ ̶B̶a̶c̶k̶g̶r̶o̶u̶n̶d̶ ̶b̶u̶t̶t̶o̶n̶ ̶v̶i̶s̶i̶b̶i̶l̶i̶t̶y̶ ̶o̶n̶/̶o̶f̶f̶ ̶a̶ ̶f̶u̶n̶c̶t̶i̶o̶n̶ ̶f̶o̶r̶ ̶b̶e̶t̶t̶e̶r̶ ̶c̶o̶n̶t̶r̶o̶l̶
        - C̶o̶n̶n̶e̶c̶t̶ ̶c̶l̶i̶c̶k̶ ̶b̶u̶t̶t̶o̶n̶ ̶s̶o̶u̶n̶d̶ ̶f̶o̶r̶ ̶i̶n̶v̶e̶n̶t̶o̶r̶y̶ ̶g̶u̶i̶
        - S̶c̶r̶i̶p̶t̶ ̶w̶e̶a̶p̶o̶n̶s̶ ̶a̶n̶d̶ ̶i̶n̶g̶r̶e̶d̶i̶e̶n̶t̶s̶ ̶t̶a̶b̶ ̶o̶f̶ ̶i̶n̶v̶e̶n̶t̶o̶r̶y̶
        - T̶o̶g̶g̶l̶e̶ ̶i̶n̶v̶e̶n̶t̶o̶r̶y̶ ̶f̶o̶r̶ ̶p̶c̶ ̶u̶s̶e̶r̶s̶
        - A̶d̶d̶ ̶w̶a̶l̶k̶/̶r̶u̶n̶ ̶a̶n̶d̶ ̶i̶d̶l̶e̶ ̶a̶n̶i̶m̶a̶t̶i̶o̶n̶s̶
        - U̶s̶e̶ ̶r̶e̶l̶i̶a̶b̶l̶e̶ ̶e̶q̶u̶i̶p̶p̶i̶n̶g̶ ̶i̶t̶e̶m̶s̶ ̶m̶e̶t̶h̶o̶d̶
        - M̶a̶k̶e̶ ̶t̶h̶e̶ ̶g̶u̶i̶ ̶a̶n̶i̶m̶a̶t̶i̶o̶n̶s̶ ̶p̶l̶a̶y̶b̶a̶c̶k̶ ̶a̶u̶t̶o̶m̶a̶t̶i̶c̶ ̶(̶D̶i̶d̶ ̶n̶o̶t̶ ̶u̶s̶e̶ ̶t̶w̶e̶e̶n̶ ̶s̶e̶r̶v̶i̶c̶e̶ ̶b̶e̶c̶a̶u̶s̶e̶ ̶T̶R̶A̶S̶H̶!̶!̶!̶)̶
        - M̶o̶b̶i̶l̶e̶ ̶I̶c̶o̶n̶s̶ ̶u̶p̶d̶a̶t̶e̶d̶ ̶s̶o̶ ̶o̶n̶l̶y̶ ̶s̶h̶o̶w̶ ̶o̶n̶ ̶T̶o̶u̶c̶h̶ ̶E̶n̶a̶b̶l̶e̶d̶ ̶D̶e̶v̶i̶c̶e̶s̶
        - M̶a̶k̶e̶ ̶i̶t̶ ̶s̶o̶ ̶t̶h̶a̶t̶ ̶t̶h̶e̶ ̶g̶u̶i̶ ̶g̶e̶t̶s̶ ̶s̶m̶a̶l̶l̶e̶r̶ ̶o̶n̶ ̶m̶o̶u̶s̶e̶ ̶h̶o̶v̶e̶r̶ ̶a̶n̶d̶ ̶b̶i̶g̶g̶e̶r̶ ̶o̶n̶ ̶m̶o̶u̶s̶e̶ ̶c̶l̶i̶c̶k̶
        - ̶M̶a̶k̶e̶ ̶i̶t̶ ̶s̶o̶ ̶t̶h̶a̶t̶ ̶w̶h̶e̶n̶ ̶y̶o̶u̶ ̶c̶l̶i̶c̶k̶ ̶P̶ ̶a̶g̶a̶i̶n̶ ̶i̶t̶ ̶c̶l̶o̶s̶e̶s̶ ̶t̶h̶e̶ ̶R̶a̶d̶i̶a̶l̶ ̶M̶e̶n̶u̶
        - M̶a̶k̶e̶ ̶R̶ ̶t̶h̶e̶ ̶K̶e̶y̶C̶o̶d̶e̶ ̶f̶o̶r̶ ̶t̶r̶i̶g̶e̶g̶r̶i̶n̶g̶ ̶R̶a̶d̶i̶a̶l̶ ̶M̶e̶n̶u̶
        - F̶i̶x̶ ̶g̶u̶i̶ ̶b̶l̶o̶c̶k̶i̶n̶g̶ ̶c̶a̶m̶e̶r̶a̶ ̶t̶u̶r̶n̶i̶n̶g̶ ̶b̶u̶g̶
        - F̶i̶x̶ ̶r̶a̶d̶i̶a̶l̶ ̶m̶e̶n̶u̶ ̶m̶i̶s̶c̶o̶n̶f̶i̶g̶u̶r̶a̶t̶i̶o̶n̶ ̶w̶h̶e̶n̶ ̶o̶p̶e̶n̶
        - F̶i̶x̶ ̶b̶u̶g̶ ̶w̶h̶e̶r̶e̶ ̶i̶f̶ ̶o̶p̶e̶n̶ ̶R̶a̶d̶i̶a̶l̶ ̶M̶e̶n̶u̶ ̶w̶i̶t̶h̶ ̶m̶o̶u̶s̶e̶ ̶i̶n̶ ̶m̶i̶d̶d̶l̶e̶ ̶G̶U̶I̶ ̶a̶p̶p̶e̶a̶r̶s̶ ̶b̶i̶g̶g̶e̶r̶ ̶t̶h̶a̶n̶ ̶a̶c̶t̶u̶a̶l̶l̶y̶ ̶i̶s̶ ̶(̶T̶r̶y̶ ̶f̶i̶x̶i̶n̶g̶ ̶w̶i̶t̶h̶ ̶A̶c̶t̶i̶v̶a̶t̶e̶d̶ ̶e̶v̶e̶n̶t̶!̶)̶
        - A̶d̶d̶ ̶o̶t̶h̶e̶r̶ ̶m̶o̶b̶i̶l̶e̶ ̶b̶u̶t̶t̶o̶n̶s̶
        - R̶e̶p̶l̶a̶c̶e̶ ̶r̶o̶b̶l̶o̶x̶ ̶j̶u̶m̶p̶ ̶b̶u̶t̶t̶o̶n̶ ̶w̶i̶t̶h̶ ̶o̶n̶e̶ ̶p̶r̶o̶v̶i̶d̶e̶d̶ ̶b̶y̶ ̶A̶i̶r̶p̶u̶n̶c̶h̶
        - M̶a̶k̶e̶ ̶t̶h̶e̶ ̶R̶a̶d̶i̶a̶l̶ ̶M̶e̶n̶u̶ ̶m̶o̶b̶i̶l̶e̶ ̶c̶o̶m̶p̶a̶t̶i̶b̶l̶e̶ ̶b̶y̶ ̶u̶s̶i̶n̶g̶ ̶m̶o̶d̶u̶l̶e̶
        - F̶i̶x̶ ̶t̶h̶e̶ ̶p̶o̶s̶i̶t̶i̶o̶n̶i̶n̶g̶ ̶o̶f̶ ̶t̶h̶e̶ ̶m̶i̶d̶d̶l̶e̶ ̶g̶u̶i̶ ̶i̶m̶a̶g̶e̶ ̶l̶a̶b̶e̶l̶ ̶c̶a̶l̶l̶e̶d̶ ̶"̶C̶e̶n̶t̶e̶r̶"̶
        - M̶a̶k̶e̶ ̶i̶t̶ ̶s̶o̶ ̶t̶h̶a̶t̶ ̶t̶h̶e̶ ̶R̶a̶d̶i̶a̶l̶ ̶M̶e̶n̶u̶ ̶i̶s̶ ̶t̶r̶i̶g̶g̶e̶r̶e̶d̶ ̶f̶r̶o̶m̶ ̶a̶ ̶s̶p̶e̶c̶i̶f̶i̶c̶ ̶k̶e̶y̶ ̶(̶T̶B̶D̶)̶

    Notes:
        - Strike through command is Ctrl + K
        - (This was when I made the items Accessories and I tried to apply a Motor6D afterwards) This solves the problem.
            -Motor6D.C0 = ITEM.Handle.CFrame:Inverse() * desiredCFrame
]]

return ToBeDone