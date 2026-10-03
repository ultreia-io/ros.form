#' Read one versioned ROS form
#'
#' @param name Workbook name: `"ll"` for longline or `"ps"` for purse seine.
#' @param version Exact ROS data-model version, default [ROS_FORM_VERSION].
#' @return A validated `form_model` object from [model.form::read_form_model()].
#' @details Resources use `<name>-form.yaml` in an explicit version directory.
#'   No latest-version fallback, file search, database, or network is used.
#'
#'   Workbook forms consume matrices or data frames that retain physical
#'   worksheet positions. Data starts at row 6; META uses fixed coordinates.
#'
#'   Use [model.form::form_fields()] and [model.form::form_sheets()] to inspect
#'   the declarations.
#' @examples
#' model <- ros_form("ll")
#' model.form::form_metadata(model)
#' names(model.form::form_sheets(model))
#' @export
ros_form <- function(name, version = ROS_FORM_VERSION) {
  if (!is.character(name) || length(name) != 1L || is.na(name) || !name %in% ROS_FORMS) {
    stop("Unknown ROS form name; choose one of: ", paste(ROS_FORMS, collapse = ", "), ".",
         call. = FALSE)
  }
  if (!is.character(version) || length(version) != 1L || is.na(version) || version != ROS_FORM_VERSION) {
    stop("Unsupported ROS data-model version; available version: ", ROS_FORM_VERSION, ".",
         call. = FALSE)
  }
  path <- system.file("models", version, paste0(name, "-form.yaml"),
                      package = "ros.form", mustWork = TRUE)
  model.form::read_form_model(path)
}
