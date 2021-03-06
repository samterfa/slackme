% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/layout_blocks.R
\name{section_block}
\alias{section_block}
\title{Section Block}
\usage{
section_block(text = NULL, block_id = NULL, fields = NULL, accessory = NULL)
}
\arguments{
\item{text}{The text for the block, in the form of a \code{\link{text_object}}. Maximum length for the text in this field is 3000 characters. This field is not required if a valid array of fields objects is provided instead.}

\item{block_id}{A string acting as a unique identifier for a block. If not specified, one will be generated. You can use this block_id when you receive an interaction payload to \href{https://api.slack.com/interactivity/handling#payloads}{identify the source of the action}. Maximum length for this field is 255 characters. block_id should be unique for each message and each iteration of a message. If a message is updated, use a new block_id.}

\item{fields}{Required if no text is provided. A list of \code{\link{text_objects}}. Any text objects included with fields will be rendered in a compact format that allows for 2 columns of side-by-side text. Maximum number of items is 10. Maximum length for the text in each item is 2000 characters.}

\item{accessory}{One of the available \href{https://api.slack.com/reference/messaging/block-elements}{element objects}.}
}
\description{
A section is one of the most flexible blocks available - it can be used as a simple text block, in combination with text fields, or side-by-side with any of the available \href{https://api.slack.com/reference/messaging/block-elements}{block elements}.
}
\seealso{
\url{https://api.slack.com/reference/block-kit/blocks#section}

Other Blocks: 
\code{\link{actions_block}()},
\code{\link{context_block}()},
\code{\link{divider_block}()},
\code{\link{file_block}()},
\code{\link{header_block}()},
\code{\link{image_block}()},
\code{\link{input_block}()}
}
\concept{Blocks}
