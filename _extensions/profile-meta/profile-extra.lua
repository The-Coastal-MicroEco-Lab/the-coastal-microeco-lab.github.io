
-- Append custom YAML fields to the bottom of profile pages.

local reserved = {}
for _, key in ipairs({
  "title", "subtitle", "status", "role", "role-type",
  "current-position", "image", "bio", "education",
  "interests", "links", "publication-names", "order",
  "author", "date", "description", "format", "execute",
  "filters", "shortcodes", "toc", "draft", "categories",
  "aliases", "bibliography", "csl", "lang", "editor",
  "page-layout", "freeze", "resources",
  "include-in-header", "include-before-body",
  "include-after-body"
}) do
  reserved[key] = true
end

local function sorted_keys(tbl)
  local keys = {}
  for key in pairs(tbl) do
    keys[#keys + 1] = key
  end
  table.sort(keys)
  return keys
end

local function render(value)
  local kind = pandoc.utils.type(value)

  if kind == "Inlines" then
    return #value > 0 and {pandoc.Para(value)} or {}

  elseif kind == "Blocks" then
    return value

  elseif kind == "List" then
    local items = {}
    for _, item in ipairs(value) do
      local blocks = render(item)
      if #blocks > 0 then
        items[#items + 1] = blocks
      end
    end
    return #items > 0 and {pandoc.BulletList(items)} or {}

  elseif type(value) == "table" then
    local blocks = {}
    for _, key in ipairs(sorted_keys(value)) do
      local child = render(value[key])
      if #child > 0 then
        blocks[#blocks + 1] =
          pandoc.Para({pandoc.Strong({pandoc.Str(key)})})
        for _, block in ipairs(child) do
          blocks[#blocks + 1] = block
        end
      end
    end
    return blocks
  end

  local plain = pandoc.utils.stringify(value)
  return plain ~= "" and
    {pandoc.Para({pandoc.Str(plain)})} or {}
end

function Pandoc(doc)
  -- Only run on profiles.
  if not (doc.meta.status and doc.meta["role-type"]) then
    return doc
  end

  local extra = {}
  for key in pairs(doc.meta) do
    if not reserved[key] and not key:match("^quarto%-") then
      extra[#extra + 1] = key
    end
  end

  table.sort(extra)

  for _, key in ipairs(extra) do
    local blocks = render(doc.meta[key])

    if #blocks > 0 then
      local label = key:gsub("[-_]", " ")
        :gsub("(%a)([%w']*)", function(first, rest)
          return first:upper() .. rest
        end)

      doc.blocks:insert(pandoc.Header(2, label))

      for _, block in ipairs(blocks) do
        doc.blocks:insert(block)
      end
    end
  end

  return doc
end
