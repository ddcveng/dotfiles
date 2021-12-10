lua << EOF
local saga = require'lspsaga'

saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
  code_action_icon = ' ',
  code_action_prompt = {
   enable = true,
   sign = true,
   sign_priority = 20,
   virtual_text = false, -- NO lightbulb at the end of the line
 },
}
EOF

" show hover doc
nnoremap <silent>K :Lspsaga hover_doc<CR>
inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
nnoremap <silent> <leader>cw <Cmd>Lspsaga rename<CR>
" I like basic LSP find references more
" nnoremap <silent> gr <Cmd>Lspsaga lsp_finder<CR>
nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent> <leader>ca :Lspsaga code_action<CR>
