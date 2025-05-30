# WildF

[![Fortran][Fortran Badge]][Fortran Website]
[![Docs][Docs Badge]][Docs Website]
[![Test][Test Badge]][Test Workflow]
[![Coverage][Coverage Badge]][Coverage Website]
[![License][License Badge]][License File]

WildF is a [Fortran][Fortran Website] library for evaluating mathematical [Special Functions]. Just like wild creatures, Special Functions are unusual, but interesting mathematical objects that arise in many areas of applied mathematics. This library aims to serve as a support for any project that needs the computation of these rare species.

## Functions
In the following list, $x \in \mathbb{R}$ and $z \in \mathbb{C}$.

* Exponential integrals $\mathrm{Ei}(x)$ and $\mathrm{E}_1(z)$.

This list will be updated as new functions are added and tested.

## Documentation
The [API documentation][Docs Website] for this library is generated using [FORD] and is deployed and hosted on [ReadTheDocs].

## References
[[1][Book Zhang]] Shanjie Zhang, Jianming Jin. 1996. Computation of Special Functions. Wiley, New York, NY.

<!-- Links -->
<!-- Badges -->
[Fortran Website]: https://fortran-lang.org/
[Fortran Badge]: https://img.shields.io/badge/Fortran-734f96?logo=fortran&style=flat
[Docs Website]: https://wildf.readthedocs.io/
[Docs Badge]: https://img.shields.io/readthedocs/wildf?color=blue
[Test Workflow]: https://github.com/rodpcastro/wildf/actions/workflows/CI.yml
[Test Badge]: https://github.com/rodpcastro/wildf/actions/workflows/CI.yml/badge.svg
[Coverage Website]: https://app.codecov.io/gh/rodpcastro/wildf
[Coverage Badge]: https://codecov.io/github/rodpcastro/wildf/badge.svg
[License File]: https://github.com/rodpcastro/wildf/blob/main/LICENSE
[License Badge]: https://img.shields.io/badge/License-MIT-yellow
<!-- Introduction -->
[Special Functions]: https://www.britannica.com/science/special-function
<!-- Documentation -->
[FORD]: https://forddocs.readthedocs.io/
[ReadTheDocs]: https://about.readthedocs.com/
<!-- References -->
[Book Zhang]: https://search.worldcat.org/title/33971114
