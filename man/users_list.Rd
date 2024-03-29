% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/users.R
\name{users_list}
\alias{users_list}
\title{Lists all users in a Slack team.}
\usage{
users_list(token = Sys.getenv("SLACK_TOKEN"), limit = 100, return_response = F)
}
\arguments{
\item{token}{Authentication token bearing required scopes. Tokens should be passed as an HTTP Authorization header or alternatively, as a POST parameter.}

\item{limit}{The maximum number of items to return. Fewer than the requested number of items may be returned, even if the end of the list hasn't been reached. Must be an integer no larger than 1000.}

\item{return_response}{Whether or not to return the API call response as opposed to the response body. Defaults to FALSE (return response body)}
}
\value{
A list of channels
}
\description{
Lists all users in a Slack team.
}
\seealso{
\url{https://api.slack.com/methods/users.list}

Other users: 
\code{\link{users_info}()}
}
\concept{users}
