# Developing ros.form.model

From the `ros.form.model` directory, with `model.form` checked out alongside it:

```r
pkgload::load_all("../model.form")
pkgload::load_all(".")
```

Use the example in the README to inspect a form.

For package checks, install `model.form` and the development dependencies, including `roxygen2`, first.

Run roxygen before building. Commit changes to `NAMESPACE`; generated `man/` files remain ignored.

```sh
Rscript -e 'roxygen2::roxygenise()'
mkdir -p build
(cd build && R CMD build --no-manual ..)
R CMD check --no-manual --output=build build/ros.form.model_0.1.0.tar.gz
Rscript tools/build-site.R
```

Archives and check results go under `build/`. Documentation goes under `docs/`.
