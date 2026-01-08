# Sphinx configuration (EN) - 参考 HoneyGUI 风格
import os
import sys
from datetime import datetime

project = 'Display Wiki'
author = 'Display Wiki'
release = 'v0.1'

# General
extensions = [
    'myst_parser',
    'sphinx_copybutton',
    'sphinxcontrib.mermaid',
    'sphinx_rtd_theme',
]
myst_enable_extensions = [
    'colon_fence',
    'attrs_block',
    'attrs_inline',
    'linkify',
]
templates_path = ['_templates']
exclude_patterns = []
source_suffix = {
    '.rst': 'restructuredtext',
    '.md': 'markdown',
}

# HTML
html_theme = 'sphinx_rtd_theme'
html_static_path = ['_static']
html_logo = '_static/image/logo.png'
html_favicon = '_static/image/favicon.ico'
html_show_sourcelink = False
html_show_copyright = False
html_show_sphinx = False

html_css_files = [
    'css/auto.number.title.css',
    'css/custom.css',
]

html_theme_options = {
    'collapse_navigation': False,
    'logo_only': True,
    'navigation_depth': 10,
    'sticky_navigation': True,
    'includehidden': True,
    'titles_only': False,
}

language = 'en'
master_doc = 'index'
