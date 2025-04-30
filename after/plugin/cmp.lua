local cmp = require('cmp')

cmp.setup({
   mapping = {
       ['<Tab>'] = cmp.mapping.confirm({select = true}),
  }
 })

local trim = require('trim')
trim.setup({
     -- if you want to ignore markdown file.
     -- you can specify filetypes.
   ft_blocklist = {"markdown"},
   patterns = {
   },
   trim_on_write = true,

})
