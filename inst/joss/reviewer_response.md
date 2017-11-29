Review Response
-----------

Thanks @daattali for the thoughtful comments and suggestions. In general the following aspects have been adjusted in view of your comments. The README has been significantly adjusted to better reflect the purpose of the package and more typical use cases. The vignette has also been expanded to discuss the `table_id_inject` function in more detail and the source of the input file is shown. Lastly, the code has been adjusted to help improve debugging (i.e. more informative names internally, `&` changed to `&&` where relevant). More specifics are given below in each of these three areas.

## README

- First 6 bullets are related and bundled here. In general the README has been reworked significantly. The introduction to the package has been clarified and expanded slightly to better discuss what I view is a typical use of the package. Some of this has been borrowed from the paper.md JOSS submission. The trivial example has been replaced with a more typical workflow from Rmd to HTML directly with the functions in the package, this is shown in the section "Simple Example of Package Workflow". In the example, I show the raw input Rmd file, the look of the intermediate markdown table with included CSS ids, and then the final code step to compile the document into an HTML. Finally, a screenshot is included to show the look of the final output. I also attempted to change "table" in a few places to "summary table" to reflect the type of table that I feel should be passed to the `table_id_inject` function. I'd be interested in feedback on whether this is both easier to read and offers a more compelling use/workflow for the package.
- Added line to README about installation of devtools package.
- Fixed `library(hightlightHTML)` typo.
- The example with `bgtable.html` was removed as this was a contrived example, primarily for testing. A newer example from Rmd to HTML was created to reflect the most useful use case for the package. This file is called `joss.Rmd`.
- `update_css = FALSE` is used internally and as such has been removed from the master `highlight_html` function, instead just passed internally to the two `highlight_html_cells` and `highlight_html_text` functions. Discussion of this argument has also been removed from the README and vignette.
- Great suggestion on not overwriting input file. This has been remedied to include a message if the output file location is not specified and the output is then "<input>_out.html". The file path of the generated output file is included in the printed message.
- Updated package DESCRIPTION to better reflect package goals and maintain consistency with README documentation.

## Vignette

- The GitHub tagline has been edited as well as the README to better reflect the scope of the package and typical use case.
- More time in vignette is given to the `table_id_inject` function. 
- Similar to the README, the raw input file is shown for the typical example.

## Code

- Adjusted tests. This is an area I have commonly struggled with implementation. I believe the tests are a bit more helpful to help distinguish whether specific features are working. I am now testing whether the CSS tags and ids are found within the output document. I'm open to any additional tests you think about be useful here.
- Internal names were replaced to more descriptive names to help improve debugging in the future. Very useful suggestion.
- Adjusted `rgb2hex` function documentation to reflect named vs unnamed list specification.
- Added error handling to catch double NULL case for `rgb2hex` function.
- Switched code where relevant to `&&` instead of `&`. I wasn't aware of the difference actually. Thanks for pointing this out.
- Attempted to clarify the input for the `table_id_inject` function to: A summary table object, most commonly will be a data.frame, but can also be a count table using the `table` function. Let me know if this is more clear.
- `conditions`: additional examples are given and added documentation within the details section to operations that are allowed and which are allowed for each type of variable (i.e. which are allowed for numeric vs categorical). 
- Note: I added a rather simple functionality to the `table_id_inject` function. This function now allows for rounding of numeric columns. A by product of the CSS id insertion is that the columns are converted to text. This makes it more difficult to round numeric values to a specific number of decimal places. This feature has been added as an optional argument to the `table_id_inject` function called `num_digits`. This argument takes a single numeric integer that is passed to the `round` function within R.
