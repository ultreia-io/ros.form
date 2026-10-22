#' Supported ROS workbook forms
#'
#' `ROS_FORM_LL` and `ROS_FORM_PS` are the form identifiers accepted by
#' [`ros_form()`][ros.form.model::ros_form]. `ROS_FORMS` lists both identifiers, and
#' `ROS_FORM_VERSIONS` lists the explicitly selectable versions.
#' `ROS_FORM_VERSION_3_3_0`, `ROS_FORM_VERSION_4_0_0`, and
#' `ROS_FORM_VERSION_4_1_0` name each supported version; none is a default.
#'
#' @format Character constants.
#' @examples
#' ROS_FORM_LL
#' ROS_FORM_PS
#' ROS_FORMS
#' ROS_FORM_VERSIONS
#' ros_form(name = ROS_FORM_LL, version = ROS_FORM_VERSION_4_0_0)
#' @name ros_form_constants
NULL

#' @rdname ros_form_constants
#' @export
ROS_FORM_LL <- "ll"

#' @rdname ros_form_constants
#' @export
ROS_FORM_PS <- "ps"

#' @rdname ros_form_constants
#' @export
ROS_FORMS <- c(ROS_FORM_LL, ROS_FORM_PS)

#' @rdname ros_form_constants
#' @export
ROS_FORM_VERSION_3_3_0 <- "3.3.0"

#' @rdname ros_form_constants
#' @export
ROS_FORM_VERSION_4_0_0 <- "4.0.0"

#' @rdname ros_form_constants
#' @export
ROS_FORM_VERSION_4_1_0 <- "4.1.0"

#' @rdname ros_form_constants
#' @export
ROS_FORM_VERSIONS <- c(
  ROS_FORM_VERSION_3_3_0,
  ROS_FORM_VERSION_4_0_0,
  ROS_FORM_VERSION_4_1_0
)
