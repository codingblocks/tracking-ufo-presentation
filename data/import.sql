DROP TABLE IF EXISTS bitcoin_prices;
CREATE TABLE bitcoin_prices (
  date date,
  open decimal,
  high decimal,
  low decimal,
  close decimal,
  volume decimal,
  cap decimal
);
