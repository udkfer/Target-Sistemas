-- 5) Escreva um programa que inverta os caracteres de um string.
--
-- IMPORTANTE:
-- a) Essa string pode ser informada através de qualquer entrada de sua preferência ou pode ser previamente definida no código;
-- b) Evite usar funções prontas, como, por exemplo, reverse;

function inverter_string(str)
  local caracteres = {}

  for char in str:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
    table.insert(caracteres, 1, char)
  end

  return table.concat(caracteres)
end

-- Entrada      ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
local entrada = "subi no onibus"
local resultado = inverter_string(entrada)

print("String original: " .. entrada)
print("String invertida: " .. resultado)
