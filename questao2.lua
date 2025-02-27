-- 2) Dado a sequência de Fibonacci, onde se inicia por 0 e 1 e o próximo valor sempre será a soma dos 2 valores anteriores (exemplo: 0, 1, 1, 2, 3, 5, 8, 13, 21, 34...), escreva um programa na linguagem que desejar onde, informado um número, ele calcule a sequência de Fibonacci e retorne uma mensagem avisando se o número informado pertence ou não a sequência.

function fibonacci_sequence(n)
  local sequence = { 0, 1 }
  local a, b = 0, 1

  while b <= n do
    table.insert(sequence, b)
    a, b = b, a + b
  end

  local is_fibonacci = (sequence[#sequence] == n)

  return sequence, is_fibonacci
end

print("Informe um número:")
local number_to_check = tonumber(io.read())

local sequence, is_fibonacci = fibonacci_sequence(number_to_check)

if is_fibonacci then
  print(number_to_check .. " faz parte da sequência Fibonacci.")
else
  print(number_to_check .. " não fas parte da sequência Fibonacci.")
end

print("Sequência Fibonacci até " .. number_to_check .. ": " .. table.concat(sequence, ", "))
