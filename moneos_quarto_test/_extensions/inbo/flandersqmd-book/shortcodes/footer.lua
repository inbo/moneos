function is_empty(s)
  return s == nil or s == ''
end

return {
  ['footer'] = function(args, kwargs, meta)

    z = '<a rel="license" href="http://creativecommons.org/licenses/by/4.0/">' ..
      '<img alt="Creative Commons-License" style="border-width:0" class="ccby"/>' ..
      '</a> '.. meta.shortauthor
    if is_empty(meta.flandersqmd.year) then
      z = z .. ' !!! Missing flandersqmd.year !!! '
    else
      z = z .. ' (' .. pandoc.utils.stringify(meta.flandersqmd.year) .. ') '
    end
    if tonumber(pandoc.utils.stringify(meta.public)) > 0 then
      if is_empty(meta.flandersqmd.doi) then
        z = z .. ' !!! Missing flandersqmd.doi !!! '
      else
        local x = pandoc.utils.stringify(meta.flandersqmd.doi)
        z = z .. '<a href="https://doi.org/' .. x .. '">' .. x .. '</a>'
      end
    else
      if tonumber(pandoc.utils.stringify(meta.displaycolophon)) > 0 then
        if is_empty(meta.flandersqmd.reportnr) then
          z = z .. ' !!! Missing flandersqmd.reportnr !!! '
        else
          z = z .. ' ' .. pandoc.utils.stringify(meta.flandersqmd.reportnr) .. ' ' .. os.date("%Y-%m-%d %H:%M:%S")
        end
      else
        z = z .. os.date("%Y-%m-%d %H:%M:%S")
      end
    end

    return pandoc.RawInline("html", z)
  end
}
