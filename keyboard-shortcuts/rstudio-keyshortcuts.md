```r
if (!require("CrossR")) devtools::install_github("jeffboichuk/CrossR")

sink("rstudio-keyshortcuts.md")
shortcuts %>%  
  arrange(windows) %>% 
  select(-mac) %>% 
  print(n = 122)
sink()
```

# A tibble: 122 x 3
    category          description                        windows               
    <chr>             <chr>                              <chr>                 
  1 Source Editor     Insert Assignment Operator         Alt + -               
  2 Execute           Execute Code Without Moving Cursor Alt + Enter           
  3 Source Editor     Collapse Fold                      Alt + L               
  4 Source Editor     Collapse All Folds                 Alt + O               
  5 Other             Show Request Log                   Ctrl + `              
  6 Other             Show Options                       Ctrl + ,              
  7 Source Navigation Go To File Function                Ctrl + .              
  8 Panes             Show Source                        Ctrl + 1              
  9 Panes             Show Console                       Ctrl + 2              
 10 Panes             Show Help                          Ctrl + 3              
 11 Panes             Show History                       Ctrl + 4              
 12 Panes             Show Files                         Ctrl + 5              
 13 Panes             Show Plots                         Ctrl + 6              
 14 Panes             Show Packages                      Ctrl + 7              
 15 Panes             Show Environment                   Ctrl + 8              
 16 Panes             Show Viewer                        Ctrl + 9              
 17 Source Navigation Go To Start Of Current Scope       Ctrl + Alt + A        
 18 Source Navigation Split Into Lines                   Ctrl + Alt + A        
 19 Execute           Execute To Current Line            Ctrl + Alt + B        
 20 Source Control    Diff Files                         Ctrl + Alt + D        
 21 Source Navigation Add Cursor Below                   Ctrl + Alt + Down     
 22 Execute           Execute From Current Line          Ctrl + Alt + E        
 23 Source Navigation Go To End Of Current Scope         Ctrl + Alt + E        
 24 Execute           Send To Terminal                   Ctrl + Alt + Enter    
 25 Execute           Execute Current Function           Ctrl + Alt + F        
 26 Other             Previous Plot                      Ctrl + Alt + F11      
 27 Terminal          Previous Terminal                  Ctrl + Alt + F11      
 28 Other             Next Plot                          Ctrl + Alt + F12      
 29 Terminal          Next Terminal                      Ctrl + Alt + F12      
 30 Execute           Source a File                      Ctrl + Alt + G        
 31 Source Editor     Insert Chunk                       Ctrl + Alt + I        
 32 Source Control    VCS Commit                         Ctrl + Alt + M        
 33 Execute           Execute Next Chunk                 Ctrl + Alt + N        
 34 Execute           Execute Previous Chunks            Ctrl + Alt + P        
 35 Execute           Execute All Code                   Ctrl + Alt + R        
 36 Files             Save All Source Docs               Ctrl + Alt + S        
 37 Execute           Execute Current Section            Ctrl + Alt + T        
 38 Source Navigation Find Usages                        Ctrl + Alt + U        
 39 Source Navigation Add Cursor Above                   Ctrl + Alt + Up       
 40 Source Editor     Extract Local Variable             Ctrl + Alt + V        
 41 Source Editor     Extract Function                   Ctrl + Alt + X        
 42 Other             Toggle Full Screen                 Ctrl + Ctrl + F       
 43 Execute           Execute Code                       Ctrl + Enter          
 44 Source Navigation Find Replace                       Ctrl + F              
 45 Panes             Show VCS                           Ctrl + F1             
 46 Source Navigation Source Navigate Forward            Ctrl + F10            
 47 Panes             Show Build                         Ctrl + F2             
 48 Source Navigation Find From Selection                Ctrl + F3             
 49 Panes             Show Connections                   Ctrl + F5             
 50 Other             Synctex Search                     Ctrl + F8             
 51 Source Navigation Source Navigate Back               Ctrl + F9             
 52 Source Editor     Reindent                           Ctrl + I              
 53 Source Editor     Yank Line After Cursor             Ctrl + K              
 54 Console           Console Clear                      Ctrl + L              
 55 Files             Open Source Doc                    Ctrl + O              
 56 Source Navigation Jump To Matching                   Ctrl + P              
 57 Source Navigation Go To Next Section                 Ctrl + PageDown       
 58 Source Navigation Go To Prev Section                 Ctrl + PageUp         
 59 Other             Quit Session                       Ctrl + Q              
 60 Files             Save Source Doc                    Ctrl + S              
 61 Other             Log Focused Element                Ctrl + Shift + `      
 62 Source Editor     Reflow Comment                     Ctrl + Shift + /      
 63 Tabs              Switch To Tab                      Ctrl + Shift + .      
 64 Other             Restart R                          Ctrl + Shift + 0      
 65 Source Editor     Reformat Code                      Ctrl + Shift + A      
 66 Source Editor     Show Diagnostics Project           Ctrl + Shift + Alt + D
 67 Source Navigation Expand To Matching                 Ctrl + Shift + Alt + E
 68 Source Editor     Rename In Scope                    Ctrl + Shift + Alt + M
 69 Profile           Profile Code                       Ctrl + Shift + Alt + P
 70 Source Editor     Insert Roxygen Skeleton            Ctrl + Shift + Alt + R
 71 Files             Close Other Source Docs            Ctrl + Shift + Alt + W
 72 Build             Build All                          Ctrl + Shift + B      
 73 Source Editor     Comment Uncomment                  Ctrl + Shift + C      
 74 Build             Roxygenize Package                 Ctrl + Shift + D      
 75 Source Navigation Shrink Selection                   Ctrl + Shift + Down   
 76 Build             Check Package                      Ctrl + Shift + E      
 77 Execute           Execute Current Chunk              Ctrl + Shift + Enter  
 78 Execute           Source Active Document With Echo   Ctrl + Shift + Enter  
 79 Files             Find In Files                      Ctrl + Shift + F      
 80 Tabs              First Tab                          Ctrl + Shift + F11    
 81 Tabs              Last Tab                           Ctrl + Shift + F12    
 82 Other             Viewer Save All And Refresh        Ctrl + Shift + F5     
 83 Other             Refresh Super Dev Mode             Ctrl + Shift + F9     
 84 Other             Set Working Dir                    Ctrl + Shift + H      
 85 Source Navigation Replace And Find                   Ctrl + Shift + J      
 86 Build             Compile PDF                        Ctrl + Shift + K      
 87 Build             Knit Document                      Ctrl + Shift + K      
 88 Build             Preview HTML                       Ctrl + Shift + K      
 89 Build             Devtools Load All                  Ctrl + Shift + L      
 90 Source Editor     Insert Pipe Operator               Ctrl + Shift + M      
 91 Files             New R Script                       Ctrl + Shift + N      
 92 Source Navigation Toggle Document Outline            Ctrl + Shift + O      
 93 Execute           Execute Last Code                  Ctrl + Shift + P      
 94 Source Editor     Insert Section                     Ctrl + Shift + R      
 95 Execute           Source Active File                 Ctrl + Shift + S      
 96 Build             Test Package                       Ctrl + Shift + T      
 97 Tabs              Previous Tab                       Ctrl + Shift + Tab    
 98 Source Navigation Expand Selection                   Ctrl + Shift + Up     
 99 Files             Close All Source Docs              Ctrl + Shift + W      
100 Tabs              Next Tab                           Ctrl + Tab            
101 Source Editor     Yank Line Up to Cursor             Ctrl + U              
102 Files             Close Source Doc                   Ctrl + W              
103 Source Editor     Kill Region                        Ctrl + W              
104 Source Editor     Insert Yanked Text                 Ctrl + Y              
105 Debug             Debug Step                         F10                   
106 Source Navigation Find Next                          F3                    
107 Other             Check Spelling                     F7                    
108 Source Navigation Go To Line                         Shift + Alt + G       
109 Source Navigation Jump To                            Shift + Alt + J       
110 Other             Help Keyboard Shortcuts            Shift + Alt + K       
111 Source Editor     Expand Fold                        Shift + Alt + L       
112 Source Editor     Expand All Folds                   Shift + Alt + O       
113 Terminal          New Terminal                       Shift + Alt + R       
114 Panes             Show Terminal                      Shift + Alt + T       
115 Other             Project Options                    Shift + Ctrl + ,      
116 Source Navigation Find Previous                      Shift + F3            
117 Debug             Debug Step Into                    Shift + F4            
118 Debug             Debug Continue                     Shift + F5            
119 Debug             Debug Finish                       Shift + F6            
120 Debug             Debug Stop                         Shift + F8            
121 Debug             Debug Breakpoint                   Shift + F9            
122 Source Editor     Insert Snippet                     Shift + Tab           
