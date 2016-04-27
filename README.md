# ( ͡° ͜ʖ├┬┴┬ Bisani

[Crystal](http://crystal-lang.org/) implementation of Go's [Hide](https://github.com/c2h5oh/hide)

## Role
Bisani's role is to hide the actual `id` from a database, using [Modular Multiplicative Inverse](https://en.wikipedia.org/wiki/Modular_multiplicative_inverse).

## Installation


Add this to your application's `shard.yml`:

```yaml
dependencies:
  bisani:
    github: kuende/bisani
```


## Usage


```crystal
require "bisani"
```

To `obfuscate` (hide) a certain value you simply need to do this:
```crystal
##
# Random Int32 number.
# Works for Int32, Int64, UInt32, UInt64
# EXPLICIT CONVERSION MUST BE MADE!
##
x = 3_i32

# Bisani Magic
x = x.to_bis
# x will now be 206383517
```

To `deobfuscate` (revert/unhide) the value to the one it used to be:
```crystal
# Let's asume x's value is 206383517
x = Bisani.to_i32(x)
# x will now be 3
```
That's it. Pretty simple, huh?
## Development

### Notes
It currently works only on
```crystal
Int32
Int64
UInt32
UInt64
```
therefore, explicit conversion must be made:
```crystal
my_int_var.to_i32
my_int_var.to_i64
my_int_var.to_u32
my_int_var.to_u64
```

### TODO
- [ ] Accept `Int` without conversion
- [ ] Implement [Miller-Rabin primality test](https://en.wikipedia.org/wiki/Miller%E2%80%93Rabin_primality_test) for BigInt
- [ ] Accept custom prime numbers (Currently default ones)

## Contributing

1. Fork it ( https://github.com/kuende/bisani/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [dumitraand](https://github.com/dumitraand)  - creator, maintainer
