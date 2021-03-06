% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/block_elements.R
\name{checkbox_element}
\alias{checkbox_element}
\title{Checkbox Group}
\usage{
checkbox_element(action_id, options, initial_options = NULL, confirm = NULL)
}
\arguments{
\item{action_id}{An identifier for the action triggered when the checkbox group is changed. You can use this when you receive an interaction payload to \href{https://api.slack.com/interactivity/handling#payloads}{identify the source of the action}. Should be unique among all other action_ids in the containing block. Maximum length for this field is 255 characters.}

\item{options}{A list of \code{\link{option_object}}s. A maximum of 10 options are allowed.}

\item{initial_options}{A list of \code{\link{option_object}}s that exactly matches one or more of the options within options. These options will be selected when the checkbox group initially loads.}

\item{confirm}{A \code{\link{confirm_object}} that defines an optional confirmation dialog that appears after clicking one of the checkboxes in this element.}
}
\description{
A checkbox group that allows a user to choose multiple items from a list of possible options. Checkboxes are only supported in the following app surfaces: Home tabs, Modals, and Messages. To use interactive components, you will need to make some changes to prepare your app. Read our \href{https://api.slack.com/interactivity/handling}{guide to enabling interactivity}. Works with block types: Section Actions Input
}
\seealso{
\url{https://api.slack.com/reference/block-kit/block-elements#checkboxes}

Other Elements: 
\code{\link{button_element}()},
\code{\link{channels_multi_select_menu}()},
\code{\link{channels_select_menu}()},
\code{\link{conversations_multi_select_menu}()},
\code{\link{conversations_select_menu}()},
\code{\link{datepicker_element}()},
\code{\link{external_multi_select_menu}()},
\code{\link{external_select_menu}()},
\code{\link{image_element}()},
\code{\link{overflow_menu_element}()},
\code{\link{plain_text_input_element}()},
\code{\link{radio_button_group_element}()},
\code{\link{static_multi_select_menu}()},
\code{\link{static_select_menu}()},
\code{\link{timepicker_element}()},
\code{\link{users_multi_select_menu}()},
\code{\link{users_select_menu}()}
}
\concept{Elements}
