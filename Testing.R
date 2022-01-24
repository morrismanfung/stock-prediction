setwd( 'C:\\Users\\User\\Documents\\DataSciencePortfolio\\Stock\\TSLA')

df_raw = read.csv( 'TSLA.csv')


df = data.frame( t( c( df_raw[1:20, 'Close'], df_raw[1:20, 'Volume'], df_raw[ 21, 'Close'])))
price_header = NULL
for ( i in 1:20){
  price_header = c( price_header, sprintf( 'P%d', i))
}
vol_header = NULL
for ( i in 1:20){
  vol_header = c( vol_header, sprintf( 'V%d', i))
}

colnames( df) <- c( price_header, vol_header, 'target(P21)')

for ( i in seq( 2, 2893)){
  new_row = t( c( df_raw[ i:(i+19), 'Close'], df_raw[ i:(i+19), 'Volume'], df_raw[ (i+20), 'Close']))
  colnames( new_row) = colnames( df)
  df = rbind( df, new_row)
}

nrow( df_raw)   
data.frame( t( c( df_raw[ i:i+19, 'Close'], df_raw[ i:i+19, 'Volume'])))

write.csv( df, file = 'TSLA_p.csv', row.names = FALSE)
