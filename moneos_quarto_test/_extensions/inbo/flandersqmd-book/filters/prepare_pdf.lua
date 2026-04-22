function is_empty(s)
  return s == nil or s == ''
end

local function pdf_footer(meta)
  local z
  if is_empty(meta.flandersqmd.doi) then
    if tonumber(pandoc.utils.stringify(meta.displaycolophon)) > 0 then
      if tonumber(pandoc.utils.stringify(meta.public)) > 0 then
        z = "!!! missing flandersqmd.doi !!!"
      else
        if is_empty(meta.flandersqmd.reportnr) then
          z = "!!! missing flandersqmd.reportnr !!! \\DTMnow"
        else
          z = pandoc.utils.stringify(meta.flandersqmd.reportnr) .. " \\DTMnow"
        end
      end
    else
      z = "\\DTMnow"
    end
  else
    z = pandoc.utils.stringify(meta.flandersqmd.doi)
  end
  return pandoc.RawInline("latex", z)
end

--[[format person]]
local function title_person(person, i, type)
  local res = ''
  if i > 1 then
    res = res .. ', '
  end
  if is_empty(person.name) then
    res = res .. '!!! flandersqmd.' .. type ..' element ' .. i .. ' has no name element!!!'
  else
    if is_empty(person.name.given) then
      res = res .. '!!! flandersqmd.' .. type .. ' element ' .. i .. ' name element has no given element!!!'
    else
      res = res .. pandoc.utils.stringify(person.name.given)
    end
    if is_empty(person.name.family) then
      res = res .. '!!! flandersqmd.' .. type .. ' element ' .. i .. ' name element has no family element!!!'
    else
      res = res .. ' ' .. pandoc.utils.stringify(person.name.family)
    end
  end
  return res
end

local function title_author(meta)
  if is_empty(meta.flandersqmd.author) then
    z = '!!! Missing flandersqmd.author !!!'
  else
    z = ''
    for i, person in pairs(meta.flandersqmd.author) do
      z = z .. title_person(person, i, 'author')
    end
  end
  return pandoc.RawInline("latex", z)
end

--[[format colophon person]]
local function colophon_person(person, i, type)
  local res = ''
  if i > 1 then
    res = res .. ', '
  end
  if is_empty(person.name) then
    res = res .. '!!! flandersqmd.' .. type ..' element ' .. i .. ' has no name element!!!'
  else
    if not is_empty(person.orcid) then
      res = res .. '\\href{https://orcid.org/' ..
        pandoc.utils.stringify(person.orcid) .. '}{'
    end
    if is_empty(person.name.given) then
      res = res .. '!!! flandersqmd.' .. type .. ' element ' .. i .. ' name element has no given element!!!'
    else
      res = res .. pandoc.utils.stringify(person.name.given)
    end
    if is_empty(person.name.family) then
      res = res .. '!!! flandersqmd.' .. type .. ' element ' .. i .. ' name element has no family element!!!'
    else
      res = res .. ' ' .. pandoc.utils.stringify(person.name.family)
    end
    if not is_empty(person.orcid) then
      res = res .. ' \\includegraphics[height=\\fontsizebase]{orcid.eps}}'
    end
  end
  return res
end

--[[format colophon person]]
local function corresponding_person(person, i, type)
  local res = ''
  if not is_empty(person.corresponding) then
    if is_empty(person.email) then
      res = res .. '!!! flandersqmd.' .. type .. ' element ' .. i .. ' has no e-mail element!!!'
    else
      x = pandoc.utils.stringify(person.email)
      res = res .. '\\href{mailto:' .. x .. '}{' .. x .. '} '
    end
  end
  return res
end


local function colophon_author(meta)
  if is_empty(meta.flandersqmd.author) then
    z = '!!! Missing flandersqmd.author !!!'
  else
    z = ''
    for i, person in pairs(meta.flandersqmd.author) do
      z = z .. colophon_person(person, i, 'author')
    end
  end
  return pandoc.RawInline("latex", z)
end

local function reviewer(meta)
  if is_empty(meta.flandersqmd.reviewer) then
    z = '!!! Missing flandersqmd.reviewer !!!'
  else
    z = ''
    for i, person in pairs(meta.flandersqmd.reviewer) do
      z = z .. colophon_person(person, i, 'reviewer')
    end
  end
  return pandoc.RawInline("latex", z)
end

local function corresponding(meta)
  if is_empty(meta.flandersqmd.author) then
    z = '!!! Missing flandersqmd.author !!!'
  else
    z = ''
    for i, person in pairs(meta.flandersqmd.author) do
      if z == '' then
        z = corresponding_person(person, i, 'author')
      end
    end
    if z == '' then
      x = meta.translation.email
      z = '\\href{mailto:' .. x .. '}{' .. x .. '} '
    end
  end
  return pandoc.RawInline("latex", z)
end

local function client(client, tag, url, logo)
  if is_empty(client) then
    pandoc.RawInline("latex", "")
  end
  z = '\\textbf{' .. tag .. ":}"
  for i, x in pairs(client) do
    z = z .. "\\\\" .. pandoc.utils.stringify(x)
  end
  if not is_empty(url) then
    x = pandoc.utils.stringify(url)
    z = z .. "\\\\\n\\url{" .. x .. "}"
  end
  if not is_empty(logo) then
    x = pandoc.utils.stringify(logo)
    z = z .. "\\\\ \\vspace{\\fontsizebase} \\includegraphics[height = 15mm, keepaspectratio]{" .. x .. "}"
  end
  return pandoc.RawInline("latex", z)
end

return {
  {
    Meta = function(meta)
      meta.pagefooter = pdf_footer(meta)
      meta.title_author = title_author(meta)
      meta.colophon_author = colophon_author(meta)
      meta.reviewer = reviewer(meta)
      meta.corresponding = corresponding(meta)
      if not is_empty(meta.flandersqmd.client) then
        meta.client = client(
          meta.flandersqmd.client, meta.translation.client,
          meta.flandersqmd.clienturl, meta.flandersqmd.clientlogo
        )
      end
      if not is_empty(meta.flandersqmd.cooperation) then
        meta.cooperation = client(
          meta.flandersqmd.cooperation, meta.translation.cooperation,
          meta.flandersqmd.cooperationurl, meta.flandersqmd.cooperationlogo
        )
      end
      if not is_empty(meta.flandersqmd.floatbarrier) then
        if (pandoc.utils.stringify(meta.flandersqmd.floatbarrier) == "section") then
          meta.floatbarriersection = true
        end
        if (pandoc.utils.stringify(meta.flandersqmd.floatbarrier) == "subsection") then
          meta.floatbarriersubsection = true
        end
        if (pandoc.utils.stringify(meta.flandersqmd.floatbarrier) == "subsubsection") then
          meta.floatbarriersubsubsection = true
        end
      end
      return meta
    end
  }
}
