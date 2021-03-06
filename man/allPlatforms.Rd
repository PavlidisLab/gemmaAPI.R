% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ep_platform.R
\name{allPlatforms}
\alias{allPlatforms}
\title{All platforms}
\usage{
allPlatforms(
  platforms = NULL,
  filter = NULL,
  offset = 0,
  limit = 20,
  sort = "+id",
  file = NULL,
  return = TRUE,
  overwrite = FALSE,
  memoised = FALSE
)
}
\arguments{
\item{platforms}{A list of identifiers (e.g: GPL96,GPL1355,GPL1261). 
Identifiers can either be the Platform ID or its short name. 

 Retrieval by ID is more efficient. 

Only platforms that user has access to will be available. 

Do not combine different identifiers in one query.}

\item{filter}{Filtering can be done on any* property of a supported type or nested property that the ExpressionExperiment class has ( and is mapped by hibernate ). E.g: 'curationDetails' or 'curationDetails.lastTroubledEvent.date'
Currently supported types are:
\itemize{
    \item String - property of String type, required value can be any String.
    \item Number - any Number implementation. Required value must be a string parseable to the specific Number type.
    \item Boolean - required value will be parsed to true only if the string matches 'true', ignoring case.
}    
Accepted operator keywords are:
\itemize{
    \item '=' - equality
    \item '!=' - non-equality
    \item '<' - smaller than
    \item '=>' - larger or equal
    \item 'like' similar string, effectively means 'contains', translates to the sql 'LIKE' operator (given value will be surrounded by % signs)
}
Multiple filters can be chained using 'AND' or 'OR' keywords.

Leave space between the keywords and the previous/next word! 

E.g: ?filter=property1 < value1 AND property2 like value2

If chained filters are mixed conjunctions and disjunctions, the query must be in conjunctive normal form (CNF). Parentheses are not necessary - every AND keyword separates blocks of disjunctions.
Example:

?filter=p1 = v1 OR p1 != v2 AND p2 <= v2 AND p3 > v3 OR p3 < v4

Above query will translate to: 

(p1 = v1 OR p1 != v2) AND (p2 <= v2) AND (p3 > v3 OR p3 < v4;)

Breaking the CNF results in an error.

Filter "curationDetails.troubled" will be ignored if user is not an administrator.}

\item{offset}{Integer. Optional parameter (defaults to 0) skips the specified amount of datasets when retrieving them from the database.}

\item{limit}{Integer. Optional parameter (defaults to 20) limits the result to specified amount of datasets. Use 0 for no limit.}

\item{sort}{Character. Optional parameter (defaults to +id) sets the ordering property
and direction. Format is [+,-][property name]. E.g. "-accession" will
translate to descending ordering by the Accession property. Note that this
does not guarantee the order of the returned entities. Nested properties
are also supported (recursively). 

E.g:
+curationDetails.lastTroubledEvent.date}

\item{file}{Character. File path. If provided, response will be saved to file}

\item{return}{Logical. If the response should be returned. Set to false when
you only want to save a file}

\item{overwrite}{Logical. If TRUE, existing files will be overwritten. If FALSE
a warning will be thrown and no action is taken.}

\item{memoised}{Logical. If TRUE a memoised version of the function will be
used which is faster for repeated requests. Use \code{\link{forgetGemmaMemoised}}
to clear memory.}
}
\value{
List of lists containing platform object.
}
\description{
List all platforms
}
\examples{
\donttest{
allPlatforms()
allPlatforms(c('GPL1355','GPL570'))
}
# return all platforms it is slower and prone to connection interruptions
# alternative is to loop using offset and limit
\dontrun{
allPlatforms(limit = 0)
}
}
