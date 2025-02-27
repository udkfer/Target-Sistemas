-- 4) Dado o valor de faturamento mensal de uma distribuidora, detalhado por estado:
-- •	SP – R$67.836,43
-- •	RJ – R$36.678,66
-- •	MG – R$29.229,88
-- •	ES – R$27.165,48
-- •	Outros – R$19.849,53
--
-- Escreva um programa na linguagem que desejar onde calcule o percentual de representação que cada estado teve dentro do valor total mensal da distribuidora.  

local faturamento_estados = {
  SP = 67836.43,
  RJ = 36678.66,
  MG = 29229.88,
  ES = 27165.48,
  Outros = 19849.53
}

local faturamento_total = 0
for _, valor in pairs(faturamento_estados) do
  faturamento_total = faturamento_total + valor
end

local percentuais = {}
for estado, valor in pairs(faturamento_estados) do
  local percentual = (valor / faturamento_total) * 100
  table.insert(percentuais, { estado = estado, percentual = percentual })
end

table.sort(percentuais, function(a, b) return a.percentual > b.percentual end)

print("Percentual de representação por estado:")
for _, item in ipairs(percentuais) do
  print(item.estado .. ": " .. string.format("%.2f", item.percentual) .. "%")
end
