# unfug.org

This repository contains the unfug.org page sources.

## Notes for what would be great on the website

We need:

* History of talks already done
* Schedule
* Entries for each talk, including references, etc.
* About
* ical / calendar entries
* RSS / ATOM Feeds
* New design (of course)
* Site for special events: { Golfing, Challenges, Trips to CCC, LUGS } -> Blog
* Source code highlighting
* The talk-pages should be able to have the slides, which shouldn't be in the
  git repository. How to do this properly?

## Ideas

Compile Schedule / History (which really should be one thing) from single
entries. An Entry should contain a header field where a date is set, when the
talk will be held. The compiler should only compile articles which are
relevant.

Header fields for entries:

    - Author / Referee
    - Date for the talk
    - Title of the talk
    - Summary of the talk
    - Free text
    - Additional resources for the talk

