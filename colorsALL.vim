" Change the color scheme from a list of color scheme names.
" Version 2010-09-12 from http://vim.wikia.com/wiki/VimTip341
" Press key:
"   F8                next scheme
"   Shift-F8          previous scheme
"   Alt-F8            random scheme
" Set the list of color schemes used by the above (default is 'all'):
"   :SetColors all              (all $VIMRUNTIME/colors/*.vim)
"   :SetColors my               (names built into script)
"   :SetColors blue slate ron   (these schemes)
"   :SetColors                  (display current scheme names)
" Set the current color scheme based on time of day:
"   :SetColors now
if v:version < 700 || exists('loaded_setcolors') || &cp
  finish
endif

let loaded_setcolors = 1
let s:mycolors = ['0x7A69_dark', '1989', '256-grayvim', '256-jungle', '256_noir', '3dglasses', 'abbott', 'abra', 'adam', 'adaryn', 'adobe', 'adrian', 'advantage', 'af', 'aiseered', 'alduin', 'anderson', 'anotherdark', 'ansi_blows', 'antares', 'apprentice', 'aqua', 'argonaut', 'ashen', 'asmanian_blood', 'astronaut', 'asu1dark', 'atom', 'automation', 'autumnleaf', 'autumn', 'babymate256', 'badwolf', 'base16-ateliercave', 'base16-atelierdune', 'base16-atelierestuary', 'base16-atelierforest', 'base16-atelierheath', 'base16-atelierlakeside', 'base16-atelierplateau', 'base16-ateliersavanna', 'base16-atelierseaside', 'base16-ateliersulphurpool', 'base16-railscasts', 'base', 'basic', 'baycomb', 'bayQua', 'bclear', 'beachcomber', 'beauty256', 'beekai', 'behelit', 'benlight', 'Benokai', 'bensday', 'billw', 'biogoo', 'birds-of-paradise', 'black_angus', 'blackbeauty', 'blackboard', 'blackdust', 'blacklight', 'BlackSea', 'blazer', 'blink', 'bluechia', 'bluedrake', 'bluegreen', 'blueprint', 'blueshift', 'blue', 'bluez', 'blugrine', 'bmichaelsen', 'bocau', 'bog', 'borland', 'breeze', 'brogrammer', 'brookstream', 'brown', 'bubblegum-256-dark', 'bubblegum-256-light', 'bubblegum', 'buddy', 'burnttoast256', 'busierbee', 'busybee', 'buttercream', 'bvemu', 'bw', 'C64', 'cabin', 'cake16', 'cake', 'calmar256-light', 'camo', 'campfire', 'candycode', 'candyman', 'CandyPaper', 'candy', 'caramel', 'carrot', 'carvedwoodcool', 'carvedwood', 'cascadia', 'cgpro', 'chance-of-storm', 'charged-256', 'charon', 'Chasing_Logic', 'chela_light', 'chlordane', 'ChocolateLiquor', 'ChocolatePapaya', 'chocolate', 'chrysoprase', 'ciscoacl', 'clarity', 'cleanphp', 'cleanroom', 'clearance', 'cloudy', 'clue', 'cobalt2', 'cobaltish', 'cobalt', 'coda', 'codeblocks_dark', 'codeburn', 'CodeFactoryv3', 'codeschool', 'coffee', 'coldgreen', 'colorer', 'colorful256', 'colorful', 'colorsbox-faff', 'colorsbox-greenish', 'colorsbox-material', 'colorsbox-stblue', 'colorsbox-stbright', 'colorsbox-steighties', 'colorsbox-stnight', 'colorscheme_template', 'colorzone', 'contrasty', 'cool', 'corn', 'corporation', 'crayon', 'cthulhian', 'custom', 'c', 'd8g_01', 'd8g_02', 'd8g_03', 'd8g_04', 'dante', 'darkblack', 'darkblue2', 'darkBlue', 'darkbone', 'darkburn', 'darkdot', 'darkeclipse', 'darkerdesert', 'darker-robin', 'darkocean', 'darkrobot', 'dark-ruby', 'darkslategray', 'darkspectrum', 'darktango', 'darkzen', 'darkZ', 'darth', 'dawn', 'deepsea', 'delek', 'delphi', 'denim', 'derefined', 'desert256v2', 'desert256', 'desertedoceanburnt', 'desertedocean', 'desertEx', 'desertink', 'desert', 'detailed', 'devbox-dark-256', 'DevC++', 'Dev_Delight', 'deveiate', 'developer', 'disciple', 'distinguished', 'django', 'donbass', 'doorhinge', 'doriath', 'dual', 'dull', 'duotone-darkcave', 'duotone-darkdesert', 'duotone-darkearth', 'duotone-darkforest', 'duotone-darkheath', 'duotone-darklake', 'duotone-darkmeadow', 'duotone-darkpark', 'duotone-darkpool', 'duotone-darksea', 'duotone-darkspace', 'duotone-dark', 'dusk', 'earendel', 'earthburn', 'earth', 'eclipse', 'eclm_wombat', 'ecostation', 'editplus', 'edo_sea', 'ego', 'ekinivim', 'ekvoli', 'elda', 'elise', 'elisex', 'elrodeo', 'elrond', 'emacs', 'enigma', 'enzyme', 'erez', 'eva01', 'eva', 'evening_2', 'evening', 'evolution', 'far', 'felipec', 'feral', 'fine_blue', 'flatcolor', 'flatlandia', 'flatland', 'flattened_dark', 'flattened_light', 'flattown', 'flattr', 'flatui', 'fnaqevan', 'fog', 'fokus', 'forneus', 'freya', 'frood', 'frozen', 'fruidle', 'fruit', 'fruity', 'fu', 'fx', 'gardener', 'gemcolors', 'genericdc-light', 'genericdc', 'gentooish', 'getafe', 'getfresh', 'github', 'gobo', 'golded', 'golden', 'google', 'gor', 'gotham256', 'gotham', 'gothic', 'grape', 'gravity', 'graywh', 'grb256', 'greens', 'greenvision', 'grey2', 'greyblue', 'grishin', 'gruvbox', 'gryffin', 'guardian', 'guepardo', 'h80', 'habiLight', 'harlequin', 'heliotrope', 'hemisu', 'herald', 'herokudoc-gvim', 'herokudoc', 'heroku-terminal', 'heroku', 'hilal', 'holokai', 'hornet', 'hotpot', 'hybrid-light', 'hybrid_material', 'hybrid_reverse', 'hybrid', 'iangenzo', 'ibmedit', 'icansee', 'iceberg', 'impactG', 'impactjs', 'impact', 'industrial', 'industry', 'ingretu', 'inkpot', 'inori', 'ir_black', 'ironman', 'itg_flat', 'jaime', 'jammy', 'janah', 'jelleybeans', 'jellybeans', 'jellyx', 'jhdark', 'jhlight', 'jiks', 'kalahari', 'kalisi', 'kaltex', 'kalt', 'kate', 'kellys', 'khaki', 'kib_darktango', 'kib_plastic', 'kiss', 'kkruby', 'kolor', 'kruby', 'kyle', 'laederon', 'landscape', 'lapis256', 'last256', 'late_evening', 'lazarus', 'legiblelight', 'leglight2', 'leo', 'less', 'lettuce', 'leya', 'lightcolors', 'lightning', 'lilac', 'lilydjwg_dark', 'lilydjwg_green', 'lilypink', 'lingodirector', 'liquidcarbon', 'literal_tango', 'lizard256', 'lizard', 'lodestone', 'loogica', 'louver', 'lucid', 'lucius', 'luinnar', 'lumberjack', 'luna-term', 'luna', 'lxvc', 'mac_classic', 'made_of_code', 'madeofcode', 'magicwb', 'mango', 'manuscript', 'manxome', 'marklar', 'maroloccio', 'mars', 'martin_krischik', 'materialbox', 'material-theme', 'materialtheme', 'material', 'matrix', 'maui', 'mayansmoke', 'mdark', 'mellow', 'meta5', 'metacosm', 'midnight2', 'midnight', 'miko', 'mint', 'mizore', 'mod8', 'mod_tcsoft', 'mojave', 'molokai_dark', 'molokai', 'monoacc', 'monochrome', 'monokai-chris', 'monokain', 'Monokai', 'montz', 'moonshine_lowcontrast', 'moonshine', 'mophiaDark', 'mophiaSmoke', 'mopkai', 'moria', 'moss', 'motus', 'MountainDew', 'mrkn256', 'mrpink', 'mud', 'muon', 'mushroom', 'mustang', 'native', 'nature', 'navajo-night', 'navajo', 'nazca', 'nedit2', 'nedit', 'nefertiti', 'neon', 'neonwave', 'nerv-ous', 'neutron', 'neverland2-darker', 'neverland2', 'neverland-darker', 'neverland', 'neverness', 'nevfn', 'newspaper', 'newsprint', 'nicotine', 'nightflight2', 'nightflight', 'nightshimmer', 'nightsky', 'night', 'night_vision', 'nightVision', 'nightwish', 'no_quarter', 'northland', 'northsky', 'norwaytoday', 'nour', 'nuvola', 'obsidian2', 'obsidian', 'oceanblack256', 'oceanblack', 'oceandeep', 'OceanicNext', 'oceanlight', 'olive', 'onedark', 'orange', 'osx_like', 'otaku', 'oxeded', 'pacific', 'paintbox', 'PapayaWhip', 'PaperColor', 'parsec', 'peaksea', 'pencil', 'penultimate', 'peppers', 'perfect', 'pf_earth', 'phd', 'phoenix', 'phphaxor', 'phpx', 'pic', 'pink', 'playroom', 'pleasant', 'potts', 'predawn', 'preto', 'pride', 'primary', 'print_bw', 'prmths', 'professional', 'proton', 'pspad', 'psql', 'pt_black', 'putty', 'pw', 'pyte', 'python', 'quagmire', 'radicalgoodspeed', 'railscasts', 'rainbow_fine_blue', 'rainbow_fruit', 'rainbow_neon', 'rakr-light', 'random', 'rastafari', 'rcg_gui', 'rcg_term', 'rdark-terminal', 'rdark', 'redblack', 'redstring', 'refactor', 'relaxedgreen', 'reliable', 'reloaded', 'revolutions', 'Revolution', 'robinhood', 'rootwater', 'rtl', 'sand', 'sandydune', 'satori', 'saturn', 'scala', 'scheakur', 'scite', 'scooby', 'sean', 'seashell', 'sea', 'selenitic', 'seoul256-light', 'seoul256', 'seoul', 'seti', 'settlemyer', 'sexy-railscasts', 'sf', 'shadesofamber', 'shades-of-teal', 'shobogenzo', 'sienna', 'sierra', 'sift', 'silent', 'simple256', 'simpleandfriendly', 'simple_b', 'simplewhite', 'simplon', 'skittles_berry', 'skittles_dark', 'sky', 'SlateDark', 'smpl', 'smp', 'smyck', 'soda', 'softbluev2', 'softblue', 'softlight', 'solarized', 'sole', 'sol-term', 'sol', 'sonofobsidian', 'sonoma', 'sorcerer', 'soso', 'sourcerer', 'southernlights', 'southwest-fog', 'spacegray', 'spectro', 'spiderhawk', 'Spink', 'spring', 'sprinkles', 'stackoverflow', 'stingray', 'stonewashed-256', 'stonewashed-gui', 'strange', 'strawimodo', 'summerfruit256', 'summerfruit', 'sunburst', 'surveyor', 'swamplight', 'sweater', 'SweetCandy', 'symfony', 'synic', 'tabula', 'tango2', 'tango-desert', 'tango-morning', 'tangoshady', 'tango', 'tangoX', 'taqua', 'tayra', 'tchaba2', 'tchaba', 'tcsoft', 'telstar', 'termschool', 'tesla', 'tetragrammaton', 'textmate16', 'thegoodluck', 'thestars', 'thornbird', 'thor', 'tibet', 'tidy', 'tir_black', 'tolerable', 'tomatosoup', 'Tomorrow-Night-Blue', 'Tomorrow-Night-Bright', 'Tomorrow-Night-Eighties', 'Tomorrow-Night', 'Tomorrow', 'tony_light', 'toothpik', 'torte', 'transparent', 'triplejelly', 'trivial256', 'trogdor', 'tropikos', 'turbo', 'tutticolori', 'twilight256', 'twilight', 'twitchy', 'two2tango', 'ubaryd', 'ubloh', 'umber-green', 'understated', 'underwater-mod', 'underwater', 'up', 'valloric', 'vanzan_color', 'vcbc', 'vc', 'vexorian', 'vibrantink', 'vilight', 'vimbrant', 'visualstudio', 'vividchalk', 'VIvid', 'vj', 'void', 'vydark', 'vylight', 'wargrey', 'warm_grey', 'wasabi256', 'watermark', 'wellsokai', 'whitebox', 'whitedust', 'widower', 'win9xblueback', 'wintersday', 'winter', 'woju', 'wolfpack', 'wombat256i', 'wombat256mod', 'wombat256', 'wombat', 'wood', 'wuye', 'xemacs', 'xian', 'xmaslights', 'xoria256', 'xterm16', 'yaml', 'yeller', 'zazen', 'zenburn', 'zenesque', 'zen', 'zephyr', 'zmrok', 'znake']  " colorscheme names that we use to set color

" Set list of color scheme names that we will use, except
" argument 'now' actually changes the current color scheme.
function! s:SetColors(args)
  if len(a:args) == 0
    echo 'Current color scheme names:'
    let i = 0
    while i < len(s:mycolors)
      echo '  '.join(map(s:mycolors[i : i+4], 'printf("%-14s", v:val)'))
      let i += 5
    endwhile
  elseif a:args == 'all'
    let paths = split(globpath(&runtimepath, 'colors/*.vim'), "\n")
    let s:mycolors = map(paths, 'fnamemodify(v:val, ":t:r")')
    echo 'List of colors set from all installed color schemes'
  elseif a:args == 'my'
    let c1 = 'default elflord peachpuff desert256 breeze morning'
    let c2 = 'darkblue gothic aqua earth black_angus relaxedgreen'
    let c3 = 'darkblack freya motus impact less chocolateliquor'
    let s:mycolors = split(c1.' '.c2.' '.c3)
    echo 'List of colors set from built-in names'
  elseif a:args == 'now'
    call s:HourColor()
  else
    let s:mycolors = split(a:args)
    echo 'List of colors set from argument (space-separated names)'
  endif
endfunction

command! -nargs=* SetColors call s:SetColors('<args>')

" Set next/previous/random (how = 1/-1/0) color from our list of colors.
" The 'random' index is actually set from the current time in seconds.
" Global (no 's:') so can easily call from command line.
function! NextColor(how)
  call s:NextColor(a:how, 1)
endfunction

" Helper function for NextColor(), allows echoing of the color name to be
" disabled.
function! s:NextColor(how, echo_color)
  if len(s:mycolors) == 0
    call s:SetColors('all')
  endif
  if exists('g:colors_name')
    let current = index(s:mycolors, g:colors_name)
  else
    let current = -1
  endif
  let missing = []
  let how = a:how
  for i in range(len(s:mycolors))
    if how == 0
      let current = localtime() % len(s:mycolors)
      let how = 1  " in case random color does not exist
    else
      let current += how
      if !(0 <= current && current < len(s:mycolors))
        let current = (how>0 ? 0 : len(s:mycolors)-1)
      endif
    endif
    try
      execute 'colorscheme '.s:mycolors[current]
      break
    catch /E185:/
      call add(missing, s:mycolors[current])
    endtry
  endfor
  redraw
  if len(missing) > 0
    echo 'Error: colorscheme not found:' join(missing)
  endif
  if (a:echo_color)
    echo g:colors_name
  endif
endfunction

nnoremap <F8> :call NextColor(1)<CR>
nnoremap <S-F8> :call NextColor(-1)<CR>
nnoremap <A-F8> :call NextColor(0)<CR>

" Set color scheme according to current time of day.
function! s:HourColor()
  let hr = str2nr(strftime('%H'))
  if hr <= 3
    let i = 0
  elseif hr <= 7
    let i = 1
  elseif hr <= 14
    let i = 2
  elseif hr <= 18
    let i = 3
  else
    let i = 4
  endif
  let nowcolors = 'elflord morning desert evening pablo'
  execute 'colorscheme '.split(nowcolors)[i]
  redraw
  echo g:colors_name
endfunction
