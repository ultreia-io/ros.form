test_that("each supported workbook loads with its declared identity and fields", {
  counts <- c(ll = 310L, ps = 234L)
  for (name in names(counts)) {
    model <- ros_form(name)
    metadata <- model.form::form_metadata(model)
    expect_identical(metadata$form$id, name)
    expect_identical(metadata$form$version, "3.3.0")
    expect_length(model.form::form_fields(model), counts[[name]])
    expect_null(model.form::form_layout(model, "META")$row_count)
  }
  expect_setequal(getNamespaceExports("ros.form"),
                  c("ros_form", "ROS_FORM_LL", "ROS_FORM_PS", "ROS_FORMS",
                    "ROS_FORM_VERSION"))
  expect_length(list.files(system.file("models", "3.3.0", package = "ros.form")), 2L)
  expect_identical(system.file("catalogue", package = "ros.form"), "")
})

test_that("public constants describe the supported resources", {
  expect_identical(ROS_FORM_LL, "ll")
  expect_identical(ROS_FORM_PS, "ps")
  expect_identical(ROS_FORMS, c("ll", "ps"))
  expect_identical(ROS_FORM_VERSION, "3.3.0")
})

test_that("workbook coordinates and explicitly stricter checks are preserved", {
  ll <- ros_form("ll")
  meta <- ll$sheets$META
  expect_equal(model.form::form_field(ll, "META.form_version")$row, 5L)
  expect_equal(model.form::form_field(ll, "META.form_version")$column, 5L)
  observer <- ll$sheets[["O-INFO"]]
  expect_equal(observer$layout$start_row, 6L)
  expect_length(observer$fields, 25L)
  bait <- model.form::form_field(ros_form("ll"), "E-SET-BAITS.setting_operations_baits_details_bait_percentage")
  expect_true(bait$mandatory)
  ps <- ros_form("ps")
  expect_false(any(c("T-EVENTS", "T-PRODUCTS") %in% names(ps$sheets)))
})

test_that("names and versions are exact and never search outside resources", {
  expect_error(ros_form("LL"), "Unknown ROS form")
  expect_error(ros_form("../ll"), "Unknown ROS form")
  expect_error(ros_form(c("ll", "ps")), "Unknown ROS form")
  expect_error(ros_form("ll", "latest"), "Unsupported ROS")
  expect_error(ros_form("ll", NA_character_), "Unsupported ROS")
  expect_error(ros_form("ros-meta"), "Unknown ROS form")
})
