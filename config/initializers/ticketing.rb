TICKETING_PRICES = {
  inteira:   1000, # R$10,00
  estudante:  500, # R$5,00
  idoso:      500, # R$5,00
  isento:       0  # terça gratuita / isenções
}.freeze

# horários operacionais (ajuste se necessário)
TICKETING_HOURS = {
  weekday_open:  "10:00", weekday_close: "16:00",
  weekend_open:  "11:00", weekend_close: "17:00",
  last_entry_min_before_close: 30
}.freeze
