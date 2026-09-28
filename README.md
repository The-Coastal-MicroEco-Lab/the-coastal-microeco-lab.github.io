## Welcome!

This is the repository underlying the Coastal MicroEco Lab website. It was built using [Quarto](https://quarto.org/) and you can see [the rendered website](https://github.com/coastal-microeco-lab/the-coastal-microeco-lab.github.io/).

## Issues

If you see something wrong or a page seems broken, please [post an Issue](https://github.com/The-Coastal-MicroEco-Lab/the-coastal-microeco-lab.github.io/issues) and we'll fix the problem ASAP. Thanks!

# Updating the Coastal MicroEco Lab Website

This website is built with [Quarto](https://quarto.org/) and published through GitHub Pages. Most routine website updates will **not** require editing the underlying HTML or CSS.

This guide covers the most common changes lab members may want to make.

## Before you start

#### You will need:

- Access to the lab GitHub repository (ask Ashley for access if you don't have it)
- Git installed on your computer (Software Carpentry maintains up-to-date [instructions](https://swcarpentry.github.io/git-novice/#installing-git) for how to do this on Windows, Mac, or Linux operating systems)
- Quarto [installed](https://quarto.org/docs/download/) if you want to preview the website locally (if you use Rstudio, we recommend using Quarto within RStudio, RStudio v2022.07 and greater have it installed already)
- Python and the packages listed in `requirements.txt` if you are updating content that depends on the site's preprocessing scripts (this is only the bibliography section, currently)

Optional, but nice:

- RStudio can be used for editing and modifying Quarto documents and can also sync with git and GitHub. If, you have RStudio installed all website updates can be done within RStudio

#### Clone the repository:

*'Cloning' creates a local copy of the repository on your computer that is linked to the github website*

If using the terminal:

``` bash
git clone <repository-url>
cd CoastalMicroEco
```

If you're using Rstudio:

- File \> New Project

- Select "Version Control", the "Git".

- Paste the url of the repository into the "Repository URL:" field.

- If you want to change the default location that the repository folder will be housed, click "Browse" and select the updated location.

- Click "Create Project" to finish the setup.

#### After cloning, (or if you are coming to make changes a second time):

Update your local copy before making any changes.

In the terminal:

``` bash
git pull
```

In Rstudio:

- Click on the "Git" tab in the upper right-hand pane.

- Click "Pull" to pull changes

We prefer that you create a new branch for any changes:

In the terminal:

``` bash
git checkout -b <yourname>-website-update
```

In Rstudio:

- From the Git tab, click "New Branch"

- Type the name of the new branch in the field. "<yourname>-website-update"

- Click "Create"

------------------------------------------------------------------------

## Previewing the website locally

In Rstudio, click the "Terminal" tab in the console pane. Or open a new terminal window and navigate to the main repository directory.

From the main repository directory, run:

``` bash
quarto preview
```

Quarto will build the site and open a local version in your browser.

The preview usually updates automatically when you save changes.

To exit the preview press "Ctrl + C" (or on Macs, "Cmd + C")

Before submitting changes, it is also useful to make sure the entire site renders successfully:

``` bash
quarto render
```

## Saving and updating the website

- Once you have made the changes you'd like and tested the rendering of the website successfully you can send the changes to github for review by Ashley or another lab member.

- Stage and commit those changes.

  ``` bash
  git add <file that was changed>
  git commit -m <commit message>
  ```

  Or in Rstudio, use the commit dialogue to stage and commit the changes.

- Once you have the updates you want committed to your branch, push the branch to the website.

  ``` bash
  git push -u origin <your-branch-name>
  ```

  Or, in RStudio, click "Push" in the Git tab.

- Go to the repository webpage: <https://github.com/The-Coastal-MicroEco-Lab/the-coastal-microeco-lab.github.io>

  You should see a yellow banner at the top announcing your branch being pushed, and a green button saying "Compare & pull request"

- Click on the green button, then write a description of your changes, and tag any user who you want to review your changes.

- Whomever you tag, can then review the changes, make sure everything is going to work properly, and then click the green "Merge pull request" button.

- The website automatically re-renders whenever a commit is pushed to the main branch.

## Reviewing and approving pull requests

When someone tags you in a pull request, you will get a notification and probably an email from github. Click on the link in that notification to see their pull request.

Alternatively, you can click on the "pull requests" tab on the github repo webpage.

1.  First check the "files changed" tab to see what files were changed. Added lines are in green, deleted lines are in red.

2.  Optional, but recommended: Check out the changes and make sure the website renders properly. You will need the pull request reference number, which is usually found at the top of the pull request page after the title:

    For example: "Adds code review instructions to the github readme. #2", 2 is the number.

    ``` bash
    # Fetch the pull request reference and create a new local branch named pr-branch
    git fetch origin pull/<pr-number>/head:pr-branch

    # Switch to the newly created branch
    git checkout pr-branch

    # Check all is okay
    quarto preview

    # Check the render goes smoothly
    quarto render
    ```

If the website renders properly, and everything looks good, you can approve the pull request (green button: "Merge pull request"), if not, leave a comment on the discussion with any changes you want them to make and commit before the merge.

Any updates that are made to the branch during this process, will automatically be added to the pull request, and can be previewed and tested by replacing "fetch" with pull as above.

    ``` bash
    # Pull updates to the pull request reference to local branch named pr-branch
    git pull origin pull/<pr-number>/head:pr-branch

    # Switch to the newly created branch (if you aren't already on it)
    git checkout pr-branch

    # Check all is okay
    quarto preview

    # Check the render goes smoothly
    quarto render
    ```

Once the branch is merged, the website will automatically update to include the changes. 

------------------------------------------------------------------------

# Details for Specific Update Tasks

## Adding or updating a lab member

Lab member information is used to generate the **People** page.

When adding a new member, follow the format already used by existing members. There is a file called `_example_person.qmd` that can be used as a template.

Include information such as:

- Name
- Role
- Research interests
- Short biography
- Education
- Relevant links, such as:
  - ORCID
  - Google Scholar
  - GitHub
  - Personal or professional website
- Photo, if desired (the default will be the lab logo, otherwise)
- If you have any publications that will show up on the website and the name you use in your bio does not match the spelling used in the publication, you can add "publication names" to make sure your name is in bold.

### Photos

Place new profile photos in the `/images/profiles` folder used by the existing member photos.

For consistency:

- Use a reasonably high-resolution image.
- Crop excess background when possible.
- Avoid extremely large image files.
- Use descriptive filenames, such as:

``` text
jane-doe.jpg
```

### Alumni

When moving a former lab member to the alumni section, preserve their existing information when possible and add their current position if known.

Alumni cards do not have photos associated with them, so space can be saved in the repository by deleting those photos.

Simply changing a lab member's status to "alumni" will move them to that section. There is also an example alumni file: `_example_alumni.qmd`.

------------------------------------------------------------------------

## Adding a news post or announcement

News items and lab updates are stored as Quarto posts.

Name the post using a short, descriptive name:

``` text
posts/
└── new-paper-2026.qmd
└── index.qmd
```

A post should generally include metadata at the top of the file:

``` yaml
---
title: "Our new paper is published"
date: 2026-09-28
description: "A short description of the announcement."
---
```

Write the post below the YAML header using normal Markdown.

For example:

``` markdown
We are excited to share our new paper on microbial responses to environmental change.

[Read the paper](LINK)
```

### Featuring a post on the homepage

The homepage displays a small number of featured announcements.

If you want a new post to appear there, add "featured: true" to the header of the post.

``` markdown
---
date: 2026-09-08
description: "Welcome to our newest lab member!"
featured: true
---
```

Remove an older featured item if necessary so that the homepage does not become overcrowded.

------------------------------------------------------------------------

## Updating publications

Publications are generated from the bibliography files stored with the website rather than being entered manually into the publications page.

Add or update the appropriate `.bib` file in the publications bibliography directory.

A BibTeX entry might look like:

``` bibtex
@article{doe2026microbes,
  title   = {Microbial ecology of an interesting environment},
  author  = {Doe, Jane and Smith, Alex},
  journal = {Journal of Microbial Ecology},
  year    = {2026},
  volume  = {12},
  pages   = {1--10},
  doi     = {10.xxxx/example}
}
```

The site's publication-generation script processes these files and organizes publications for display. When run, it will automatically check Ashley's scholar page and add those items to a .bib file.

Other publications not on the scholar page can be added manually with .bib files of their own.

The script attempts to remove duplicates, but may not be perfect.

Lab-member names may also receive special formatting, so check existing entries for consistent author formatting.

If publication generation fails, make sure the required Python packages are installed:

``` bash
pip install -r requirements.txt
```

Then try rendering the site again:

``` bash
quarto render
```

------------------------------------------------------------------------

## Adding images or other files

Store website assets (e.g. files, or photos) in the `files` or `image` directories rather than placing them in the repository root.

Use descriptive filenames:

``` text
salt-marsh-sampling-2026.jpg
```

rather than:

``` text
IMG_4827.jpg
```

For images used on webpages:

- Prefer `.jpg`, `.png`, or `.webp`.
- Resize very large photographs before committing them. Github will flag free accounts with repositories \>1Gb in size. And there is a soft cap of 5Gb.
- Use relative paths to specify the location of the images (for example use "../" to indicate moving up one directory).
- Include meaningful alt text when adding images to pages.

Example:

``` markdown
![Lab members collecting samples in a salt marsh.](../images/salt-marsh-sampling-2026.jpg){fig-alt="three people surround a peat corer in a salt marsh."}
```

------------------------------------------------------------------------

## Editing an existing page

Most pages are written in Quarto Markdown files (`.qmd`).

For most pages all page content is contained in a folder whose name corresponds to that page.

- the landing page for each page is controlled by `index.qmd`

- individual posts, or sub-pages are specified by individual `.qmd` documents

Example:

``` text
posts/
└── new-paper-2026.qmd
└── index.qmd
research/
└── coastal-microbiomes.qmd
└── index.qmd
```

The exception are the lab handbook and "links and resources" page which are housed in the repository root and contain both the index material and page content in a single file.

#### Editing:

Text can be edited directly.

Basic Markdown formatting includes:

``` markdown
# Main heading

## Section heading

**bold text**

*italic text*

[link text](https://example.com)
```

If you don't want to navigate the Markdown, Rstudio provides a helpful "visual" editor which previews the output.

Try to preserve the structure and formatting of the existing page when making small updates.

------------------------------------------------------------------------

## Adding research content

Research content should be placed in the existing research section rather than added directly to the homepage.

When creating a new research page:

1.  Copy the structure of an existing research page.
2.  Update its title and content.
3.  Add images where appropriate.
4.  Add the page to the website navigation if it should appear in the menu.

Whenever possible, describe research for a broad scientific audience.

------------------------------------------------------------------------

## Changing the site's appearance

The site's colors, cards, image behavior, spacing, and other visual elements are controlled primarily through the site's `.scss` and configuration files which are stored in sub-directories of `_extensions\`.

Only edit these files if you intend to make a site-wide design change.

Changes to stylesheets can affect many pages at once, so always preview the full website afterward:

``` bash
quarto preview
```

If you only want to change the content of a page, you probably **do not need to edit the SCSS**.

More details about specifics of the site's .scss files can be found in the `README.md` file in the `_extensions` folder. 
------------------------------------------------------------------------

## Website analytics

The website uses GoatCounter for privacy-friendly visitor analytics.

Analytics configuration is part of the website setup and normally does not need to be changed when adding or editing content.

------------------------------------------------------------------------

## Before committing your changes

Please check:

- The website renders without errors.
- Links work.
- Images appear correctly.
- Names and titles are spelled correctly.
- Dates use the same format as existing content.
- New pages appear in the intended navigation or listing.
- No temporary files or very large source files were accidentally added.

You can see which files have changed with:

``` bash
git status
```

Then commit your changes:

``` bash
git add .
git commit -m "Update lab website"
git push
```

If you created a branch, push the branch instead:

``` bash
git push -u origin update-website
```

Then open a pull request on GitHub.

------------------------------------------------------------------------

## Publishing

The website is published automatically using GitHub Actions.

In most cases, you should **not** need to manually publish the site.

After changes are merged into the publishing branch, check the repository's **Actions** tab on GitHub to confirm that the website build completed successfully.

A successful build means the updated site should appear on the lab website shortly afterward.

If the build fails, click the failed GitHub Actions run and look near the bottom of the log for the first relevant error message.

Common causes include:

- Invalid YAML at the top of a `.qmd` file
- Missing files or incorrect file paths
- Invalid BibTeX
- Missing Python dependencies
- Broken Quarto configuration

------------------------------------------------------------------------

## Good practices

When updating the site:

- Make one logical change at a time when possible.
- Use descriptive filenames.
- Use descriptive commit messages.
- Preview changes before submitting them.
- Do not delete files unless you know they are no longer used.
- Avoid changing site-wide configuration for simple content updates.
- Follow existing pages as templates rather than rebuilding formatting from scratch.

For example, a useful commit message is:

``` text
Add Jane Doe to people page
```

rather than:

``` text
updates
```

------------------------------------------------------------------------

## If something breaks

First, try:

``` bash
quarto render
```

The error message will often identify the page or file causing the problem.

Also check:

``` bash
git status
```

to see which files you recently changed.

If the site worked before your changes, Git can show exactly what changed:

``` bash
git diff
```

If you are unsure how to fix the problem, **do not delete or substantially rewrite the website configuration**. Open an issue or ask another lab member for help and include:

- What you were trying to change
- The command you ran
- The complete error message
- The files you changed

That information makes website problems much easier to diagnose.
