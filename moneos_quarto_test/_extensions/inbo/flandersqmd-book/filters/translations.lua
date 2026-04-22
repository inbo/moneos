function is_empty(s)
  return s == nil or s == ''
end

function translation_entity(result, lang, entity)
  if (entity == "INBO") then
    result.titlelogo = "inbo-logo.pdf"
    if (lang == "nl-BE") then
      result.address = "INBO Brussel, Herman Teirlinckgebouw, Havenlaan 88 bus 73, 1000 Brussel"
      result.city = "Brussel"
      result.mission = "Het INBO is het onderzoeksinstituut van de Vlaamse overheid dat via onafhankelijk toegepast wetenschappelijk onderzoek, data- en kennisontsluiting het biodiversiteitsbeleid en -beheer onderbouwt en evalueert."
      result.name = "Instituut voor Natuur- en Bosonderzoek"
      result.tagline = "vlaanderen-wetenschap.pdf"
      result.url = "https://www.vlaanderen.be/inbo"
      result.url_text = "vlaanderen.be/inbo"
    elseif (lang == "fr-FR") then
      result.address = "INBO Bruxelles, Herman Teirlinckgebouw, Avenu du Port 88 boîte 73, 1000 Bruxelles"
      result.city = "Bruxelles"
      result.mission = "L'Institut de Recherche sur la Nature et les Forêts (« Instituut voor Natuur- en Bosonderzoek », INBO) est un institut de recherche du gouvernement flamand qui étaye et évalue la politique et la gestion en matière de biodiversité par le biais de la recherche scientifique appliquée indépendante et par l'intégration et la dissémination publique des données et des connaissances."
      result.name = "l'Institut de Recherche sur la Nature et les Forêts"
      result.tagline = "flanders-state-art.pdf"
      result.url = "https://www.vlaanderen.be/inbo/en-gb/homepage/"
      result.url_text = "vlaanderen.be/inbo"
    else
      result.address = "INBO Brussels, Herman Teirlinckgebouw, Havenlaan 88 bus 73, 1000 Brussels"
      result.city = "Brussels"
      result.mission = "The Research Institute for Nature and Forest (INBO) is a research institute of the Flemish government. Through independent applied scientific research, open data and knowledge, integration and disclosure, it underpins and evaluates biodiversity policy and management."
      result.name = "Research Institute for Nature and Forest"
      result.tagline = "flanders-state-art.pdf"
      result.url = "https://www.vlaanderen.be/inbo/en-gb/homepage/"
      result.url_text = "vlaanderen.be/inbo"
    end
    result.email = "info@inbo.be"
    result.issn_nr = "1782-9054"
    result.vu_name = "Hilde Eggermont"
  else
    result.address = '<h1 class = "missing">!!! flandersqmd.entity must be equal to INBO. Please contact the maintainer if you need a different entity!!!</h1>'
    result.city = '<h1 class = "missing">!!! flandersqmd.entity must be equal to INBO. Please contact the maintainer if you need a different entity!!!</h1>'
    result.mission = '<h1 class = "missing">!!! flandersqmd.entity must be equal to INBO. Please contact the maintainer if you need a different entity!!!</h1>'
    result.name = '<h1 class = "missing">!!! flandersqmd.entity must be equal to INBO. Please contact the maintainer if you need a different entity!!!</h1>'
    result.tagline = "flanders-state-art.pdf"
    result.url = ''
    result.url_text = '<h1 class = "missing">!!! flandersqmd.entity must be equal to INBO. Please contact the maintainer if you need a different entity!!!</h1>'
    result.issn_nr = "!!!flandersqmd.entity must be equal to INBO. Please contact the maintainer if you need a different entity!!!"
    result.vu_name = "!!!flandersqmd.entity must be equal to INBO. Please contact the maintainer if you need a different entity!!!"
  end
  return result
end

function translation(lang, entity)
  local result
  if (lang == "nl-BE") then
    result = {
      author = "Geschreven door",
      author_pdf = "Auteurs",
      ccby = "Dit werk valt onder een \\href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons Naamsvermelding 4.0 Internationaal-licentie}.",
      citation = "Wijze van citeren",
      client = "Dit onderzoek werd uitgevoerd in opdracht van",
      cooperation = "Dit onderzoek werd uitgevoerd in samenwerking met",
      country = "België",
      coverdescription = "Foto cover",
      depotnr = "Depotnummer",
      export = "Exporteer referentie als",
      iseries = "Interne rapporten van het",
      location = "Vestiging",
      mission = "Hier komt de missie",
      ordernr = "Opdrachtnummer",
      reviewer = "Nagelezen door",
      reviewer_pdf = "Reviewers",
      series = "Rapporten van het",
      vu = "Verantwoordelijke uitgever",
      year = "Gepubliceerd in"
    }
  elseif (lang == "fr-FR") then
    result = {
      author = "Écrit par",
      author_pdf = "Auteurs",
      ccby = "Ce rapport est sous licence \\href{https://creativecommons.org/licenses/by/4.0/deed.fr}{Creative Commons Attribution 4.0 International}.",
      citation = "Citation recommandée",
      client = "Cette étude a été commandée par",
      cooperation = "Cette étude a été menée en collaboration avec",
      country = "Belgique",
      coverdescription = "Photo de couverture",
      depotnr = "Numéro de dépôt",
      export = "Exporter la référence à",
      iseries = "Rapports internes de",
      location = "Adresse",
      mission = "Mission statement",
      ordernr = "Numéro de commande",
      reviewer = "Examiné par",
      reviewer_pdf = "Reviewers",
      series = "Rapports de",
      vu = "Éditeur responsable",
      year = "Publié en"
    }
  else
    result = {
      author = "Written by",
      author_pdf = "Authors",
      ccby = "This work is licensed under a \\href{https://creativecommons.org/licenses/by/4.0/}{Creative Commons Attribution 4.0 Generic License}.",
      citation = "Way of quoting",
      client = "This study was commissioned by",
      cooperation = "This study was conducted in collaboration with",
      country = "Belgium",
      coverdescription = "Cover photo",
      depotnr = "Deposit number",
      export = "Export reference to",
      iseries = "Internal reports of the",
      location = "Location",
      mission = "Misson statement",
      ordernr = "Order number",
      reviewer = "Reviewed by",
      reviewer_pdf = "Reviewers",
      series = "Reports of the",
      vu = "Responsible publisher",
      year = "Published during"
    }
  end
  return translation_entity(result, lang, entity)
end

function abbreviate_person(person, i, type, n)
  if i == 1 then
    res = ''
  else
    if i == n then
      res = ' & '
    else
      res = ', '
    end
  end
  if is_empty(person.name) then
    res = res .. '<h1 class = "missing">!!! flandersqmd.' .. type ..' element ' .. i .. ' has no name element!!!</h1>'
  else
    if is_empty(person.name.family) then
      res = res .. '<h1 class = "missing">!!! flandersqmd.' .. type .. ' element ' .. i .. ' name element has no family element!!!</h1>'
    else
      res = res .. ' ' .. pandoc.utils.stringify(person.name.family)
    end
    if is_empty(person.name.given) then
      res = res .. '<h1 class = "missing">!!! flandersqmd.' .. type .. ' element ' .. i .. ' name element has no given element!!!</h1>'
    else
      local x = pandoc.utils.stringify(person.name.given)
      res = res .. ', ' .. string.gsub(x, '([A-Z])[a-zàçéèïîôö]*', '%1.')
    end
  end
  return res
end

function shortauthor(author)
  if is_empty(author) then
    return '!!! Missing flandersqmd.author !!!'
  end
  n = 0
  for i, person in pairs(author) do
    n = i
  end
  z = ''
  for i, person in pairs(author) do
    z = z .. abbreviate_person(person, i, 'author', n)
  end
  return z
end

function levelcss (entity)
  local css
  css = ':root {'
  if (entity == "inbo") then
    css = css .. '  --navbar-background: #356196;'
    css = css .. '  --navbar-text-color: #FFFFFF;'
    css = css .. '  --navbar-hover-color: #BDDDD7;'
    css = css .. '  --heading-color: #356196;'
    css = css .. '  --text-color: #595959;'
    css = css .. '  --link-color: #C04384;'
    css = css .. '  --missing-color: #C63526;'
  else
    css = css .. '  --navbar-background: #FFED00;'
    css = css .. '  --navbar-text-color: #333332;'
    css = css .. '  --navbar-hover-color: #004099;'
    css = css .. '  --heading-color: #333332;'
    css = css .. '  --text-color: #000000;'
    css = css .. '  --link-color: #0055CC;'
    css = css .. '  --missing-color: #FF0000;'
  end
  css = css .. '  --callout-tip-color: #729BB7;'
  css = css .. '  --callout-tip-background: #729BB744;'
  css = css .. '  --callout-caution-color: #EF972C;'
  css = css .. '  --callout-caution-background: #EF972C44;'
  css = css .. '  --callout-warning-color: #FFCD34;'
  css = css .. '  --callout-warning-background: #FFCD3444;'
  css = css .. '  --callout-important-color: #BE3254;'
  css = css .. '  --callout-important-background: #BE325444;'
  css = css .. '  --code-error-border: #BE3254;'
  css = css .. '  --code-error-background: #BE325444;'
  css = css .. '  --code-warning-border: #EF972C;'
  css = css .. '  --code-warning-background: #EF972C44;'
  css = css .. '  --code-argument: #EF972C;'
  css = css .. '  --code-comment: #282A72;'
  css = css .. '  --code-function: #356196;'
  css = css .. '  --code-logical: #C63526;'
  css = css .. '  --code-number: #C63526;'
  css = css .. '  --code-string: #006635;'
  css = css .. '  --code-background: #F3F3F3;'
  css = css .. '  --code-border: #8E9DA7;'
  css = css .. '  --callout-note-color: #282A72;'
  css = css .. '  --callout-note-background: #282A7244;'
  css = css .. '}'
  return css
end

function is_final(flandersqmd)
  return not (is_empty(flandersqmd.title) or is_empty(flandersqmd.author) or is_empty(flandersqmd.year) or is_empty(flandersqmd.reviewer) or is_empty(flandersqmd.reportnr)) and (not flandersqmd.public_report or (not (is_empty(flandersqmd.doi) or is_empty(flandersqmd.depotnr))))
end

function watermark(lang, flandersqmd)
  local result = ""
  if not is_empty(flandersqmd.watermark) then
    result = pandoc.utils.stringify(flandersqmd.watermark)
  end
  if is_final(flandersqmd) then
    return result
  end
  if (lang == "nl-BE") then
    result = "ONTWERP " .. result
  elseif (lang == "fr-FR") then
    result = "CONCEPTION " .. result
  else
    result = "DRAFT " .. result
  end
  return result
end

return {
  {
    Meta = function(meta)
      if is_empty(meta.flandersqmd.entity) then
        meta.translation = translation(
          pandoc.utils.stringify(meta.lang), "INBO"
        )
      else
        meta.translation = translation(
          pandoc.utils.stringify(meta.lang),
          pandoc.utils.stringify(meta.flandersqmd.entity)
        )
      end
      if pandoc.utils.stringify(meta.lang) ~= 'nl-BE' or is_empty(meta.flandersqmd.level) or tonumber(pandoc.utils.stringify(meta.flandersqmd.level)) < 2 then
        meta.entitycolours = 'flanders'
      else
        meta.titlelogo = meta.translation.titlelogo
        if is_empty(meta.flandersqmd.entity) then
          meta.entitycolours = 'inbo'
        else
          meta.entitycolours = pandoc.text.lower(pandoc.utils.stringify(meta.flandersqmd.entity))
        end
      end
      meta.entitycss = levelcss(meta.entitycolours)
      meta.watermark = watermark(pandoc.utils.stringify(meta.lang), meta.flandersqmd)
      meta.shortauthor = shortauthor(meta.flandersqmd.author)
      meta.ccby = pandoc.RawInline("latex", meta.translation.ccby)
      if not is_final(meta.flandersqmd) or (not is_empty(meta.flandersqmd.linenr) and meta.flandersqmd.linenr) then
        meta.displaylinenr = 1
      end
      if is_empty(meta.flandersqmd.doi) then
        if not is_empty(meta.flandersqmd.reportnr) then
          meta.displaycolophon = 1
        else
          if not is_empty(meta.flandersqmd.colophon) and meta.flandersqmd.colophon then
            meta.displaycolophon = 1
          else
            meta.displaycolophon = 0
          end
        end
        if is_empty(meta.flandersqmd.public_report) or meta.flandersqmd.public_report then
          meta.public = 1
        else
          meta.public = 0
        end
      else
        meta.displaycolophon = 1
        meta.public = 1
      end
      return meta
    end
  }
}
