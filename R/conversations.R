
#' Lists all channels in a Slack team.
#' 
#' Lists all channels in a Slack team.
#' 
#' @param token Authentication token bearing required scopes. Tokens should be passed as an HTTP Authorization header or alternatively, as a POST parameter.
#' @param limit The maximum number of items to return. Fewer than the requested number of items may be returned, even if the end of the list hasn't been reached. Must be an integer no larger than 1000.
#' @param types Mix and match channel types by providing a comma-separated list of any combination of public_channel, private_channel, mpim, im.
#' @param return_response Whether or not to return the API call response as opposed to the response body. Defaults to FALSE (return response body)
#' @return A list of channels
#' @seealso \url{https://api.slack.com/methods/conversations.list}
#' @family Conversations
#' @export
conversations_list <- function(token = Sys.getenv("SLACK_TOKEN"), limit = 100, types = 'public_channel,private_channel,mpim,im', return_response = F){
  
  query <- list(types = types, limit = limit)
  
  response <- httr::GET('https://slack.com/api/conversations.list', query = query,  httr::add_headers(Authorization = glue::glue('Bearer {token}')))
  
  if(return_response) return(response)
  
  body <- httr::content(response)
  
  if(!body$ok){
    stop(body$error)
  }
  
  body
}

#' Fetches a conversation's history of messages and events.
#'
#' @param token Authentication token bearing required scopes. Tokens should be passed as an HTTP Authorization header or alternatively, as a POST parameter.
#' @param channel Conversation ID to fetch history for.
#' @param cursor Paginate through collections of data by setting the cursor parameter to a next_cursor attribute returned by a previous request's response_metadata. Default value fetches the first "page" of the collection. See pagination for more detail.
#' @param inclusive Include messages with latest or oldest timestamp in results only when either timestamp is specified. Default: 0
#' @param latest End of time range of messages to include in results. Default is the current time.
#' @param limit The maximum number of items to return. Fewer than the requested number of items may be returned, even if the end of the users list hasn't been reached. Default: 100
#' @param oldest Start of time range of messages to include in results. Default: 0
#' @param return_response Whether or not to return the API call response as opposed to the response body. Defaults to FALSE (return response body)
#' 
#' @section Details:
#' Information about required scopes 
#' This  Conversations API  method's required scopes depend on the type of channel-like object you're working with. To use the method, you'll need at least one of the  channels: ,  groups: ,  im:  or  mpim:  scopes corresponding to the conversation type you're working with.
#' Present arguments as parameters in  application/x-www-form-urlencoded  querystring or POST body. This method does not currently accept  application/json .
#'
#' @seealso \url{https://api.slack.com/methods/conversations.history}
#'
#' @export
conversations_history <- function(token = Sys.getenv("SLACK_TOKEN"), channel, cursor = NULL, inclusive = NULL, latest = NULL, limit = NULL, oldest = NULL, return_response = F){
  
  params <- as.list(environment())
  
  query <- params[!names(params) %in% c('token', 'return_response')]
  
  response <- httr::GET('https://slack.com/api/conversations.history', query = query, httr::add_headers(Authorization = glue::glue('Bearer {token}')))
  
  if(return_response) return(response)
  
  body <- httr::content(response)
  
  if(!body$ok){
    stop(body$error)
  }
  
  body
}


#' Opens or resumes a direct message or multi-person direct message.
#'
#' @param token Authentication token bearing required scopes. Tokens should be passed as an HTTP Authorization header or alternatively, as a POST parameter.
#' @param channel Resume a conversation by supplying an im or mpim's ID. Or provide the users field instead.
#' @param return_im Boolean, indicates you want the full IM channel definition in the response.
#' @param users Comma separated lists of users. If only one user is included, this creates a 1:1 DM. The ordering of the users is preserved whenever a multi-person direct message is returned. Supply a channel when not supplying users.
#' @section Details:
#' This method supports application/json via HTTP POST. Present your token in your request's Authorization header. Learn more.
#'
#' @export
conversations_open <- function(token = Sys.getenv("SLACK_TOKEN"), channel = NULL, return_im = NULL, users = NULL, return_response = F){
  
  body <- as.list(environment()) %>% purrr::list_modify(token = purrr::zap(), return_response = purrr::zap()) %>% purrr::compact()
  
  response <- httr::POST('https://slack.com/api/conversations.open', body = body, encode = 'json', httr::content_type_json(), httr::add_headers(Authorization = glue::glue('Bearer {token}')))
  
  if(return_response) return(response)
  
  body <- httr::content(response)
  
  if(!body$ok){
    stop(body$error)
  }
  
  body
}



#' Sends a message to a channel.
#'
#' @param token Authentication token bearing required scopes. Tokens should be passed as an HTTP Authorization header or alternatively, as a POST parameter.
#' @param channel Channel, private group, or IM channel to send message to. Can be an encoded ID, or a name. See below for more details.
#' @param as_user Pass true to post the message as the authed user, instead of as a bot. Defaults to false. See authorship below.
#' @param message A message object.
#' @param attachments A JSON-based array of structured attachments, presented as a URL-encoded string.
#' @param blocks A JSON-based array of structured blocks, presented as a URL-encoded string.
#' @param container_id 
#' @param file_annotation 
#' @param icon_emoji Emoji to use as the icon for this message. Overrides icon_url. Must be used in conjunction with as_user set to false, otherwise ignored. See authorship below.
#' @param icon_url URL to an image to use as the icon for this message. Must be used in conjunction with as_user set to false, otherwise ignored. See authorship below.
#' @param link_names Find and link channel names and usernames.
#' @param mrkdwn Disable Slack markup parsing by setting to false. Enabled by default. Default: true
#' @param parse Change how messages are treated. Defaults to none. See below.
#' @param reply_broadcast Used in conjunction with thread_ts and indicates whether reply should be made visible to everyone in the channel or conversation. Defaults to false.
#' @param text How this field works and whether it is required depends on other fields you use in your API call. See below for more detail.
#' @param thread_ts Provide another message's ts value to make this message a reply. Avoid using a reply's ts value; use its parent instead.
#' @param unfurl_links Pass true to enable unfurling of primarily text-based content.
#' @param unfurl_media Pass false to disable unfurling of media content.
#' @param username Set your bot's user name. Must be used in conjunction with as_user set to false, otherwise ignored. See authorship below.
#' @param return_response Whether or not to return the API call response as opposed to the response body. Defaults to FALSE (return response body)
#' @section Details:
#' This method supports application/json via HTTP POST. Present your token in your request's Authorization header. Learn more.
#'
#' @export
post_message <- function(token = Sys.getenv("SLACK_TOKEN"), channel, message = NULL, as_user = NULL, attachments = NULL, blocks = NULL, icon_emoji = NULL, icon_url = NULL, link_names = NULL, mrkdwn = NULL, parse = NULL, reply_broadcast = NULL, text = NULL, thread_ts = NULL, unfurl_links = NULL, unfurl_media = NULL, username = NULL, return_response = F){
  
  if(!is.null(message)){
    body <- message
    body$channel <- channel
  }else{
    body <- as.list(environment()) %>% purrr::list_modify(token = purrr::zap(), return_response = purrr::zap()) %>% purrr::compact()
  }
  
  response <- httr::POST('https://slack.com/api/chat.postMessage', body = body, encode = 'json', httr::content_type_json(), httr::add_headers(Authorization = glue::glue('Bearer {token}')))
  
  if(return_response) return(response)
  
  body <- httr::content(response)
  
  if(!body$ok){
    stop(body$error)
  }
  
  body
}

