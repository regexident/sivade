# Sivade

Native Singular Value Decomposition (SVD) without dependencies.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sivade'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sivade
    
## Usage

Sivade adds three methods to `Matrix`:

```ruby
class Matrix
  def svd_decompose(dimensions = nil)
  def self.svd_recompose(u, s, v)
  def svd_reduce(dimensions)
end
```

### Decompose matrix:

```ruby
dimensions = 2
(u, s, v) = matrix.svd_decompose(dimensions)
```

### Recompose matrix:

```ruby
matrix = Matrix.svd_recompose(u, s, v)
```

### Reduce matrix dimensionality:

```ruby
dimensions = 2
matrix = matrix.svd_reduce(dimensions)
```

## Contributing

1. Fork it ([https://github.com/regexident/sivade/fork](https://github.com/regexident/sivade/fork))
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
