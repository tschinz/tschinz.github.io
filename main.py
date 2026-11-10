"""Macros for the site, loaded by the Zensical macros extension."""

import posixpath
import re
from pathlib import Path


def define_env(env) -> None:
    docs_dir = Path(env.project_dir) / env.conf.get("docs_dir", "docs")

    def page_title(path: str) -> str:
        """Title of a page without a nav title: front matter title, first H1, or file name."""
        try:
            text = (docs_dir / path).read_text(encoding="utf-8")
        except (OSError, UnicodeDecodeError):
            text = ""
        front = text.split("\n---", 1)[0] if text.startswith("---") else ""
        m = re.search(r"^title:\s*(.+)$", front, re.MULTILINE) or re.search(
            r"^#\s+(.+)$", text, re.MULTILINE
        )
        return m.group(1).strip() if m else Path(path).stem

    def find_section(items: list[dict], path: str) -> list[dict] | None:
        """Nav list holding the page, preferring the section whose index it is."""
        found = None
        for item in items:
            children = item["children"]
            if children:
                if children[0]["url"] == path:
                    return children
                found = found or find_section(children, path)
            elif item["url"] == path and found is None:
                found = items
        return found

    def render(items: list[dict], here: str, depth: int = 0) -> list[str]:
        lines = []
        for item in items:
            pad = "    " * depth
            if item["children"]:
                lines.append(f"{pad}- {item['title']}")
                lines += render(item["children"], here, depth + 1)
            else:
                url = item["url"]
                link = url if "://" in url else posixpath.relpath(url, here)
                lines.append(f"{pad}- [{item['title'] or page_title(url)}]({link})")
        return lines

    @env.macro
    def subnav() -> str:
        """Markdown list of the current page's siblings in the nav, like the former pagenav-generator {nav}."""
        path = env.page.path
        section = find_section(env.conf.get("nav") or [], path) or []
        siblings = [item for item in section if item["url"] != path]
        return "\n".join(render(siblings, posixpath.dirname(path)))
