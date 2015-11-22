Base Erlang dockerfile
======================

### Get Started

```
make
```

```
docker run --rm -it efcasado/erlang-base:<version> erl
```

where `<version>` is the Erlang/OTP version you want to use (e.g.
R16, 17.5, 18.0, ...).


### Supported Erlang/OTP Versions

| Erlang/OTP Version | Docker Tag           |
|:------------------:|:--------------------:|
| 18.1               | erlang-base:18.1     |
| 18.0               | erlang-base:18.0     |
| 17.5               | erlang-base:17.5     |
| 17.1               | erlang-base:17.1     |
| R16B03-1           | erlang-base:R16B03-1 |
| R15B03             | erlang-base:R15B03   |


### Ports

| Port Number | Protocol | Description                                                  |
|:-----------:|:--------:|--------------------------------------------------------------|
| 4369        | TCP      | [EPMD](http://www.erlang.org/doc/man/epmd.html)              |


### Author(s)

- Enrique Fernandez `<enrique.fernandez@erlang-solutions.com>`


> The MIT License (MIT)
>
> Copyright (c) 2015 Enrique Fernandez
>
> Permission is hereby granted, free of charge, to any person obtaining a copy
> of this software and associated documentation files (the "Software"), to deal
> in the Software without restriction, including without limitation the rights
> to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> copies of the Software, and to permit persons to whom the Software is
> furnished to do so, subject to the following conditions:
>
> The above copyright notice and this permission notice shall be included in
> all copies or substantial portions of the Software.
>
> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> THE SOFTWARE.