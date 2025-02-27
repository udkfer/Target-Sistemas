-- 3) Dado um vetor que guarda o valor de faturamento diário de uma distribuidora, faça um programa, na linguagem que desejar, que calcule e retorne:
-- • O menor valor de faturamento ocorrido em um dia do mês;
-- • O maior valor de faturamento ocorrido em um dia do mês;
-- • Número de dias no mês em que o valor de faturamento diário foi superior à média mensal.
--
-- IMPORTANTE:
-- a) Usar o json ou xml disponível como fonte dos dados do faturamento mensal;
-- b) Podem existir dias sem faturamento, como nos finais de semana e feriados. Estes dias devem ser ignorados no cálculo da média;

local json = require("dkjson")
local file = io.open("dados.json", "r")
local content = file:read("*a")
file:close()
local faturamento = json.decode(content)
local menor_valor = math.huge
local maior_valor = -math.huge
local soma = 0
local dias_com_faturamento = 0

for _, dia in ipairs(faturamento) do
  local valor = dia.valor
  if valor > 0 then
    if valor < menor_valor then
      menor_valor = valor
    end
    if valor > maior_valor then
      maior_valor = valor
    end
    soma = soma + valor
    dias_com_faturamento = dias_com_faturamento + 1
  end
end

local media = soma / dias_com_faturamento
local dias_acima_da_media = 0
for _, dia in ipairs(faturamento) do
  if dia.valor > media then
    dias_acima_da_media = dias_acima_da_media + 1
  end
end

print("Menor faturamento diário:", menor_valor)
print("Maior faturamento diário:", maior_valor)
print("Número de dias com faturamento acima da média:", dias_acima_da_media)
