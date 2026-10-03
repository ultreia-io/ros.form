# ros.form

[![Build](https://github.com/ultreia-io/ros.form/actions/workflows/Build.yaml/badge.svg?branch=develop)](https://github.com/ultreia-io/ros.form/actions/workflows/Build.yaml?query=branch%3Adevelop)
[![Test](https://github.com/ultreia-io/ros.form/actions/workflows/Test.yaml/badge.svg?branch=develop)](https://github.com/ultreia-io/ros.form/actions/workflows/Test.yaml?query=branch%3Adevelop)
[![Website](https://img.shields.io/badge/website-documentation-blue)](https://ultreia-io.github.io/ros.form/)
[![Coverage reports](https://img.shields.io/badge/coverage-CI_reports-blue)](https://github.com/ultreia-io/ros.form/actions/workflows/Test.yaml?query=branch%3Adevelop)
[![Latest release](https://img.shields.io/github/v/release/ultreia-io/ros.form?display_name=tag&sort=semver)](https://github.com/ultreia-io/ros.form/releases/latest)
[![License](https://img.shields.io/github/license/ultreia-io/ros.form)](https://github.com/ultreia-io/ros.form/blob/develop/LICENSE)
[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)

Versioned IOTC Regional Observer Scheme definitions for longline (LL) and purse-seine (PS) workbooks.

## Load a form

```r
library(ros.form)
ROS_FORMS
model <- ros_form(ROS_FORM_LL)
model.form::form_metadata(model)$form
head(names(model.form::form_fields(model)))
names(model.form::form_sheets(model))
```

The form is an ordinary named list. Sheets are keyed by worksheet name, and
fields inside each sheet are keyed by their local name:

```r
names(model$sheets)
meta <- model$sheets$META
names(meta$fields)
meta$fields$form_version
```

Worksheet names retain their workbook spelling. Local field names use lowercase
snake case, and full field IDs use `<sheet>.<field>`.

For table sheets, field order is column order. META fields carry their fixed
`row` and `column` directly. A sheet's `layout` only describes its layout kind
and table start row or optional physical extents.

`ROS_FORMS` lists the supported names. `ROS_FORM_VERSION` is the model version,
currently 3.3.0.

Names and versions must match exactly. There is no automatic latest-version selection.

## Workbook layout

Models describe physical rows and columns, including fixed metadata cells and the first data row of each worksheet.

They expose field types, mandatory values, constraints, and code-list requirements through model.form.

Use `model.form::form_layout()` to inspect a sheet before supplying data.

META declares its six columns and cell locations. Its row extent follows those cells, with extra rows allowed.

Fields declared `Date` keep calendar-date semantics.

The package describes workbooks; it does not read Excel files or change their values.

## YAML resources

Installed definitions are `ll-form.yaml` and `ps-form.yaml` under `models/3.3.0/`.

Cell fields use A1 locations, such as `location: E3`; each sheet lists its layout before its fields.

`required_field: power_value` names the companion field whose presence requires this value.

The condition requires a value when triggered; it does not forbid one when the companion field is empty.

```r
system.file("models", "3.3.0", "ll-form.yaml", package = "ros.form")
```

## Load during development

Use the same commands in PyCharm or RStudio. Start from the directory containing
the four package projects:

```r
setwd("/home/tchemit/projects/iotc/github/ultreia-io")

pkgload::load_all("model.form")
pkgload::load_all("ros.form")

ROS_FORMS
model <- ros_form(ROS_FORM_LL)
```

To load the complete validation stack in a fresh R session:

```r
pkgload::load_all("model.form")
pkgload::load_all("model.validation")
pkgload::load_all("ros.form")
pkgload::load_all("ros.validation")
```

After changing only `ros.form`, rerun `pkgload::load_all("ros.form")`.

After changing `model.form`, restart R and load the required packages again in dependency order.

## Package checks

Use the standard R package commands from the package directory:

```sh
mkdir -p build
(cd build && R CMD build --no-manual ..)
R CMD check --no-manual --output=build build/ros.form_0.1.0.tar.gz
Rscript tools/build-site.R
```

Install `model.form` and the development dependencies first.

Archives and check results go under `build/`. Documentation and coverage go under `docs/`.

The package uses GPL-3.
