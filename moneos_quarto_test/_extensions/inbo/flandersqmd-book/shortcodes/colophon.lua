return {
  ['colophon'] = function(args, kwargs, meta)
--[[check if variable has content]]
    local function is_empty(s)
      return s == nil or s == ''
    end

--[[format person]]
    local function display_person(person, i, type)
      local res = ''
      if i > 1 then
        res = res .. '<br>'
      end
      if not is_empty(person.email) then
        res = res .. '<a href= "mailto:' .. pandoc.utils.stringify(person.email) .. '">'
      end
      if is_empty(person.name) then
        res = res .. '<h1 class = "missing">!!! flandersqmd.' .. type ..' element ' .. i .. ' has no name element!!!</h1>'
      else
        if is_empty(person.name.given) then
          res = res .. '<h1 class = "missing">!!! flandersqmd.' .. type .. ' element ' .. i .. ' name element has no given element!!!</h1>'
        else
          res = res .. pandoc.utils.stringify(person.name.given)
        end
        if is_empty(person.name.family) then
          res = res .. '<h1 class = "missing">!!! flandersqmd.' .. type .. ' element ' .. i .. ' name element has no family element!!!</h1>'
        else
          res = res .. ' ' .. pandoc.utils.stringify(person.name.family)
        end
        if not is_empty(person.email) then
          res = res .. '</a>'
        end
      end
      if not is_empty(person.orcid) then
        local x = pandoc.utils.stringify(person.orcid)
        res = res .. '<a href="https://orcid.org/' .. x .. '" class="quarto-title-' .. type .. '-orcid"> <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo1N0NEMjA4MDI1MjA2ODExOTk0QzkzNTEzRjZEQTg1NyIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDozM0NDOEJGNEZGNTcxMUUxODdBOEVCODg2RjdCQ0QwOSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDozM0NDOEJGM0ZGNTcxMUUxODdBOEVCODg2RjdCQ0QwOSIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IE1hY2ludG9zaCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkZDN0YxMTc0MDcyMDY4MTE5NUZFRDc5MUM2MUUwNEREIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjU3Q0QyMDgwMjUyMDY4MTE5OTRDOTM1MTNGNkRBODU3Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+84NovQAAAR1JREFUeNpiZEADy85ZJgCpeCB2QJM6AMQLo4yOL0AWZETSqACk1gOxAQN+cAGIA4EGPQBxmJA0nwdpjjQ8xqArmczw5tMHXAaALDgP1QMxAGqzAAPxQACqh4ER6uf5MBlkm0X4EGayMfMw/Pr7Bd2gRBZogMFBrv01hisv5jLsv9nLAPIOMnjy8RDDyYctyAbFM2EJbRQw+aAWw/LzVgx7b+cwCHKqMhjJFCBLOzAR6+lXX84xnHjYyqAo5IUizkRCwIENQQckGSDGY4TVgAPEaraQr2a4/24bSuoExcJCfAEJihXkWDj3ZAKy9EJGaEo8T0QSxkjSwORsCAuDQCD+QILmD1A9kECEZgxDaEZhICIzGcIyEyOl2RkgwAAhkmC+eAm0TAAAAABJRU5ErkJggg=="></a>'
      end
      if not is_empty(person.affiliation) then
        for i, instititute in pairs(person.affiliation) do
          res = res .. ', ' .. pandoc.utils.stringify(instititute)
        end
      end
      return res
    end

--[[format person for bibtex]]
    local function bibtex_person(person, i, type)
      local res = ''
      if i > 1 then
        res = res .. ' and '
      end
      if is_empty(person.name) then
        res = res .. '<h1 class = "missing">!!! flandersqmd.' .. type ..' element ' .. i .. ' has no name element!!!</h1>'
      else
        if is_empty(person.name.family) then
          res = res .. '<h1 class = "missing">!!! flandersqmd.' .. type .. ' element ' .. i .. ' name element has no family element!!!</h1>'
        else
          res = res .. pandoc.utils.stringify(person.name.family) .. ', '
        end
        if is_empty(person.name.given) then
          res = res .. '<h1 class = "missing">!!! flandersqmd.' .. type .. ' element ' .. i .. ' name element has no given element!!!</h1>'
        else
          res = res .. pandoc.utils.stringify(person.name.given)
        end
      end
      return res
    end

--[[format person for ris]]
    local function ris_person(person, i, type)
      local res = 'AU  - '
      if is_empty(person.name) then
        res = res .. '<h1 class = "missing">!!! flandersqmd.' .. type ..' element ' .. i .. ' has no name element!!!</h1>'
      else
        if is_empty(person.name.family) then
          res = res .. '<h1 class = "missing">!!! flandersqmd.' .. type .. ' element ' .. i .. ' name element has no family element!!!</h1>'
        else
          res = res .. pandoc.utils.stringify(person.name.family) .. ', '
        end
        if is_empty(person.name.given) then
          res = res .. '<h1 class = "missing">!!! flandersqmd.' .. type .. ' element ' .. i .. ' name element has no given element!!!</h1>'
        else
          res = res .. pandoc.utils.stringify(person.name.given) .. '\n'
        end
      end
      return res
    end

--[[format person for json]]
    local function json_person(person, i, type)
      local res = '    {\n'
      if not is_empty(person.name) then
        if not is_empty(person.name.family) then
          res = res .. '      "family":"' .. pandoc.utils.stringify(person.name.family) .. '",\n'
        end
        if not is_empty(person.name.given) then
          res = res .. '      "given":"' .. pandoc.utils.stringify(person.name.given) .. '"\n    }\n'
        end
      end
      return res
    end

--[[initialise]]
    if is_empty(meta.flandersqmd.cover) then
      z = ''
    else
      y = pandoc.utils.stringify(meta.flandersqmd.cover)
      y = y:match("(.+)%..*")
      z = '<img src="' .. y .. '.png">'
    end
    z = z .. '<div id="title-block-header" class="quarto-title-block default">'

--[[add title]]
    z = z .. '<div class="quarto-title">'
    if is_empty(meta.flandersqmd.title) then
      z = z .. '<h1 class = "missing">!!! Missing flandersqmd.title !!!</h1>'
    else
      z = z .. '<h1 class="title">' .. pandoc.utils.stringify(meta.flandersqmd.title) .. '</h1>'
    end

--[[add subtitle]]
    if not is_empty(meta.flandersqmd.subtitle) then
      z = z .. '<h2 class="subtitle">' .. pandoc.utils.stringify(meta.flandersqmd.subtitle) .. '</h2>'
    end
    z = z .. '</div>'

--[[add authors]]
    z = z .. '<div class="quarto-title-meta">' .. '<div>' ..
    '<div class="quarto-title-meta-heading">' .. meta.translation.author ..
    '</div>' .. '<div class="quarto-title-meta-contents">'
    if is_empty(meta.flandersqmd.author) then
      z = z .. '<h1 class = "missing">!!! Missing flandersqmd.author !!!</h1>'
    else
      for i, person in pairs(meta.flandersqmd.author) do
        z = z .. display_person(person, i, 'author')
      end
    end
    z = z .. '</div>' .. '</div>'

--[[add reviewer]]
    if tonumber(pandoc.utils.stringify(meta.displaycolophon)) > 0 then
      if not is_empty(meta.flandersqmd.reviewer) then
        z = z .. '<div>' .. '<div class="quarto-title-meta-heading">' ..
          meta.translation.reviewer .. '</div>' ..
          '<div class="quarto-title-meta-contents">'
        for i, person in pairs(meta.flandersqmd.reviewer) do
          z = z .. display_person(person, i, 'reviewer')
        end
        z = z .. '</div>' .. '</div>'
      end

  --[ insert DOI]
      if tonumber(pandoc.utils.stringify(meta.public)) > 0 then
        z = z .. '<div>' .. '<div class="quarto-title-meta-heading">DOI</div>' ..
          '<div class="quarto-title-meta-contents" class="doi">'
        if is_empty(meta.flandersqmd.doi) then
          z = z .. '<h1 class = "missing">!!! Missing flandersqmd.doi !!!</h1>'
        else
          local x = pandoc.utils.stringify(meta.flandersqmd.doi)
          z = z .. '<a href="https://doi.org/' .. x .. '">' .. x .. '</a>'
        end
        z = z .. '</div>'.. '</div>'
      end

  --[ insert year]
    if not is_empty(meta.flandersqmd.year) then
      z = z .. '<div>' .. '<div class="quarto-title-meta-heading">' ..
        meta.translation.year .. '</div>' ..
        '<div class="quarto-title-meta-contents">' .. '<p class="date">' ..
        pandoc.utils.stringify(meta.flandersqmd.year) .. '</div>' .. '</div>'
    end

  --[ insert ordernumber]
    if not is_empty(meta.flandersqmd.ordernr) then
      z = z .. '<div>' .. '<div class="quarto-title-meta-heading">' ..
        meta.translation.ordernr .. '</div>' ..
        '<div class="quarto-title-meta-contents">' .. '<p>' ..
        pandoc.utils.stringify(meta.flandersqmd.ordernr) .. '</div>'.. '</div>'
    end

  --[ insert depotnumber]
    if tonumber(pandoc.utils.stringify(meta.public)) > 0 and  not is_empty(meta.flandersqmd.depotnr) then
      z = z .. '<div>' .. '<div class="quarto-title-meta-heading">' ..
        meta.translation.depotnr .. '</div>' ..
        '<div class="quarto-title-meta-contents">' .. '<p>' ..
        pandoc.utils.stringify(meta.flandersqmd.depotnr) .. '</div>'.. '</div>'
    end


  --[ insert issn]
    if tonumber(pandoc.utils.stringify(meta.public)) > 0 and not is_empty(meta.translation.issn_nr) then
      z = z .. '<div>' .. '<div class="quarto-title-meta-heading">ISSN</div>' ..
        '<div class="quarto-title-meta-contents">' ..
        meta.translation.issn_nr .. '</div>'.. '</div>'
    end

  --[ insert vu]
    if not is_empty(meta.translation.vu_name) then
      z = z .. '<div>' .. '<div class="quarto-title-meta-heading">' ..
        meta.translation.vu .. '</div>' ..
        '<div class="quarto-title-meta-contents">' .. '<p>' ..
        meta.translation.vu_name .. '</div>'.. '</div>'
    end

  --[[end meta]]
      z = z .. '</div>'

  --[ insert mission]
    if not is_empty(meta.translation.mission) then
      z = z .. '<div class="quarto-title-meta-contents">' ..
        meta.translation.mission .. '</div>'
    end

  --[ insert address]
    if not is_empty(meta.translation.address) then
      z = z .. '<div>' .. '<div class="quarto-title-meta-heading">' ..
        meta.translation.location .. '</div>' ..
        '<div class="quarto-title-meta-contents">' .. meta.translation.address
      if not is_empty(meta.translation.url) then
        z = z .. ' <a href = "' .. meta.translation.url .. '">'
        if is_empty(meta.translation.url_text) then
          z = z .. meta.translation.url .. '</a>'
        else
          z = z .. meta.translation.url_text .. '</a>'
        end
      end
      z = z .. '</div>'
    end

  --[ insert citation]
    z = z .. '<div class="quarto-title-meta-heading">' ..
      meta.translation.citation .. '</div>' ..
      '<div class="quarto-title-meta-contents">'
      if is_empty(meta.flandersqmd.author) then
        z = z .. '<h1 class = "missing">!!! Missing flandersqmd.author !!!</h1>'
      else
        z = z .. meta.shortauthor
      end
    if is_empty(meta.flandersqmd.year) then
      z = z .. '<h1 class = "missing">!!! Missing flandersqmd.year !!!</h1>'
    else
      z = z .. ' (' .. pandoc.utils.stringify(meta.flandersqmd.year) .. ') '
    end
    if is_empty(meta.flandersqmd.title) then
      z = z .. '<h1 class = "missing">!!! Missing flandersqmd.title !!!</h1>'
    else
      z = z .. pandoc.utils.stringify(meta.flandersqmd.title) .. '. '
      if not is_empty(meta.flandersqmd.subtitle) then
        z = z .. pandoc.utils.stringify(meta.flandersqmd.subtitle) .. '. '
      end
    end
    if not is_empty(meta.translation.name) then
      if not is_empty(meta.translation.series) then
        if tonumber(pandoc.utils.stringify(meta.public)) > 0 then
          z = z .. meta.translation.series .. ' '
        else
          z = z .. meta.translation.iseries .. ' '
        end
      end
      z = z .. meta.translation.name .. ' '
    end
    if is_empty(meta.flandersqmd.year) then
      z = z .. '<h1 class = "missing">!!! Missing flandersqmd.year !!!</h1>'
    else
      z = z .. pandoc.utils.stringify(meta.flandersqmd.year)
    end
    if is_empty(meta.flandersqmd.reportnr) then
      z = z .. '<h1 class = "missing">!!! Missing flandersqmd.reportnr !!!</h1>'
    else
      z = z .. '(' .. pandoc.utils.stringify(meta.flandersqmd.reportnr) .. '). '
    end
    z = z .. meta.translation.name .. ', ' .. meta.translation.city
    if tonumber(pandoc.utils.stringify(meta.public)) > 0 then
      z = z .. '. DOI: '
      if is_empty(meta.flandersqmd.doi) then
        z = z .. '<h1 class = "missing">!!! Missing flandersqmd.doi !!!</h1>'
      else
        local x = pandoc.utils.stringify(meta.flandersqmd.doi)
        z = z .. '<a href="https://doi.org/' .. x .. '">' .. x .. '</a>'
      end
    end
    z = z .. '</div>'

    z = z .. '<div>' .. meta.translation.export ..
      '<button onclick="display_export(\'bibtex\')" class="colophon-button">BibTex</button>' ..
      '<button onclick="display_export(\'RIS\')" class="colophon-button">RIS</button>' ..
      '<button onclick="display_export(\'csl\')" class="colophon-button">CSL-JSON</button>' ..
      '<script>' .. 'function display_export(id) {' ..
      'var x = document.getElementById(id);' ..
      'if (x.style.display === "none") {' .. 'x.style.display = "block";' ..
      '} else {' .. 'x.style.display = "none";' .. '}' .. '}' .. '</script>'
    z = z .. '<pre id = "bibtex" style ="display: none;">\n' .. '@TechReport{\n'
      if is_empty(meta.flandersqmd.author) then
        z = z .. '<h1 class = "missing">!!! Missing flandersqmd.author !!!</h1>'
      else
        z = z .. '  author = {'
        for i, person in pairs(meta.flandersqmd.author) do
          z = z .. bibtex_person(person, i, 'author')
        end
        z = z .. '}\n'
      end
      if not is_empty(meta.translation.title) then
        z = z .. '  title = {' .. meta.translation.title .. '.'
        if not is_empty(meta.translation.substitle) then
          z = z .. '  ' .. meta.translation.subtitle .. '.},\n'
        end
        z = z .. '},\n'
      end
      if not is_empty(meta.translation.name) then
        z = z .. '  institution = {' .. meta.translation.name .. '},\n'
      end
      if not is_empty(meta.translation.address) then
        z = z .. '  address = {' .. meta.translation.address .. '},\n'
      end
      if is_empty(meta.flandersqmd.year) then
        z = z .. '<h1 class = "missing">!!! Missing flandersqmd.year !!!</h1>'
      else
        y = pandoc.utils.stringify(meta.flandersqmd.year)
        z = z .. '  year = {' .. y .. '},\n'
        if is_empty(meta.flandersqmd.reportnr) then
          z = z .. '<h1 class = "missing">!!! Missing flandersqmd.reportnr !!!</h1>'
        else
          x = pandoc.utils.stringify(meta.flandersqmd.reportnr)
          z = z .. '  number = {' .. y .. '(' .. x .. ')},\n'
        end
      end
      if tonumber(pandoc.utils.stringify(meta.public)) > 0 then
        if is_empty(meta.flandersqmd.doi) then
          z = z .. '<h1 class = "missing">!!! Missing flandersqmd.doi !!!</h1>'
        else
          local x = pandoc.utils.stringify(meta.flandersqmd.doi)
          z = z .. '  doi = {' .. x .. '},\n'
        end
      end
      z = z .. '  type = {techreport}\n' .. '}' .. '</pre>\n'
      z = z .. '<pre id = "RIS" style ="display: none;">\n' .. 'TY  - RPRT\n'
      if is_empty(meta.flandersqmd.author) then
        z = z .. '<h1 class = "missing">!!! Missing flandersqmd.author !!!</h1>'
      else
        for i, person in pairs(meta.flandersqmd.author) do
          z = z .. ris_person(person, i, 'author')
        end
      end
      if not is_empty(meta.translation.title) then
        z = z .. 'TI  - ' .. meta.translation.title .. '.'
        if not is_empty(meta.translation.substitle) then
          z = z .. '  ' .. meta.translation.subtitle .. '.\n'
        end
        z = z .. '},\n'
      end
      if tonumber(pandoc.utils.stringify(meta.public)) > 0 and not is_empty(meta.flandersqmd.doi) then
        local x = pandoc.utils.stringify(meta.flandersqmd.doi)
        z = z .. 'DO  - ' .. x .. '\n'
      end
      if not is_empty(meta.translation.name) then
        z = z .. 'PB  - ' .. meta.translation.name .. '\n'
      end
      if not is_empty(meta.translation.address) then
        z = z .. 'PP  - ' .. meta.translation.address .. '\n'
      end
      if not is_empty(meta.flandersqmd.year) then
        local x = pandoc.utils.stringify(meta.flandersqmd.year)
        z = z .. 'PY  - ' .. x .. '\n'
      end
      if tonumber(pandoc.utils.stringify(meta.public)) > 0 and not is_empty(meta.translation.issn) then
        z = z .. 'SN  - ' .. meta.translation.issn .. '\n'
      end
      z = z .. 'ER  -\n' .. '</pre>'

      z = z .. '<pre id = "csl" style ="display: none;">\n' .. '{\n' ..
        '  "type":"report",\n'
      if not is_empty(meta.translation.title) then
        z = z .. '  "title":"' .. meta.translation.title .. '.'
        if not is_empty(meta.translation.substitle) then
          z = z .. '  ' .. meta.translation.subtitle .. '.\n'
        end
        z = z .. '"",\n'
      end
      if not is_empty(meta.flandersqmd.author) then
        z = z .. '  "author":[\n'
        for i, person in pairs(meta.flandersqmd.author) do
          z = z .. json_person(person, i, 'author')
        end
        z = z .. '  ]\n'
      end
      if not is_empty(meta.flandersqmd.year) then
        y = pandoc.utils.stringify(meta.flandersqmd.year)
        z = z .. '  "issued":{"date-parts":[[' .. y .. ']]},\n'
      end
      if not is_empty(meta.translation.name) then
        z = z .. '  "publisher":" "' .. meta.translation.name .. '",\n'
      end
      if not is_empty(meta.translation.address) then
        z = z .. '  "publisher-place":"' .. meta.translation.address .. '",\n'
      end
      z = z .. '}\n' .. '</pre>'
    end

    z = z .. '</div>'
    if not is_empty(meta.flandersqmd.cover) then
      z = z .. '<div>' .. '<div class="quarto-title-meta-heading">' ..
        meta.translation.coverdescription .. '</div>'
      if is_empty(meta.flandersqmd.coverdescription) then
        z = z .. '<h1 class="missing">!!! Missing flandersqmd.cover-description !!!</h1>'
      else
        y = pandoc.utils.stringify(meta.flandersqmd.coverdescription)
        z = z .. '<div class="quarto-title-meta-contents">' .. y .. '</div>'
      end
      z = z .. '</div>'
    end
    if not is_empty(meta.flandersqmd.client) then
      z = z .. '<div>' .. '<div class="quarto-title-meta-heading">' ..
        meta.translation.client .. '</div>' ..
        '<div class="quarto-title-meta-contents">'
      for i, client in pairs(meta.flandersqmd.client) do
        z = z .. pandoc.utils.stringify(client) .. '<br>'
      end
      if not is_empty(meta.flandersqmd.clientlogo) then
        z = z .. '<img src="' ..
          pandoc.utils.stringify(meta.flandersqmd.clientlogo) .. '" class="client">'
      end
      z = z .. '</div>' .. '</div>'
    end
    if not is_empty(meta.flandersqmd.cooperation) then
      z = z .. '<div>' .. '<div class="quarto-title-meta-heading">' ..
        meta.translation.cooperation .. '</div>' ..
        '<div class="quarto-title-meta-contents">'
      for i, cooperation in pairs(meta.flandersqmd.cooperation) do
        z = z .. pandoc.utils.stringify(cooperation) .. '<br>'
      end
      if not is_empty(meta.flandersqmd.cooperationlogo) then
        z = z .. '<img src="' ..
          pandoc.utils.stringify(meta.flandersqmd.cooperationlogo) .. '" class="client">'
      end
      z = z .. '</div>' .. '</div>'
    end

    if not is_empty(meta.watermark) then
      z = z .. '<div id="watermark">' .. meta.watermark .. '</div>'
    end

--[[finalise]]
    z = z .. '</div>'

    return pandoc.RawInline("html", z)
  end
}
