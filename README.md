# ros.form.model

[![Build](https://github.com/ultreia-io/ros.form.model/actions/workflows/Build.yaml/badge.svg?branch=develop)](https://github.com/ultreia-io/ros.form.model/actions/workflows/Build.yaml?query=branch%3Adevelop)
[![Website](https://img.shields.io/badge/website-documentation-blue)](https://ultreia-io.github.io/ros.form.model/)
[![Latest release](https://img.shields.io/github/v/release/ultreia-io/ros.form.model?display_name=tag&sort=semver)](https://github.com/ultreia-io/ros.form.model/releases/latest)
[![License](https://img.shields.io/github/license/ultreia-io/ros.form.model)](https://github.com/ultreia-io/ros.form.model/blob/develop/LICENSE)

Inspect IOTC Regional Observer Scheme form definitions for longline (LL) and purse seine (PS).

Use this package to find expected sheets, fields and cell locations for a particular form version.

To validate submitted Excel forms, start with [ros.form.validation](https://ultreia-io.github.io/ros.form.validation/).

## Installation

Install the latest released version:

```r
install.packages("pak") # Once
pak::pak("ultreia-io/ros.form.model@*release")
```

`pak` installs the required dependencies automatically.

For the development version:

```r
pak::pak("ultreia-io/ros.form.model@develop")
```

## Inspect a form

```r
library(ros.form.model)

model <- ros_form(name = ROS_FORM_LL, version = ROS_FORM_VERSION_3_3_0)
names(form.model::form_sheets(model))
form.model::form_fields(model, sheet = "META")
```

This displays the expected sheets and the META field definitions. It does not open a submitted Excel file.

Follow [Choose and inspect a form](https://ultreia-io.github.io/ros.form.model/articles/inspect-form.html) for gear, version and coordinate examples.

Package contributors can use the [development instructions](https://github.com/ultreia-io/ros.form.model/blob/develop/DEVELOPMENT.md).
