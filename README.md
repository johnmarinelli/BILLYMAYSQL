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
```

## Installation
quit playin!!! `gem install sqlize` 

## Development
test ur shit

## Contributing
john.marinelli@paypal.com
__IMPORTANT!!__ *i only accept payments in increments of 100$*

## License
watever
