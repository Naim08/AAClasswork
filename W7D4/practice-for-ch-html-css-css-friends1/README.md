# CSS Friends, Part 1

It's time to hone your CSS skills! To get started, just download the starter
repo from the `Download Project` button at the bottom of this page.

## Phase 0: Reset

### Topics

- [Reset][reset]
- [Appearance][t-appearance]
- [Box-model]
- [Box-sizing][t-box-sizing]
- [Cursor][t-cursor]

### Screenshots

- [Screenshot A][ss-00-a]
- [Live][live-00]

Start with a clean slate by writing a reset in __./css/00-reset.css__. Some tag
selectors are already supplied to get you started. Be wise about which
properties to inherit, and which to hard-code. A tip: set the `box-sizing`
property to inherit so all elements will inherit their parents box-sizing
property, which is content-box by default.

Let's make all images `block` elements, have them expand to the full `100%`
width of their parent container, and have their height grow `auto`, which means
proportionally.

Remove the bullets from list items, strip the default styling from form input
elements by setting their appearance to `none` (see [here][appearance-info]),
and show the little pointer hand on buttons to make it obvious you can click.

[ss-00-a]:
  http://assets.aaonline.io/fullstack/html-css/micro-projects/css-friends/docs/screenshots/00-reset-a.png
[live-00]: http://appacademy.github.io/css-friends/solution/00-reset.html
[t-appearance]: http://css-tricks.com/almanac/properties/a/appearance/
[t-cursor]: https://developer.mozilla.org/en-US/docs/Web/CSS/cursor
[Box-model]: https://developer.mozilla.org/en-US/docs/Learn/CSS/Building_blocks/The_box_model#what_is_the_css_box_model
[appearance-info]: https://css-tricks.com/almanac/properties/a/appearance/
[reset]: https://meyerweb.com/eric/tools/css/reset/
[t-box-sizing]: http://appacademy.github.io/css-demos/box-sizing.html

### Before you move on

**Note:** All of your CSS files are included in the __cats.html__ file through
the use of `<link>` tags in the document's `<head>`:

```html
<head>
  <meta charset="utf-8">
  <title>App Academy Friends</title>
  <link rel="stylesheet" href="css/00-reset.css" type="text/css">
</head>
```

Phase 0's tag has already been added for you, but you'll be responsible for
adding the rest!

## Phase 1: Header

### Topics

- [Webfonts][t-webfonts]
- [Font-weight][t-font-weight]
- Block (see CSS Display reading)
- [Flex][t-flex]
- [Border][t-border]

#### Screenshots

- [Screenshot A][ss-01-a]
- [Screenshot B][ss-01-b]
- [Live][live-01]

Let's study the first _real_ set of screenshots and make a plan of attack.

Typography is always the best place to start. Pull up the specs. The first thing
you'll notice is a font family that most computers do not have installed.
Fortunately, Google provides it to us for free as a hosted webfont. Find it on
[Google Fonts][t-google-fonts], select the appropriate font-weights, and include
the provided `<link>` tag right before the other `<link>` tags in the `<head>`.

In __./css/01-header.css__ set the default font weight, family and size on the
`body` tag. If you set up your reset correctly, these styles will nicely trickle
down to all child elements going forward.

The next step is to analyze the screenshots. You want to start thinking of
everything as being contained in boxes. You see an outer red box that expands to
the full width, with a fixed width box inside it. On the left you see the "App
Academy Friends" logo heading and on the right, a list of links. How would you
express these meanings using semantic tags?

Let's look at [this list][tags] of tags. Try using the `<header>`, `<nav>`,
`<h1>`, `<ul>` and `<li>` tags to express your structure. Go ahead and write the
skeleton in HTML.

Now add text and links. As you'll be adding dummy links throughout this project,
use a pound sign as the href: `<a href="#">`. That will prevent a page reload.

Now that you have some structured markup in place, let's add some nice classes
as hooks to select. Start by adding an outer `.header` class, for the full bar.
Then add a `.header-nav` class for the fixed width container inside. You'll
probably also want to add `.header-logo` and `.header-list` classes to the
`<h1>` and `<ul>` elements, respectively, as this will keep your selectors nice
and shallow. Avoid adding classes to the individual `<li>`s, as you can select
them by their parent.

With these classes in your HTML, jump to the __./css/01-header.css__ file and
make an outline of all the classes you added as selectors. Now go fill them out
with actual styles. Make small changes, immediately refreshing in your browser
to see the changes. Your understanding will grow by experimenting!

To center a smaller block element inside a larger block element, you'll want to
set its left and right margins to `auto`. Since block elements cannot sit next
to each other normally, you're going to need to use `flex`. It's OK to flex
things inside of flexed things.

You'll want to justify your logo `<h1>` to the left and the `<ul>` list of
links to the right. To get the individual `<li>` next to each other you'll want
to use `flex` again.

It can be helpful to give elements a temporary background color to see their
appearance while debugging.

As you put paddings in place, remember that usability is important. You want
large click targets. Make your links `block` elements and add padding to them.
Also, do not forget the hover states: this is important and gratifying feedback
for the user.

Pixel perfect? Good!

[ss-01-a]:
  http://assets.aaonline.io/fullstack/html-css/micro-projects/css-friends/docs/screenshots/01-header-a.png
[ss-01-b]:
  http://assets.aaonline.io/fullstack/html-css/micro-projects/css-friends/docs/screenshots/01-header-b.png
[live-01]: http://appacademy.github.io/css-friends/solution/01-header.html
[t-webfonts]: http://en.wikipedia.org/wiki/Web_typography
[t-google-fonts]: https://www.google.com/fonts
[t-font-weight]: http://css-tricks.com/almanac/properties/f/font-weight/
[t-flex]: https://css-tricks.com/snippets/css/a-guide-to-flexbox/
[t-border]: http://css-tricks.com/almanac/properties/b/border/
[tags]: https://developer.mozilla.org/en-US/docs/Web/HTML/Element

## Phase 2: Notifications

### Topics

- [Border-radius][t-border-radius]
- [z-index]
- Positioning (see CSS Positioning reading)
- [Overflow][t-overflow]
- Display (see CSS Display reading)
- [White-space][t-white-space]

### Screenshots

- [Screenshot A][ss-02-a]
- [Screenshot B][ss-02-b]
- [Screenshot C][ss-02-c]
- [Live][live-02]

You're adding notifications! Add an inline badge inside the notifications `<a>`
tag. Give it the reusable `.badge` class and style it round as a circle. You'll
want to tweak the padding to get it just right.

For the dropdown, start by nesting a new list of notification list elements
inside of the original notification list element. Add it right below the `<a>`
tag. You'll see how it stretches the whole header bar down. It sort of looks
right, if only you could lift it out of the document flow, and have it not
stretch its parent. Aha, you say! Positioning! Remember to create a coordinate
system you control by setting its parent to `relative` position.

The trick to hiding and showing the dropdown is combining the `:hover` selector
and the display property. How would you select the dropdown when someone hovers
over the parent notification list item?

If you'd like a hint at this point, check out this amazing [cat with
glasses][t-glasses-demo] demo.

To keep the notification text on one line you may use the `white-space`
property.

As you add borders to everything, make sure to nudge the dropdown to line up
nicely with vertical lines in the navigation bar. Finally, you may have issues
with a list item poking through the bottom rounded edges. Fix this using the
`overflow` property.

Before moving on to Phase 3, add a `z-index` of `1` to the whole header bar. To
do this, you will also have to set the `position` property to `relative`, as
`z-index` does not work on static, non-positioned, elements. This should not
change anything visually as-is, but it will ensure that your header dropdown
will stay on top as you move on and add more to the page.

Pat yourself on the back, you've earned it! By now you've covered the core
concepts of CSS. Things will just get easier and _way_ more fun!

Show off your dropdown to an Instructor.

[ss-02-a]:
  http://assets.aaonline.io/fullstack/html-css/micro-projects/css-friends/docs/screenshots/02-notifications-a.png
[ss-02-b]:
  http://assets.aaonline.io/fullstack/html-css/micro-projects/css-friends/docs/screenshots/02-notifications-b.png
[ss-02-c]:
  http://assets.aaonline.io/fullstack/html-css/micro-projects/css-friends/docs/screenshots/02-notifications-c.png
[live-02]:
  http://appacademy.github.io/css-friends/solution/02-notifications.html
[t-border-radius]:
  https://developer.mozilla.org/en-US/docs/Web/CSS/border-radius
[z-index]: https://developer.mozilla.org/en-US/docs/Web/CSS/z-index
[t-overflow]: https://developer.mozilla.org/en-US/docs/Web/CSS/overflow
[t-white-space]: https://developer.mozilla.org/en-US/docs/Web/CSS/white-space
[t-glasses-demo]: http://appacademy.github.io/css-demos/positioning.html

## Phase 3: Layout

### Topics

- [Flex][flex]
- [Pseudo-content][pseudo-content]
- Positioning (see CSS Positioning reading)

### Screenshots

- [Screenshot A][ss-03-a]
- [Live][live-03]

Make a `.content` container, with a `.content-sidebar` section and a
`.content-main` section in it. Give them widths and paddings and position them
next to each other. As they do not have content yet, set a `min-height` property
to `200px` to ensure they have some height, even when empty. Set temporary
background colors on the elements to verify that they are properly next to each
other and the correct size.

Often there are many ways you can create whitespace using CSS. You have a choice
of `margin` and `padding` and there are usually various elements to which you
could add these to end up with the same, correct appearance. In this case, if
you look [ahead][live-10] a bit, you'll see that inside the `.content-sidebar`
and `.content-main` there's white space all around, inside these sections.
Nowhere are the edges/borders touched, except for the big profile image, which
is a special case. When that is the case, it makes sense to pick the most DRY
solution and add padding to these sections rather than to the child elements
inside.

Add a border to visually separate `.content-sidebar` and `.content-main`.

[flex]: https://css-tricks.com/snippets/css/a-guide-to-flexbox/
[ss-03-a]:
  http://assets.aaonline.io/fullstack/html-css/micro-projects/css-friends/docs/screenshots/03-layout-a.png
[live-03]: http://appacademy.github.io/css-friends/solution/03-layout.html
[live-10]: http://appacademy.github.io/css-friends/solution/10-posts.html
[pseudo-content]: https://www.w3schools.com/css/css_pseudo_elements.asp

## Phase 4: Footer

### Topics

- [Flex][flex]
- [Border-radius][t-border-radius]

### Screenshots

- [Screenshot A][ss-04-a]
- [Screenshot B][ss-04-b]
- [Live][live-04]

Add the footer to the bottom of the document. It does not need to be nested
inside the `.content` container but can be top level. You should be getting the
hang of this by now! Hint, hint, use `display` and `justify-content`! Pay close
attention to colors and typography.

[ss-04-a]: http://assets.aaonline.io/fullstack/html-css/micro-projects/css-friends/docs/screenshots/04-footer-a.png
[ss-04-b]: http://assets.aaonline.io/fullstack/html-css/micro-projects/css-friends/docs/screenshots/04-footer-b.png
[live-04]: http://appacademy.github.io/css-friends/solution/04-footer.html

## Phase 5: Cats

### Topics

- [Background-size][t-background-size]
- Positioning (See "CSS Positioning" under **References** in the sidebar)
- [Text-shadow][t-text-shadow]

### Screenshots

- [Screenshot A][ss-05-a]
- [Screenshot B][ss-05-b]
- [Live][live-05]

Create a `.content-header` section and put it at the top inside of the
`.content` container, above the sidebar and main section. Give it a height and
use the supplied __../images/cats.jpg__ as a background. Make sure the
background image covers the full section.

Add a heading and button and position them absolute at the bottom. To keep the
heading legible on a varied background, use the `text-shadow` property to
increase contrast.

For headings with a large `font-size` that do not wrap multiple lines, decrease
the `line-height` as it will add a decent chunk of additional space above and
below the words, which is only needed if you have multiple lines. Let's get rid
of that space by setting `line-height` to `1` on your header.

[ss-05-a]:
  http://assets.aaonline.io/fullstack/html-css/micro-projects/css-friends/docs/screenshots/05-cats-a.png
[ss-05-b]:
  http://assets.aaonline.io/fullstack/html-css/micro-projects/css-friends/docs/screenshots/05-cats-b.png
[live-05]: http://appacademy.github.io/css-friends/solution/05-cats.html
[t-background-size]:
  https://developer.mozilla.org/en-US/docs/Web/CSS/background-size
[t-text-shadow]: https://developer.mozilla.org/en-US/docs/Web/CSS/text-shadow
