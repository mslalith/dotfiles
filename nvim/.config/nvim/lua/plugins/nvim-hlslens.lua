require("hlslens").setup()

-- start hlslens when one of below keymap triggers
ms.keys.normal_mode("*", [[*<Cmd>lua require('hlslens').start()<CR>]])
ms.keys.normal_mode("#", [[#<Cmd>lua require('hlslens').start()<CR>]])
ms.keys.normal_mode("g*", [[g*<Cmd>lua require('hlslens').start()<CR>]])
ms.keys.normal_mode("g#", [[g#<Cmd>lua require('hlslens').start()<CR>]])
ms.keys.normal_mode("n", [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]])
ms.keys.normal_mode("N", [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]])
