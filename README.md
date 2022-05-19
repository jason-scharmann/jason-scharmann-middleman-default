# Jason's Middleman Default

This is my default [Middleman](https://middlemanapp.com/) project template.

## How to use

[Install Middleman](https://middlemanapp.com/basics/install/) and in the terminal
type:

``` sh
$ middleman init <your-project-name> -T jason-scharmann/jason-scharmann-middleman-default
```
See Middleman's documentation on [project templates](https://middlemanapp.com/advanced/project-templates/)
for more information on the use on the `-T` flag.

## Directory Structure

```
default
├── config.rb
├── data
├── Gemfile
├── Gemfile.lock
├── helpers
│   ├── fonts.rb
│   └── page_title.rb
└── source
    ├── images
    ├── index.html.erb
    ├── javascripts
    │   └── site.js
    ├── layouts
    │   ├── layout.erb
    │   └── _meta_tags.erb
    ├── products
    └── stylesheets
        ├── abstracts
        │   └── _index.scss
        ├── base
        │   ├── _index.scss
        │   └── reset.scss
        ├── components
        │   └── _index.scss
        ├── layouts
        │   └── _index.scss
        ├── site.css.scss
        ├── state
        │   └── _index.scss
        └── third_party
            └── _index.scss
```

This is a default template i created in order to start work on a non-blog
personal project static website. I have utilized several features of middleman
to configure and code the project:

- Utilized external helpers sourced in the helpers directory in project root.
- Employed a smacss-like directory heirarchy for SCSS.
- Setup an empty data directory that will be used in the project.
- Set directory indexes for extensionless filenames.

## Helper files

[Middleman Documentation - Custom Defined Helpers](https://middlemanapp.com/basics/helper-methods/#custom-defined-helpers)

```
helpers/
├── fonts.rb
└── page_title.rb
```

### GoogleFonts

The `GoogleFonts.get_fonts(str|arr|hash) => str` helper takes in a string, list
of strings, or a hash with name and weight keys that take both normal and italic
font faces in arrays, and outputs an html string used in the layout head.

Examples used interactively:

``` ruby
# irb -r "./helpers/fonts.rb"
use Fonts

GoogleFonts.get_fonts('Work Sans')
# => "<link rel='preconnect' href='https://fonts.googleapis.com'/>\n<link rel='preconnect' href='https://fonts.gstatic.com' crossorigin />\n<link href='https://fonts.googleapis.com/css2?family=Work+Sans&display=swap' rel='stylesheet' />"

GoogleFonts.get_fonts(['Work Sans', 'Montserrat'])
# => "<link rel='preconnect' href='https://fonts.googleapis.com'/>\n<link rel='preconnect' href='https://fonts.gstatic.com' crossorigin />\n<link href='https://fonts.googleapis.com/css2?family=Work+Sans&family=Montserrat&display=swap' rel='stylesheet' />"

GoogleFonts.get_fonts(
  {one: {name: "Work Sans", weights: {normal: ["300"], italic: ["300"]}},
   two: {name: "Montserrat", weights: {normal: ["500"], italic: ["400"]}}})
# => "<link rel='preconnect' href='https://fonts.googleapis.com'/>\n<link rel='preconnect' href='https://fonts.gstatic.com' crossorigin />\n<link href='https://fonts.googleapis.com/css2?family=Work+Sans:ital,wght@0,300;1,300&family=Montserrat:ital,wght@0,500;1,400&display=swap' rel='stylesheet' />"
```

Examples that would be used in `layouts/layout.erb`:

``` eruby
<%= GoogleFonts.get_fonts("Work Sans") %>
<%# OR %>
<%= GoogleFonts.get_fonts(['Work Sans', 'Montserrat']) %>
<%# OR %>
<%= GoogleFonts.get_fonts(
  {one: {name: "Work Sans", weights: {normal: ["300"], italic: ["300"]}},
   two: {name: "Montserrat", weights: {normal: ["500"], italic: ["400"]}}}) %>
```

### PageTitle

The `page_title(nil|str) => str` helper takes in either nothing or a string
and outputs a page title. In the first case, the title is return as the base
title "Document", in the second as "Title • Document", following the a
"page separator base" pattern. The title is taken in from the [frontmatter](https://middlemanapp.com/basics/frontmatter/):

``` ruby
use PageTitle

page_title() # => "Document"
page_title("About") # => "About • Document"
```

``` eruby
<title><%= page_title(current_page.data.title) %></title>
```

## SMACSS

```
stylesheets
├── abstracts
│   └── _index.scss
├── base
│   ├── _index.scss
│   └── reset.scss
├── components
│   └── _index.scss
├── layouts
│   └── _index.scss
├── site.css.scss
├── state
│   └── _index.scss
└── third_party
    └── _index.scss
```

For more information on the SMACSS CSS convention see the [SMACSS website](http://smacss.com/).
The only two things added here are:

- An abstracts directory to hold site-wide variables
- a resets file in `base/` from Andy Bell's blog for [Picalilli Ltd](https://piccalil.li/blog/a-modern-css-reset/)

Please check out these resources for why I have set up the file structure and
the reset file, respectively.

## Data Directory

For information on data files and how they can be used in templates and dynamic
routes see the [documentation on Middleman datafiles](https://middlemanapp.com/advanced/data-files/).

## Pretty URLs (Directory Indexes)

Setup with a one liner in `config.rb`:

``` ruby
activate :directory_indexes
```

For more information see the documentation on Middleman's implementation of
[directory indexes](https://middlemanapp.com/advanced/pretty-urls/).

## In Conclusion

In general, check out the [Middleman Website](https://middlemanapp.com/) for Any
and all other concerns.
