set background=dark
highlight clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'ansi'

hi Normal ctermfg=15 ctermbg=NONE      
hi Comment ctermfg=4 ctermbg=NONE      
hi Constant ctermfg=11 ctermbg=NONE    
hi String ctermfg=3 ctermbg=NONE       
hi Character ctermfg=3 ctermbg=NONE    
hi Number ctermfg=11 ctermbg=NONE      
hi Boolean ctermfg=11 ctermbg=NONE     
hi Float ctermfg=11 ctermbg=NONE       
hi Identifier ctermfg=13 ctermbg=NONE   
hi Function ctermfg=12 ctermbg=NONE    
hi Statement ctermfg=3 ctermbg=NONE    
hi Conditional ctermfg=3 ctermbg=NONE  
hi Repeat ctermfg=3 ctermbg=NONE       
hi Label ctermfg=3 ctermbg=NONE        
hi Operator ctermfg=11 ctermbg=NONE    
hi Keyword ctermfg=3 ctermbg=NONE      
hi Exception ctermfg=3 ctermbg=NONE    
hi PreProc ctermfg=7 ctermbg=NONE      
hi Include ctermfg=7 ctermbg=NONE      
hi Define ctermfg=7 ctermbg=NONE       
hi Macro ctermfg=7 ctermbg=NONE        
hi Type ctermfg=15 ctermbg=NONE        
hi Structure ctermfg=15 ctermbg=NONE   
hi StorageClass ctermfg=1 ctermbg=NONE 
hi Typedef ctermfg=15 ctermbg=NONE     
hi Special ctermfg=11 ctermbg=NONE     
hi SpecialChar ctermfg=11 ctermbg=NONE 
hi Tag ctermfg=11 ctermbg=NONE         
hi Delimiter ctermfg=15 ctermbg=NONE   
hi SpecialComment ctermfg=4 ctermbg=NONE 
hi Debug ctermfg=3 ctermbg=NONE        
hi Underlined ctermfg=7 cterm=underline ctermbg=NONE 
hi Ignore ctermfg=8 ctermbg=NONE       
hi Error ctermfg=15 ctermbg=9          
hi Todo ctermfg=11 ctermbg=0           

hi LineNr ctermfg=8 ctermbg=NONE       
hi CursorLineNr ctermfg=15 ctermbg=NONE 
hi CursorLine ctermbg=NONE             
hi StatusLine ctermfg=15 ctermbg=8     
hi StatusLineNC ctermfg=8 ctermbg=NONE 
hi VertSplit ctermfg=8 ctermbg=NONE    
hi Visual ctermbg=8                    
hi Search ctermfg=0 ctermbg=11         
hi IncSearch ctermfg=0 ctermbg=3       
hi NonText ctermfg=8 ctermbg=NONE      
hi SignColumn ctermbg=NONE             
hi Folded ctermfg=8 ctermbg=NONE       
hi FoldColumn ctermfg=8 ctermbg=NONE   

hi MiniStatuslineModeNormal ctermfg=0 ctermbg=1  
hi MiniStatuslineModeInsert ctermfg=1 ctermbg=0
hi MiniStatuslineModeVisual ctermfg=10 ctermbg=0
hi MiniStatuslineModeReplace ctermfg=11 ctermbg=0
hi MiniStatuslineModeCommand ctermfg=0 ctermbg=1
hi MiniStatuslineModeOther ctermfg=8 ctermbg=1
hi MiniStatuslineFileinfo ctermfg=3 ctermbg=0
hi MiniStatuslineFilename ctermfg=0 ctermbg=5
hi MiniStatuslineDevinfo ctermfg=2 ctermbg=0

