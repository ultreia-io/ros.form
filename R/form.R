#' Read one versioned ROS form
#'
#' @param name Workbook name: `ROS_FORM_LL` (longline) or `ROS_FORM_PS` (purse seine).
#' @param version Required exact ROS data-model version; no default is selected.
#' @return A validated `form_model` object from `model.form::read_form_model()`.
#' @details Resources use `<name>-form.yaml` in an explicit version directory.
#'   No latest-version fallback, file search, database, or network is used.
#'
#'   Workbook forms consume matrices or data frames that retain physical
#'   worksheet positions. Data starts after each declared header; META uses fixed coordinates.
#'
#'   Use `model.form::form_fields()` and `model.form::form_sheets()` to inspect
#'   the declarations.
#' @seealso [model.form documentation](https://ultreia-io.github.io/model.form/)
#' @examples
#' model <- ros_form(name = ROS_FORM_LL, version = ROS_FORM_VERSION_3_3_0)
#' model.form::form_metadata(model)
#' names(model.form::form_sheets(model))
#' @export
ros_form <- function(name, version) {
  if (missing(version)) stop("Supply an explicit ROS data-model version", call. = FALSE)
  if (!is.character(name) || length(name) != 1L || is.na(name) || !name %in% ROS_FORMS) {
    stop("Unknown ROS form name; choose one of: ", paste(ROS_FORMS, collapse = ", "), ".",
         call. = FALSE)
  }
  if (!is.character(version) || length(version) != 1L || is.na(version) || !version %in% ROS_FORM_VERSIONS) {
    stop("Unsupported ROS data-model version; available versions: ", paste(ROS_FORM_VERSIONS, collapse = ", "), ".",
         call. = FALSE)
  }
  path <- system.file("models", version, paste0(name, "-form.yaml"),
                      package = "ros.form.model", mustWork = TRUE)
  model.form::read_form_model(path)
}
