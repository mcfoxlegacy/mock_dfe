# MockDfe

Generates XML examples of different Brazilian tax documents with random data.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mock_dfe', :git => 'https://github.com/taxweb/mock_dfe.git', :branch => 'master'
```

And then execute:

    $ bundle

## Usage

```
require 'mock_dfe'
MockDfe::Nfe.render           #=> "Renders last version of NFe"
MockDfe::Nfe.render('4.00')   #=> "Renders NFe version 4.00"
```
**Currently Available Documents and versions:**
|DFe|Version|
|:---:|:---:|
|NFe  |4.00 |
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

### Todo:
- [ ] Add other DFe's and its versions (Nfe 1.00, Cte, NFSe...)
- [ ] Possibility of sending any params that will overwrite the randomly generated ones
 
\* Do NOT forget to add tests update the documentation for every new development


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/taxweb/mock_dfe.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
