% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/block_elements.R
\name{datepicker_element}
\alias{datepicker_element}
\title{Date Picker Element}
\usage{
datepicker_element(
  action_id,
  placeholder = NULL,
  initial_date = NULL,
  confirm = NULL
)
}
\arguments{
\item{action_id}{An identifier for the action triggered when the checkbox group is changed. You can use this when you receive an interaction payload to \href{https://api.slack.com/interactivity/handling#payloads}{identify the source of the action}. Should be unique among all other action_ids in the containing block. Maximum length for this field is 255 characters.}

\item{placeholder}{A plain_text only \code{\link{text_object}} that defines the placeholder text shown on the datepicker. Maximum length for the text in this field is 150 characters.}

\item{initial_date}{The initial date that is selected when the element is loaded. This should be in the format YYYY-MM-DD.}

\item{confirm}{A \code{\link{confirm_object}} that defines an optional confirmation dialog that appears after a date is selected.}
}
\description{
An element which lets users easily select a date from a calendar style UI. To use interactive components like this, you will need to make some changes to prepare your app. Read our \href{https://api.slack.com/interactivity/handling}{guide to enabling interactivity}. Works with block types: Section Actions Input
}
\seealso{
\url{https://api.slack.com/reference/block-kit/block-elements#datepicker}

Other Elements: 
\code{\link{button_element}()},
\code{\link{channels_multi_select_menu}()},
\code{\link{channels_select_menu}()},
\code{\link{checkbox_element}()},
\code{\link{conversations_multi_select_menu}()},
\code{\link{conversations_select_menu}()},
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
