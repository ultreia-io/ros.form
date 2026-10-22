# Developing ros.form.model

`develop` is the integration branch. `main` contains releases. Implementation branches use `feature/`.

From the `ros.form.model` directory, with `form.model` checked out alongside it:

```r
pkgload::load_all("../form.model")
pkgload::load_all(".")
```

Use the example in the README to inspect a form.

## Local verification

Install the package dependencies and development tools, including `roxygen2`, first.

Run roxygen before building. Commit changes to `NAMESPACE`; generated `man/` files remain ignored.

```sh
Rscript -e 'roxygen2::roxygenise()'
mkdir -p build
(cd build && R CMD build --no-manual ..)
package_version=$(Rscript -e 'cat(read.dcf("DESCRIPTION")[1, "Version"])')
R CMD check --no-manual --output=build "build/ros.form.model_${package_version}.tar.gz"
Rscript tools/build-site.R
```

Archives and check results go under `build/`. Documentation goes under `docs/`.

## Release

1. **Prepare the release on `develop`:**

   1. **Prepare the release files:** update the version in `DESCRIPTION`, finalize `NEWS.md` and documentation.
   2. **Perform the [local checks](#local-verification).**
   3. **Commit the changes:** use `[ros.form.model] Release <version>`.
   4. **Push the release commit.**

2. **Start the release on GitHub:**

   1. Open **Actions → Start Release**.
   2. Click **Run workflow**, select `develop`, then click **Run workflow** to confirm.
   3. Open the release PR created by the workflow.

3. **Merge the release PR:**

   1. **Wait for the checks:** all checks on the release PR must be green.
   2. **Merge:** click **Merge pull request**, then **Confirm merge**.

**Publish Release** publishes the package, checksum and documentation automatically.
