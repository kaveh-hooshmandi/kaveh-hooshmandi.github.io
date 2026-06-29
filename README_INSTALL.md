# Installation instructions for kaveh-hooshmandi.github.io

This package adds an open course section called **Applied Control Systems** to the Jekyll / GitHub Pages website.

## Files included

- `_pages/control-systems.md`
- `_pages/control-systems-syllabus.md`
- `_pages/control-systems-lectures.md`
- `_pages/control-systems-slides.md`
- `_pages/control-systems-labs.md`
- `_pages/control-systems-assignments.md`
- `_pages/control-systems-projects.md`
- `_pages/control-systems-assistant.md`
- `assets/css/control-course.css`
- `assets/js/control-course-agent.js`
- `courses/control-systems/slides/week01.md`
- `courses/control-systems/slides/week08.md`
- `courses/control-systems/slides/week10.md`

## How to install manually

1. Download and unzip this package.
2. Copy the folders `_pages`, `assets`, and `courses` into the root of your GitHub Pages repository.
3. If asked to merge folders, choose merge.
4. Add a navigation link to `_data/navigation.yml`.
5. Commit and push the changes.

## Suggested navigation entry

Add this item to the main navigation list in `_data/navigation.yml`:

```yaml
- title: "Courses"
  url: /courses/control-systems/
```

If your `navigation.yml` uses a structure like `main:`, add it under `main:` with the same indentation as the other menu items.

## Git commands

```bash
git add _pages/control-systems* assets/css/control-course.css assets/js/control-course-agent.js courses/control-systems
git commit -m "Add Applied Control Systems open course"
git push
```

## Local testing

```bash
bundle exec jekyll serve
```

Then open:

```text
http://127.0.0.1:4000/courses/control-systems/
```

## Notes

The included course assistant is a local keyword-based assistant. It does not use an external AI API and does not expose any API key in the browser. A real AI backend can be added later using a serverless function such as Cloudflare Workers, Vercel Functions, or Netlify Functions.
