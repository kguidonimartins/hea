https://gist.github.com/arthurattwell/4219720913b8c0066e65eb300fc31790#replace-single-line-breaks-keeping-empty-lines

# Useful regex during manuscript cleanup

*   [Copy-paste to split book into separate chapter files](#copy-paste-to-split-book-into-separate-chapter-files)
*   [Fix inline spans broken by a space after a word before the closing `*`](#fix-inline-spans-broken-by-a-space-after-a-word-before-the-closing-)
*   [Remove image width and height inherited from images in docx](#remove-image-width-and-height-inherited-from-images-in-docx)
*   [Wrap all images in an Electric Book figure blockquote](#wrap-all-images-in-an-electric-book-figure-blockquote)
*   [Simplify indentation in lists by reducing space after list marker to one space](#simplify-indentation-in-lists-by-reducing-space-after-list-marker-to-one-space)
*   [Remove non-kramdown markdown `^` around superscripts after numbers](#remove-non-kramdown-markdown--around-superscripts-after-numbers)
*   [Wrap the opening words of a paragraph in a span](#wrap-the-opening-words-of-a-paragraph-in-a-span)
*   [Find an email address](#find-an-email-address)
*   [Find URLs](#find-urls)
*   [Replace single line breaks, keeping empty lines](#replace-single-line-breaks-keeping-empty-lines)
*   [Replace `##Close-up double-hash headings###` with `## kramdown headings`](#replace-close-up-double-hash-headings-with--kramdown-headings)
*   [Find double quotes inside double quotes in Liquid tag parameters](#find-double-quotes-inside-double-quotes-in-liquid-tag-parameters)
*   [Replace named HTML entities with numeric entities](#replace-named-html-entities-with-numeric-entities)

My usual process for moving a book manuscript from Word to kramdown involves:

1. Convert Word to markdown using Pandoc. To make this easy, I use [this batch script](https://gist.github.com/arthurattwell/44713ec1a870c075eb5e8d7c3ef600ee) in Windows.
2. Run a series of regex search-and-replaces. These vary from job to job, to suit the book. This document lists common ones. I use Sublime Text for this, but these should work in most good text editors (e.g. Atom, Brackets).
3. Manually fix and improve the markdown referring visually to the source Word document. This takes a human, because many authors use formatting for semantic purposes and that formatting doesn't convert to markdown.

In each example below, the first line is *find*, the second line *replace* (unless replace should be blank to delete content).

**Never use these to replace-all in a long manuscript in one automated step. They are for quickly moving through a manuscript, where you visually confirm every replace.**

## Copy-paste to split book into separate chapter files

I usually do this at the end, once I've cleaned up the markdown for a whole book in one file. First I make sure I've put YAML frontmatter markers – two lines of `---` – at the start of every file-to-be. It doesn't matter if they contain YAML or not.

```
(?s)^(---)$.+?^(---)$.+?(?=^---$)
```

Explanation:

* `(?s)` says this regex will match newline characters when we say 'match anything'.
* `^(---)$` matches `---` if it starts and ends a line, i.e. it's the only thing on the line.
* `.+?` matches one or more of anything else, non-greedily, i.e. until it finds what matches next.
* `^(---)$` again, matches `---` on its own on a line.
* `.+?` again, matches one or more of anything else.
* `(?=^---$)` says stop when you see three hyphens on their own line again (i.e. the next doc's frontmatter).

In short, it selects the content from one YAML frontmatter block (two lines of three hyphens, which may or may not have YAML between them) until the next YAML block begins.

So if you have a file of markdown and you want to split it into separate files, first add the two `---`s at the start of each piece of content you want in a new file, then use this regex to select it and the content, up till the next YAML block. Note it will not find the last YAML block and its content.

In Sublime Text in Windows, F3 will select the next found text. So to find and create a new file, I press: F3 > Ctrl X > Ctrl N > Ctrl V > Ctrl S [save to filename] > Ctrl W. You can get pretty quick at that, especially if you hold down Ctrl.

This will find, cut, open a new file, paste the contents, save them (prompting you for a filename), and close the new file.

Then repeat.

## Fix inline spans broken by a space after a word before the closing `*`

This regex finds a very common problem with conversion from MS Word (and other similar programs), where italics have been applied not just to a word but to the space after the word. This happens in Word when a user double-clicks a word to highlight it, before making it italic. When double-clicking a word in Word, Word also highlights the space after the word. When this converts to markdown, the markdown syntax breaks, because `*this *is broken` while `*this* is correct`.

### Single-word search

Note: this regex only finds single-word instances of this problem, not phrases. E.g. it will fix `We watched *Oliver *today`, but not `We watched *Oliver Twist *today`.

```
(\*+[\w!"\#$%&'()+,\-./:;<=>?@\[\\\]^_`{|}~]+)(\s+)(\*+)
\1\3\2
```

This regex (1) finds one or more asterisks followed by (2) any word character or punctuation (except asterisks), followed by (3) one or more spaces, followed by (4) one or more asterisks. The replace simply switches the space and the final asterisks.

### Phrase search

This regex is more powerful and finds the same problem but in words or phrases. We haven't tested it a lot, so don't use it for global replaces: eyeball every change it makes.

```
((?<=\s)|(?<=^))(\*+[\w !"\#$%&'()+,\-./:;<=>?@\[\\\]^_`{|}~]+)(\s+)(\*+)
\2\4\3
```

This regex works the same way as single-word search, except that it allows spaces in the matching phrase, and looks for the presence of either a beginning of line or another space before the first asterisk.

## Remove image width and height inherited from images in docx

```
\{width.+?\}
\n
```

## Wrap all images in an Electric Book figure blockquote

```
\n(!.+)
\n> \1\n{:.figure}\n
```

## Simplify indentation in lists by reducing space after list marker to one space

```
\n-\s+
\n-
```

Note the space at the end of the replace expression.

## Remove non-kramdown markdown `^` around superscripts after numbers

```
(\d)\^(th|nd|st|rd)\^
\1\2
```

Note: afterwards, do a manual search for `^`, because if in the docx source a following character was mistakenly made superscript, too (e.g. `3^rd)^`), this regex won't find it.

## Wrap the opening words of a paragraph in a span

This particular regex finds the first five words of a paragraph and wraps them in a `strong` span with a kramdown class attribute of `myclass` (i.e. `<strong class="myclass">`).

It looks for a line break, then a word, then three words preceded by a space. Then the replace wraps that all in double asterisks with a kramdown inline attribute.

To change the number of words it selects, change the `3` in braces, near the end of the regex. It should be one less than the number of words you want to select.

The replace regex is simple enough to edit. E.g. change to one asterisk for an `em` span, and of course change `yourclass` to the class you need.

**Remember to turn on the 'Preserve case' option in your editor before using this**

```
\n([\w’‘!"\#$%&'()+,\-./:;<=>?@\[\\\]^_`{|}~]+)((\s[\w’‘!"\#$%&'()+,\-./:;<=>?@\[\\\]^_`{|}~…]+){3})
\n**\1\2**{:.yourclass}
```

## Find an email address

[See this post for details](http://www.regular-expressions.info/email.html):

```
\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b
```

## Find URLs

URLs are really hard to find. [This gist from John Gruber](https://gist.github.com/gruber/8891611) is your best best.

You can use it to quickly move through a text, replacing where necessary with markdown links, e.g. usng a replace like `\[\1\](http://\1)`.

## Replace single line breaks, keeping empty lines

[This post explains](http://stackoverflow.com/questions/10464735/remove-single-line-breaks-keep-empty-lines):

```
(\S.*?)\R(.*?\S)
$1 $2
```

## Replace `##Close-up double-hash headings###` with `## kramdown headings`

This finds, at the start of a line, one or more hashes, then a string (hopefully heading text), then another string of hashe before a line ending. It replaces it with the same number of hashes at the start, a space before the heading text, and no trailing hashes.

```
\n([#]+)([^#]+)([#]+)\n
\n\1 \2\n
```

## Find double quotes inside double quotes in Liquid tag parameters

E.g. you may need to debug Liquid tags like `{% include figure markdown="This is a "figure"" %}`

```
\n*\s*\w+=".+".+"
```

## Replace named HTML entities with numeric entities

EPUB3 does not allow named HTML entities (e.g. `&nbsp;`), only numeric ones (`&#160;`). That's a pity because named entities are easier for humans to remember. Where kramdown converts markdown to HTML, kramdown by default replaces both entities with actual unicode characters. But kramdown doesn't reach into block-level elements in HTML islands (actual HTML code inside your markdown file), unless you add the attribute `markdown="1"` to the element's tag.

In tables, this is a PITA, because you'd have to add `markdown="1"` to every `<td>` that contained a named entity (you can't apply the attribute to the parent `<table>`) and hope that processing its content as markdown won't have unexpected side effects.

The sensible solution is to just replace named entities in tables with numeric entities. This most often happens with `&nbsp;` and `&shy;`. Here is the regex for that. This will find every table with an `&nbsp` in it and replace it with the numeric equivalent.

Note that this will replace only the first `&nbsp;` in each table. If a table has more than one `&nbsp` in it, you will have to run this find-and-replace again for each one.

```
(?s)(<table((?!</?table>).)*)&nbsp;(((?!</?table>).)*</table>)
```

```
\1&#160;\3
```

You can use the same strings for, say `&shy;` if you:

1. replace `&nbsp;` with `&shy;` in the find string
2. replace `&#160;` with `&#173;` in the replace string.
