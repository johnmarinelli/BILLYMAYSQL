# Sqlize

awesome gr8 command line utility to transform ur lowercase sql kerywords to glorious uppercase WOOO

```sh
# works on files
cat my_sucky.sql
# => "update script set keywords = upper(keywords)"

sqlize my_sucky.sql
# => "UPDATE script SET keywords = UPPER(keywords)"

# wokrs on inline strings 2 oh shit
sqlize -c "select name from products where price < 20.00;"
# => SELECT name FROM products WHERE price < 20.00;

# may asw ell toss ur caps lock out the widnow
sqlize my_sucky.sql > my_cool.sql
```


## Installation
quit playin!!! `gem install sqlize` 

## Development
test ur shit

## Contributing
john.marinelli@paypal.com
__IMPORTANT!!__ *i only accept payments in increments of 100$*

## Hype
"SOME more sweet ass shit FROM john marinelli" - ice cube
"this shit is teh best omg" - curtis '50 cent' jackson

## License
watever
