# highlightHTML

## v 0.2.0
- A few last updates based on JOSS reviewer feedback.
- Added a manual table entry example in README to show the CSS id insertion directly.
- Added check for `table_id_inject` function to check that arguments are the same length. Added unit tests for these as well.

## v 0.1.4
- Updated based on JOSS reviewer feedback.
- Significantly modified README and also clarified vignette to reflect what is believed to be most typical workflow. This is specifically moving from Rmd to HTML.
- Enhanced documentation for many functions to provide clarity in inputs and types of inputs that are allowed.
- Added `num_digits` argument to `table_id_inject` function to allow for control over number of decimals of numeric columns in summary tables.
- Attempted to incorporate more useful unit testing.
- Removed `update_css` argument from `highlight_html` master function. This was designed more as an internal function and likely would always be desired.
- Adjusted internal function names for easier debugging in the future
- Added error handling within `rgb2hex` function. Also fixed `&` to `&&` in a few instances.


## v 0.1.3
- Update to include example of 'Rmd' to 'HTML' directly.
- Updated JOSS paper submission.

## v 0.1.2
- Fix bug when multiple matches were passed to `table_id_inject` function. See issue #4 on GitHub for more details.

## v 0.1.1
- Inclusion of render function built into highlight_html function to compile .Rmd and .md function
- Addition of table_id_inject function to conditionally insert tags into R tables.

## v 0.1
- Initial Release

