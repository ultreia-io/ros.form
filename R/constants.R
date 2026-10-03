#' Supported ROS workbook forms
#'
#' `ROS_FORM_LL` and `ROS_FORM_PS` are the form identifiers accepted by
#' [ros_form()]. `ROS_FORMS` lists both identifiers, and
#' `ROS_FORM_VERSION` is the supported form-model version.
#'
#' @format Character constants.
#' @examples
#' ROS_FORM_LL
#' ROS_FORM_PS
#' ROS_FORMS
#' ROS_FORM_VERSION
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
ROS_FORM_VERSION <- "3.3.0"
